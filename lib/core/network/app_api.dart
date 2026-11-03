import 'package:injectable/injectable.dart';

import '../../models/currency.dart';
import '../../models/exchange_rates.dart';
import 'network.dart';

@lazySingleton
class AppApi {
  AppApi() : _network = Network(baseUrl: jsdelivrServer);

  static const String jsdelivrServer =
      'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api';

  final Network _network;

  Future<List<Currency>> getCurrencies({DateTime? date}) async {
    final json = await _network.get<Map<String, dynamic>>(
      '@${_version(date)}/v1/currencies.json',
    );
    return json.entries
        .map((e) => Currency(code: e.key, name: e.value as String))
        .toList();
  }

  Future<ExchangeRates> getRates(String base, {DateTime? date}) async {
    final code = base.toLowerCase();
    final json = await _network.get<Map<String, dynamic>>(
      '@${_version(date)}/v1/currencies/$code.json',
    );
    return ExchangeRates.fromResponse(code, json);
  }

  String _version(DateTime? date) {
    if (date == null) return 'latest';
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }
}
