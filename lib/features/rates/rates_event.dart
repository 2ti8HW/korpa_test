part of 'rates_bloc.dart';

@freezed
sealed class RatesEvent with _$RatesEvent {
  const factory RatesEvent.started() = _Started;
  const factory RatesEvent.repositoryChanged() = _RepositoryChanged;
  const factory RatesEvent.baseSelected(String code) = _BaseSelected;
}
