// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suspend_customers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuspendCustomersResponse {

 int get suspended; String get message;
/// Create a copy of SuspendCustomersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuspendCustomersResponseCopyWith<SuspendCustomersResponse> get copyWith => _$SuspendCustomersResponseCopyWithImpl<SuspendCustomersResponse>(this as SuspendCustomersResponse, _$identity);

  /// Serializes this SuspendCustomersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuspendCustomersResponse&&(identical(other.suspended, suspended) || other.suspended == suspended)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suspended,message);

@override
String toString() {
  return 'SuspendCustomersResponse(suspended: $suspended, message: $message)';
}


}

/// @nodoc
abstract mixin class $SuspendCustomersResponseCopyWith<$Res>  {
  factory $SuspendCustomersResponseCopyWith(SuspendCustomersResponse value, $Res Function(SuspendCustomersResponse) _then) = _$SuspendCustomersResponseCopyWithImpl;
@useResult
$Res call({
 int suspended, String message
});




}
/// @nodoc
class _$SuspendCustomersResponseCopyWithImpl<$Res>
    implements $SuspendCustomersResponseCopyWith<$Res> {
  _$SuspendCustomersResponseCopyWithImpl(this._self, this._then);

  final SuspendCustomersResponse _self;
  final $Res Function(SuspendCustomersResponse) _then;

/// Create a copy of SuspendCustomersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suspended = null,Object? message = null,}) {
  return _then(_self.copyWith(
suspended: null == suspended ? _self.suspended : suspended // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SuspendCustomersResponse].
extension SuspendCustomersResponsePatterns on SuspendCustomersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuspendCustomersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuspendCustomersResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuspendCustomersResponse value)  $default,){
final _that = this;
switch (_that) {
case _SuspendCustomersResponse():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuspendCustomersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SuspendCustomersResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int suspended,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuspendCustomersResponse() when $default != null:
return $default(_that.suspended,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int suspended,  String message)  $default,) {final _that = this;
switch (_that) {
case _SuspendCustomersResponse():
return $default(_that.suspended,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int suspended,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SuspendCustomersResponse() when $default != null:
return $default(_that.suspended,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuspendCustomersResponse implements SuspendCustomersResponse {
  const _SuspendCustomersResponse({required this.suspended, required this.message});
  factory _SuspendCustomersResponse.fromJson(Map<String, dynamic> json) => _$SuspendCustomersResponseFromJson(json);

@override final  int suspended;
@override final  String message;

/// Create a copy of SuspendCustomersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuspendCustomersResponseCopyWith<_SuspendCustomersResponse> get copyWith => __$SuspendCustomersResponseCopyWithImpl<_SuspendCustomersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuspendCustomersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuspendCustomersResponse&&(identical(other.suspended, suspended) || other.suspended == suspended)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suspended,message);

@override
String toString() {
  return 'SuspendCustomersResponse(suspended: $suspended, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuspendCustomersResponseCopyWith<$Res> implements $SuspendCustomersResponseCopyWith<$Res> {
  factory _$SuspendCustomersResponseCopyWith(_SuspendCustomersResponse value, $Res Function(_SuspendCustomersResponse) _then) = __$SuspendCustomersResponseCopyWithImpl;
@override @useResult
$Res call({
 int suspended, String message
});




}
/// @nodoc
class __$SuspendCustomersResponseCopyWithImpl<$Res>
    implements _$SuspendCustomersResponseCopyWith<$Res> {
  __$SuspendCustomersResponseCopyWithImpl(this._self, this._then);

  final _SuspendCustomersResponse _self;
  final $Res Function(_SuspendCustomersResponse) _then;

/// Create a copy of SuspendCustomersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suspended = null,Object? message = null,}) {
  return _then(_SuspendCustomersResponse(
suspended: null == suspended ? _self.suspended : suspended // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
