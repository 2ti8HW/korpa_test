part of 'currency_picker_bloc.dart';

@freezed
sealed class CurrencyPickerEvent with _$CurrencyPickerEvent {
  const factory CurrencyPickerEvent.queryChanged(String query) = _QueryChanged;
}
