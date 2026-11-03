import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/currency.dart';

part 'currency_picker_bloc.freezed.dart';
part 'currency_picker_event.dart';
part 'currency_picker_state.dart';

@injectable
class CurrencyPickerBloc extends Bloc<CurrencyPickerEvent, CurrencyPickerState> {
  CurrencyPickerBloc(@factoryParam List<Currency> currencies, @factoryParam String selected)
    : super(CurrencyPickerState(currencies: currencies, filtered: currencies, selected: selected)) {
    on<_QueryChanged>(_onQueryChanged);
  }

  void _onQueryChanged(_QueryChanged event, Emitter<CurrencyPickerState> emit) {
    final query = event.query.trim().toLowerCase();
    final filtered = query.isEmpty
        ? state.currencies
        : state.currencies.where((c) => c.code.contains(query) || c.name.toLowerCase().contains(query)).toList();
    emit(state.copyWith(query: event.query, filtered: filtered));
  }
}
