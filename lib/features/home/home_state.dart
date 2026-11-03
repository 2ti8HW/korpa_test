part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.currencies = const [],
    this.rates,
    this.fromCurrency = 'usd',
    this.toCurrency = 'eur',
    this.fromAmount,
    this.toAmount,
    this.isLoading = false,
    this.error,
  });

  final List<Currency> currencies;
  final ExchangeRates? rates;
  final String fromCurrency;
  final String toCurrency;
  final double? fromAmount;
  final double? toAmount;
  final bool isLoading;
  final String? error;

  double? get rate => rates?.rate(fromCurrency, toCurrency);

  List<Currency> get availableCurrencies {
    final rates = this.rates;
    if (rates == null) return const [];
    return currencies
        .where((c) => rates.contains(c.code))
        .toList();
  }

  @override
  List<Object?> get props => [
    currencies,
    rates,
    fromCurrency,
    toCurrency,
    fromAmount,
    toAmount,
    isLoading,
    error,
  ];

  HomeState copyWith({
    List<Currency>? currencies,
    ExchangeRates? Function()? rates,
    String? fromCurrency,
    String? toCurrency,
    double? Function()? fromAmount,
    double? Function()? toAmount,
    bool? isLoading,
    String? Function()? error,
  }) {
    return HomeState(
      currencies: currencies ?? this.currencies,
      rates: rates != null ? rates() : this.rates,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      fromAmount: fromAmount != null ? fromAmount() : this.fromAmount,
      toAmount: toAmount != null ? toAmount() : this.toAmount,
      isLoading: isLoading ?? this.isLoading,
      error: error != null ? error() : this.error,
    );
  }
}
