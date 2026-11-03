// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rates_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RatesEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RatesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RatesEvent()';
}


}

/// @nodoc
class $RatesEventCopyWith<$Res>  {
$RatesEventCopyWith(RatesEvent _, $Res Function(RatesEvent) __);
}


/// Adds pattern-matching-related methods to [RatesEvent].
extension RatesEventPatterns on RatesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _RepositoryChanged value)?  repositoryChanged,TResult Function( _BaseSelected value)?  baseSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RepositoryChanged() when repositoryChanged != null:
return repositoryChanged(_that);case _BaseSelected() when baseSelected != null:
return baseSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _RepositoryChanged value)  repositoryChanged,required TResult Function( _BaseSelected value)  baseSelected,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _RepositoryChanged():
return repositoryChanged(_that);case _BaseSelected():
return baseSelected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _RepositoryChanged value)?  repositoryChanged,TResult? Function( _BaseSelected value)?  baseSelected,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _RepositoryChanged() when repositoryChanged != null:
return repositoryChanged(_that);case _BaseSelected() when baseSelected != null:
return baseSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  repositoryChanged,TResult Function( String code)?  baseSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RepositoryChanged() when repositoryChanged != null:
return repositoryChanged();case _BaseSelected() when baseSelected != null:
return baseSelected(_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  repositoryChanged,required TResult Function( String code)  baseSelected,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _RepositoryChanged():
return repositoryChanged();case _BaseSelected():
return baseSelected(_that.code);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  repositoryChanged,TResult? Function( String code)?  baseSelected,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _RepositoryChanged() when repositoryChanged != null:
return repositoryChanged();case _BaseSelected() when baseSelected != null:
return baseSelected(_that.code);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements RatesEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RatesEvent.started()';
}


}




/// @nodoc


class _RepositoryChanged implements RatesEvent {
  const _RepositoryChanged();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepositoryChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RatesEvent.repositoryChanged()';
}


}




/// @nodoc


class _BaseSelected implements RatesEvent {
  const _BaseSelected(this.code);
  

 final  String code;

/// Create a copy of RatesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseSelectedCopyWith<_BaseSelected> get copyWith => __$BaseSelectedCopyWithImpl<_BaseSelected>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseSelected&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code);
}

@override
String toString() {
    return 'RatesEvent.baseSelected(code: $code)';
}


}

/// @nodoc
abstract mixin class _$BaseSelectedCopyWith<$Res> implements $RatesEventCopyWith<$Res> {
  factory _$BaseSelectedCopyWith(_BaseSelected value, $Res Function(_BaseSelected) _then) = __$BaseSelectedCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class __$BaseSelectedCopyWithImpl<$Res>
    implements _$BaseSelectedCopyWith<$Res> {
  __$BaseSelectedCopyWithImpl(this._self, this._then);

  final _BaseSelected _self;
  final $Res Function(_BaseSelected) _then;

/// Create a copy of RatesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(_BaseSelected(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
