part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.refreshed() = _Refreshed;
  const factory HomeEvent.repositoryChanged() = _RepositoryChanged;
  const factory HomeEvent.fromAmountChanged(String text) = _FromAmountChanged;
  const factory HomeEvent.toAmountChanged(String text) = _ToAmountChanged;
  const factory HomeEvent.fromCurrencySelected(String code) =
      _FromCurrencySelected;
  const factory HomeEvent.toCurrencySelected(String code) = _ToCurrencySelected;
  const factory HomeEvent.swapped() = _Swapped;
}
