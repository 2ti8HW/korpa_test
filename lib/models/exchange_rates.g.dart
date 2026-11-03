// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExchangeRates _$ExchangeRatesFromJson(Map<String, dynamic> json) =>
    _ExchangeRates(
      date: DateTime.parse(json['date'] as String),
      base: json['base'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$ExchangeRatesToJson(_ExchangeRates instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'base': instance.base,
      'rates': instance.rates,
    };
