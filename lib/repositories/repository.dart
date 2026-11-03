import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../core/network/app_api.dart';
import '../core/storage/prefs.dart';
import '../models/currency.dart';
import '../models/exchange_rates.dart';
import '../models/history_entry.dart';

@lazySingleton
class Repository extends ChangeNotifier {
  Repository(this._api, this._prefs);

  static const String baseCurrency = 'usd';

  final AppApi _api;
  final Prefs _prefs;

  List<Currency> _currencies = const [];
  ExchangeRates? _rates;
  Future<void>? _networkLoading;

  List<Currency> get currencies => _currencies;
  ExchangeRates? get rates => _rates;

  bool loadFromCache() {
    final currencies = _prefs.getCurrencies();
    final rates = _prefs.getRates();
    if (currencies == null || rates == null) return false;

    _currencies = currencies;
    _rates = rates;
    notifyListeners();
    return true;
  }

  Future<void> loadFromNetwork() => _networkLoading ??= _fetchFromNetwork()
      .whenComplete(() => _networkLoading = null);

  Future<void> _fetchFromNetwork() async {
    final currencies = await _api.getCurrencies();
    final rates = await _api.getRates(baseCurrency);
    await _prefs.setCurrencies(currencies);
    await _prefs.setRates(rates);

    _currencies = currencies;
    _rates = rates;
    notifyListeners();
  }

  List<HistoryEntry> getHistory() =>
      (_prefs.getHistory() ?? const []).reversed.toList();

  HistoryEntry? getLastHistoryEntry() {
    final history = _prefs.getHistory();
    return history == null || history.isEmpty ? null : history.last;
  }

  Future<void> addHistoryEntry(HistoryEntry entry) =>
      _prefs.setHistory([...?_prefs.getHistory(), entry]);
}
