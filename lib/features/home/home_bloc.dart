import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/network_exception.dart';
import '../../core/utils/amount_format.dart';
import '../../models/currency.dart';
import '../../models/exchange_rates.dart';
import '../../models/history_entry.dart';
import '../../repositories/repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository) : super(_initialState(_repository)) {
    on<_Started>((_, emit) => _loadFromNetwork(emit));
    on<_Refreshed>((_, emit) => _loadFromNetwork(emit));
    on<_RepositoryChanged>(_onRepositoryChanged);
    on<_FromAmountChanged>(_onFromAmountChanged);
    on<_ToAmountChanged>(_onToAmountChanged);
    on<_FromCurrencySelected>(_onFromCurrencySelected);
    on<_ToCurrencySelected>(_onToCurrencySelected);
    on<_Swapped>(_onSwapped);
    _repository.addListener(_onRepositoryNotified);
  }

  final Repository _repository;

  static HomeState _initialState(Repository repository) {
    final last = repository.getLastHistoryEntry();
    final state = HomeState(currencies: repository.currencies, rates: repository.rates, fromAmount: 1);
    return _recalculated(last == null ? state : state.copyWith(fromCurrency: last.from, toCurrency: last.to));
  }

  static HomeState _recalculated(HomeState state) {
    final fromAmount = state.fromAmount;
    final rate = state.rate;
    return state.copyWith(toAmount: () => fromAmount == null || rate == null ? null : fromAmount * rate);
  }

  void _onRepositoryNotified() => add(const HomeEvent.repositoryChanged());

  Future<void> _loadFromNetwork(Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, error: () => null));
    try {
      await _repository.loadFromNetwork();
      emit(state.copyWith(isLoading: false));
    } on NetworkException catch (e) {
      emit(state.copyWith(isLoading: false, error: () => e.message));
    }
  }

  void _onRepositoryChanged(_RepositoryChanged event, Emitter<HomeState> emit) {
    emit(_recalculated(state.copyWith(currencies: _repository.currencies, rates: () => _repository.rates)));
  }

  void _onFromAmountChanged(_FromAmountChanged event, Emitter<HomeState> emit) {
    emit(_recalculated(state.copyWith(fromAmount: () => event.text.parseAmount())));
  }

  void _onToAmountChanged(_ToAmountChanged event, Emitter<HomeState> emit) {
    final toAmount = event.text.parseAmount();
    final rate = state.rate;
    emit(
      state.copyWith(
        toAmount: () => toAmount,
        fromAmount: () => toAmount == null || rate == null || rate == 0 ? null : toAmount / rate,
      ),
    );
  }

  Future<void> _onFromCurrencySelected(_FromCurrencySelected event, Emitter<HomeState> emit) async {
    if (event.code == state.fromCurrency) return;
    if (event.code == state.toCurrency) {
      return _onSwapped(const _Swapped(), emit);
    }
    emit(_recalculated(state.copyWith(fromCurrency: event.code)));
    await _saveToHistory();
  }

  Future<void> _onToCurrencySelected(_ToCurrencySelected event, Emitter<HomeState> emit) async {
    if (event.code == state.toCurrency) return;
    if (event.code == state.fromCurrency) {
      return _onSwapped(const _Swapped(), emit);
    }
    emit(_recalculated(state.copyWith(toCurrency: event.code)));
    await _saveToHistory();
  }

  Future<void> _onSwapped(_Swapped event, Emitter<HomeState> emit) async {
    emit(_recalculated(state.copyWith(fromCurrency: state.toCurrency, toCurrency: state.fromCurrency)));
    await _saveToHistory();
  }

  Future<void> _saveToHistory() async {
    final rate = state.rate;
    if (rate == null) return;
    await _repository.addHistoryEntry(
      HistoryEntry(from: state.fromCurrency, to: state.toCurrency, rate: rate, date: DateTime.now()),
    );
  }

  @override
  Future<void> close() {
    _repository.removeListener(_onRepositoryNotified);
    return super.close();
  }
}
