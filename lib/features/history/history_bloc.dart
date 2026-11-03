import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/history_entry.dart';
import '../../repositories/repository.dart';

part 'history_bloc.freezed.dart';
part 'history_event.dart';
part 'history_state.dart';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this._repository) : super(const HistoryState()) {
    on<_Started>(_onStarted);
  }

  final Repository _repository;

  void _onStarted(_Started event, Emitter<HistoryState> emit) {
    emit(state.copyWith(entries: _repository.getHistory()));
  }
}
