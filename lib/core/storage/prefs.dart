import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/currency.dart';
import '../../models/exchange_rates.dart';
import '../../models/history_entry.dart';

@singleton
class Prefs {
  Prefs._(this._prefs);

  @FactoryMethod(preResolve: true)
  static Future<Prefs> create() async =>
      Prefs._(await SharedPreferences.getInstance());

  static const String currenciesKey = 'currencies';
  static const String ratesKey = 'rates';
  static const String historyKey = 'history';

  final SharedPreferences _prefs;

  List<Currency>? getCurrencies() {
    final list = _readJson(currenciesKey);
    if (list is! List<dynamic>) return null;
    return list
        .map((e) => Currency.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> setCurrencies(List<Currency> currencies) => _prefs.setString(
    currenciesKey,
    jsonEncode(currencies.map((e) => e.toJson()).toList()),
  );

  ExchangeRates? getRates() {
    final json = _readJson(ratesKey);
    if (json is! Map<String, dynamic>) return null;
    return ExchangeRates.fromJson(json);
  }

  Future<void> setRates(ExchangeRates rates) =>
      _prefs.setString(ratesKey, jsonEncode(rates.toJson()));

  List<HistoryEntry>? getHistory() {
    final list = _readJson(historyKey);
    if (list is! List<dynamic>) return null;
    return list
        .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> setHistory(List<HistoryEntry> history) => _prefs.setString(
    historyKey,
    jsonEncode(history.map((e) => e.toJson()).toList()),
  );

  Object? _readJson(String key) {
    final raw = _prefs.getString(key);
    if (raw == null) return null;
    try {
      return jsonDecode(raw);
    } on FormatException {
      return null;
    }
  }
}
