// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Refreshed value)?  refreshed,TResult Function( _RepositoryChanged value)?  repositoryChanged,TResult Function( _FromAmountChanged value)?  fromAmountChanged,TResult Function( _ToAmountChanged value)?  toAmountChanged,TResult Function( _FromCurrencySelected value)?  fromCurrencySelected,TResult Function( _ToCurrencySelected value)?  toCurrencySelected,TResult Function( _Swapped value)?  swapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _RepositoryChanged() when repositoryChanged != null:
return repositoryChanged(_that);case _FromAmountChanged() when fromAmountChanged != null:
return fromAmountChanged(_that);case _ToAmountChanged() when toAmountChanged != null:
return toAmountChanged(_that);case _FromCurrencySelected() when fromCurrencySelected != null:
return fromCurrencySelected(_that);case _ToCurrencySelected() when toCurrencySelected != null:
return toCurrencySelected(_that);case _Swapped() when swapped != null:
return swapped(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Refreshed value)  refreshed,required TResult Function( _RepositoryChanged value)  repositoryChanged,required TResult Function( _FromAmountChanged value)  fromAmountChanged,required TResult Function( _ToAmountChanged value)  toAmountChanged,required TResult Function( _FromCurrencySelected value)  fromCurrencySelected,required TResult Function( _ToCurrencySelected value)  toCurrencySelected,required TResult Function( _Swapped value)  swapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Refreshed():
return refreshed(_that);case _RepositoryChanged():
return repositoryChanged(_that);case _FromAmountChanged():
return fromAmountChanged(_that);case _ToAmountChanged():
return toAmountChanged(_that);case _FromCurrencySelected():
return fromCurrencySelected(_that);case _ToCurrencySelected():
return toCurrencySelected(_that);case _Swapped():
return swapped(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Refreshed value)?  refreshed,TResult? Function( _RepositoryChanged value)?  repositoryChanged,TResult? Function( _FromAmountChanged value)?  fromAmountChanged,TResult? Function( _ToAmountChanged value)?  toAmountChanged,TResult? Function( _FromCurrencySelected value)?  fromCurrencySelected,TResult? Function( _ToCurrencySelected value)?  toCurrencySelected,TResult? Function( _Swapped value)?  swapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _RepositoryChanged() when repositoryChanged != null:
return repositoryChanged(_that);case _FromAmountChanged() when fromAmountChanged != null:
return fromAmountChanged(_that);case _ToAmountChanged() when toAmountChanged != null:
return toAmountChanged(_that);case _FromCurrencySelected() when fromCurrencySelected != null:
return fromCurrencySelected(_that);case _ToCurrencySelected() when toCurrencySelected != null:
return toCurrencySelected(_that);case _Swapped() when swapped != null:
return swapped(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function()?  repositoryChanged,TResult Function( String text)?  fromAmountChanged,TResult Function( String text)?  toAmountChanged,TResult Function( String code)?  fromCurrencySelected,TResult Function( String code)?  toCurrencySelected,TResult Function()?  swapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _RepositoryChanged() when repositoryChanged != null:
return repositoryChanged();case _FromAmountChanged() when fromAmountChanged != null:
return fromAmountChanged(_that.text);case _ToAmountChanged() when toAmountChanged != null:
return toAmountChanged(_that.text);case _FromCurrencySelected() when fromCurrencySelected != null:
return fromCurrencySelected(_that.code);case _ToCurrencySelected() when toCurrencySelected != null:
return toCurrencySelected(_that.code);case _Swapped() when swapped != null:
return swapped();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function()  repositoryChanged,required TResult Function( String text)  fromAmountChanged,required TResult Function( String text)  toAmountChanged,required TResult Function( String code)  fromCurrencySelected,required TResult Function( String code)  toCurrencySelected,required TResult Function()  swapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Refreshed():
return refreshed();case _RepositoryChanged():
return repositoryChanged();case _FromAmountChanged():
return fromAmountChanged(_that.text);case _ToAmountChanged():
return toAmountChanged(_that.text);case _FromCurrencySelected():
return fromCurrencySelected(_that.code);case _ToCurrencySelected():
return toCurrencySelected(_that.code);case _Swapped():
return swapped();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function()?  repositoryChanged,TResult? Function( String text)?  fromAmountChanged,TResult? Function( String text)?  toAmountChanged,TResult? Function( String code)?  fromCurrencySelected,TResult? Function( String code)?  toCurrencySelected,TResult? Function()?  swapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _RepositoryChanged() when repositoryChanged != null:
return repositoryChanged();case _FromAmountChanged() when fromAmountChanged != null:
return fromAmountChanged(_that.text);case _ToAmountChanged() when toAmountChanged != null:
return toAmountChanged(_that.text);case _FromCurrencySelected() when fromCurrencySelected != null:
return fromCurrencySelected(_that.code);case _ToCurrencySelected() when toCurrencySelected != null:
return toCurrencySelected(_that.code);case _Swapped() when swapped != null:
return swapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements HomeEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEvent.started()';
}


}




/// @nodoc


class _Refreshed implements HomeEvent {
  const _Refreshed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEvent.refreshed()';
}


}




/// @nodoc


class _RepositoryChanged implements HomeEvent {
  const _RepositoryChanged();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepositoryChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEvent.repositoryChanged()';
}


}




/// @nodoc


class _FromAmountChanged implements HomeEvent {
  const _FromAmountChanged(this.text);
  

 final  String text;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FromAmountChangedCopyWith<_FromAmountChanged> get copyWith => __$FromAmountChangedCopyWithImpl<_FromAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromAmountChanged&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'HomeEvent.fromAmountChanged(text: $text)';
}


}

/// @nodoc
abstract mixin class _$FromAmountChangedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$FromAmountChangedCopyWith(_FromAmountChanged value, $Res Function(_FromAmountChanged) _then) = __$FromAmountChangedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class __$FromAmountChangedCopyWithImpl<$Res>
    implements _$FromAmountChangedCopyWith<$Res> {
  __$FromAmountChangedCopyWithImpl(this._self, this._then);

  final _FromAmountChanged _self;
  final $Res Function(_FromAmountChanged) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_FromAmountChanged(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToAmountChanged implements HomeEvent {
  const _ToAmountChanged(this.text);
  

 final  String text;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToAmountChangedCopyWith<_ToAmountChanged> get copyWith => __$ToAmountChangedCopyWithImpl<_ToAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToAmountChanged&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'HomeEvent.toAmountChanged(text: $text)';
}


}

/// @nodoc
abstract mixin class _$ToAmountChangedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ToAmountChangedCopyWith(_ToAmountChanged value, $Res Function(_ToAmountChanged) _then) = __$ToAmountChangedCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class __$ToAmountChangedCopyWithImpl<$Res>
    implements _$ToAmountChangedCopyWith<$Res> {
  __$ToAmountChangedCopyWithImpl(this._self, this._then);

  final _ToAmountChanged _self;
  final $Res Function(_ToAmountChanged) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(_ToAmountChanged(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FromCurrencySelected implements HomeEvent {
  const _FromCurrencySelected(this.code);
  

 final  String code;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FromCurrencySelectedCopyWith<_FromCurrencySelected> get copyWith => __$FromCurrencySelectedCopyWithImpl<_FromCurrencySelected>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromCurrencySelected&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code);
}

@override
String toString() {
    return 'HomeEvent.fromCurrencySelected(code: $code)';
}


}

/// @nodoc
abstract mixin class _$FromCurrencySelectedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$FromCurrencySelectedCopyWith(_FromCurrencySelected value, $Res Function(_FromCurrencySelected) _then) = __$FromCurrencySelectedCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class __$FromCurrencySelectedCopyWithImpl<$Res>
    implements _$FromCurrencySelectedCopyWith<$Res> {
  __$FromCurrencySelectedCopyWithImpl(this._self, this._then);

  final _FromCurrencySelected _self;
  final $Res Function(_FromCurrencySelected) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(_FromCurrencySelected(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToCurrencySelected implements HomeEvent {
  const _ToCurrencySelected(this.code);
  

 final  String code;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToCurrencySelectedCopyWith<_ToCurrencySelected> get copyWith => __$ToCurrencySelectedCopyWithImpl<_ToCurrencySelected>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToCurrencySelected&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code);
}

@override
String toString() {
    return 'HomeEvent.toCurrencySelected(code: $code)';
}


}

/// @nodoc
abstract mixin class _$ToCurrencySelectedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$ToCurrencySelectedCopyWith(_ToCurrencySelected value, $Res Function(_ToCurrencySelected) _then) = __$ToCurrencySelectedCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class __$ToCurrencySelectedCopyWithImpl<$Res>
    implements _$ToCurrencySelectedCopyWith<$Res> {
  __$ToCurrencySelectedCopyWithImpl(this._self, this._then);

  final _ToCurrencySelected _self;
  final $Res Function(_ToCurrencySelected) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(_ToCurrencySelected(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Swapped implements HomeEvent {
  const _Swapped();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Swapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HomeEvent.swapped()';
}


}




// dart format on
