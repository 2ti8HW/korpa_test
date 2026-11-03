import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rates.freezed.dart';
part 'exchange_rates.g.dart';

@freezed
abstract class ExchangeRates with _$ExchangeRates {
  const ExchangeRates._();

  const factory ExchangeRates({
    required DateTime date,
    required String base,
    required Map<String, double> rates,
  }) = _ExchangeRates;

  factory ExchangeRates.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesFromJson(json);

  factory ExchangeRates.fromResponse(String base, Map<String, dynamic> json) {
    final rates = json[base] as Map<String, dynamic>;
    return ExchangeRates(
      date: DateTime.parse(json['date'] as String),
      base: base,
      rates: rates.map(
        (code, rate) => MapEntry(code, (rate as num).toDouble()),
      ),
    );
  }

  bool contains(String code) => code == base || rates.containsKey(code);

  double? rate(String from, String to) {
    final fromRate = from == base ? 1.0 : rates[from];
    final toRate = to == base ? 1.0 : rates[to];
    if (fromRate == null || toRate == null || fromRate == 0) return null;
    return toRate / fromRate;
  }
}
