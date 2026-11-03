part of 'currency_picker_bloc.dart';

class CurrencyPickerState extends Equatable {
  const CurrencyPickerState({
    required this.currencies,
    required this.filtered,
    required this.selected,
    this.query = '',
  });

  final List<Currency> currencies;
  final List<Currency> filtered;
  final String selected;
  final String query;

  @override
  List<Object?> get props => [currencies, filtered, selected, query];

  CurrencyPickerState copyWith({
    List<Currency>? currencies,
    List<Currency>? filtered,
    String? selected,
    String? query,
  }) {
    return CurrencyPickerState(
      currencies: currencies ?? this.currencies,
      filtered: filtered ?? this.filtered,
      selected: selected ?? this.selected,
      query: query ?? this.query,
    );
  }
}
