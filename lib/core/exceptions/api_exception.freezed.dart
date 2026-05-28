// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiException {

 String get userMessage; String get error; int? get statusCode; dynamic get originalError;
/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiExceptionCopyWith<ApiException> get copyWith => _$ApiExceptionCopyWithImpl<ApiException>(this as ApiException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiException&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage)&&(identical(other.error, error) || other.error == error)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.originalError, originalError));
}


@override
int get hashCode => Object.hash(runtimeType,userMessage,error,statusCode,const DeepCollectionEquality().hash(originalError));



}

/// @nodoc
abstract mixin class $ApiExceptionCopyWith<$Res>  {
  factory $ApiExceptionCopyWith(ApiException value, $Res Function(ApiException) _then) = _$ApiExceptionCopyWithImpl;
@useResult
$Res call({
 String userMessage, String error, int? statusCode, dynamic originalError
});




}
/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._self, this._then);

  final ApiException _self;
  final $Res Function(ApiException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userMessage = null,Object? error = null,Object? statusCode = freezed,Object? originalError = freezed,}) {
  return _then(_self.copyWith(
userMessage: null == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,originalError: freezed == originalError ? _self.originalError : originalError // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiException].
extension ApiExceptionPatterns on ApiException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiException value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiException() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiException value)  $default,){
final _that = this;
switch (_that) {
case _ApiException():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiException value)?  $default,){
final _that = this;
switch (_that) {
case _ApiException() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userMessage,  String error,  int? statusCode,  dynamic originalError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiException() when $default != null:
return $default(_that.userMessage,_that.error,_that.statusCode,_that.originalError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userMessage,  String error,  int? statusCode,  dynamic originalError)  $default,) {final _that = this;
switch (_that) {
case _ApiException():
return $default(_that.userMessage,_that.error,_that.statusCode,_that.originalError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userMessage,  String error,  int? statusCode,  dynamic originalError)?  $default,) {final _that = this;
switch (_that) {
case _ApiException() when $default != null:
return $default(_that.userMessage,_that.error,_that.statusCode,_that.originalError);case _:
  return null;

}
}

}

/// @nodoc


class _ApiException implements ApiException {
  const _ApiException({required this.userMessage, required this.error, this.statusCode, required this.originalError});
  

@override final  String userMessage;
@override final  String error;
@override final  int? statusCode;
@override final  dynamic originalError;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiExceptionCopyWith<_ApiException> get copyWith => __$ApiExceptionCopyWithImpl<_ApiException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiException&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage)&&(identical(other.error, error) || other.error == error)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&const DeepCollectionEquality().equals(other.originalError, originalError));
}


@override
int get hashCode => Object.hash(runtimeType,userMessage,error,statusCode,const DeepCollectionEquality().hash(originalError));



}

/// @nodoc
abstract mixin class _$ApiExceptionCopyWith<$Res> implements $ApiExceptionCopyWith<$Res> {
  factory _$ApiExceptionCopyWith(_ApiException value, $Res Function(_ApiException) _then) = __$ApiExceptionCopyWithImpl;
@override @useResult
$Res call({
 String userMessage, String error, int? statusCode, dynamic originalError
});




}
/// @nodoc
class __$ApiExceptionCopyWithImpl<$Res>
    implements _$ApiExceptionCopyWith<$Res> {
  __$ApiExceptionCopyWithImpl(this._self, this._then);

  final _ApiException _self;
  final $Res Function(_ApiException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userMessage = null,Object? error = null,Object? statusCode = freezed,Object? originalError = freezed,}) {
  return _then(_ApiException(
userMessage: null == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,originalError: freezed == originalError ? _self.originalError : originalError // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
