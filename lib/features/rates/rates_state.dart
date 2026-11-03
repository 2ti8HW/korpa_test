part of 'rates_bloc.dart';

class RatesState extends Equatable {
  const RatesState({this.currencies = const [], this.rates, this.base = 'usd'});

  final List<Currency> currencies;
  final ExchangeRates? rates;

  final String base;

  List<Currency> get availableCurrencies {
    final rates = this.rates;
    if (rates == null) return const [];
    return currencies.where((c) => rates.contains(c.code)).toList();
  }

  List<Currency> get listed =>
      availableCurrencies.where((c) => c.code != base).toList();

  double? priceOf(String code) => rates?.rate(code, base);

  @override
  List<Object?> get props => [currencies, rates, base];

  RatesState copyWith({
    List<Currency>? currencies,
    ExchangeRates? Function()? rates,
    String? base,
  }) {
    return RatesState(
      currencies: currencies ?? this.currencies,
      rates: rates != null ? rates() : this.rates,
      base: base ?? this.base,
    );
  }
}
