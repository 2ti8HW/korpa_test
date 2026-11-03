import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/currency.dart';
import '../../models/exchange_rates.dart';
import '../../repositories/repository.dart';

part 'rates_bloc.freezed.dart';
part 'rates_event.dart';
part 'rates_state.dart';

@injectable
class RatesBloc extends Bloc<RatesEvent, RatesState> {
  RatesBloc(this._repository)
    : super(
        RatesState(
          currencies: _repository.currencies,
          rates: _repository.rates,
        ),
      ) {
    on<_Started>(_onStarted);
    on<_RepositoryChanged>(_onRepositoryChanged);
    on<_BaseSelected>(_onBaseSelected);
    _repository.addListener(_onRepositoryNotified);
  }

  final Repository _repository;

  void _onRepositoryNotified() => add(const RatesEvent.repositoryChanged());

  void _onStarted(_Started event, Emitter<RatesState> emit) {}

  void _onRepositoryChanged(
    _RepositoryChanged event,
    Emitter<RatesState> emit,
  ) {
    emit(
      state.copyWith(
        currencies: _repository.currencies,
        rates: () => _repository.rates,
      ),
    );
  }

  void _onBaseSelected(_BaseSelected event, Emitter<RatesState> emit) {
    emit(state.copyWith(base: event.code));
  }

  @override
  Future<void> close() {
    _repository.removeListener(_onRepositoryNotified);
    return super.close();
  }
}
