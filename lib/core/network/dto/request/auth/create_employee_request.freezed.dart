// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_employee_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateEmployeeRequest {

 String get fullName; String get email; String get password;
/// Create a copy of CreateEmployeeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateEmployeeRequestCopyWith<CreateEmployeeRequest> get copyWith => _$CreateEmployeeRequestCopyWithImpl<CreateEmployeeRequest>(this as CreateEmployeeRequest, _$identity);

  /// Serializes this CreateEmployeeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEmployeeRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,password);

@override
String toString() {
  return 'CreateEmployeeRequest(fullName: $fullName, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $CreateEmployeeRequestCopyWith<$Res>  {
  factory $CreateEmployeeRequestCopyWith(CreateEmployeeRequest value, $Res Function(CreateEmployeeRequest) _then) = _$CreateEmployeeRequestCopyWithImpl;
@useResult
$Res call({
 String fullName, String email, String password
});




}
/// @nodoc
class _$CreateEmployeeRequestCopyWithImpl<$Res>
    implements $CreateEmployeeRequestCopyWith<$Res> {
  _$CreateEmployeeRequestCopyWithImpl(this._self, this._then);

  final CreateEmployeeRequest _self;
  final $Res Function(CreateEmployeeRequest) _then;

/// Create a copy of CreateEmployeeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateEmployeeRequest].
extension CreateEmployeeRequestPatterns on CreateEmployeeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateEmployeeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateEmployeeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateEmployeeRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateEmployeeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateEmployeeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateEmployeeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateEmployeeRequest() when $default != null:
return $default(_that.fullName,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _CreateEmployeeRequest():
return $default(_that.fullName,_that.email,_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _CreateEmployeeRequest() when $default != null:
return $default(_that.fullName,_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateEmployeeRequest implements CreateEmployeeRequest {
  const _CreateEmployeeRequest({required this.fullName, required this.email, required this.password});
  factory _CreateEmployeeRequest.fromJson(Map<String, dynamic> json) => _$CreateEmployeeRequestFromJson(json);

@override final  String fullName;
@override final  String email;
@override final  String password;

/// Create a copy of CreateEmployeeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateEmployeeRequestCopyWith<_CreateEmployeeRequest> get copyWith => __$CreateEmployeeRequestCopyWithImpl<_CreateEmployeeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateEmployeeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateEmployeeRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,password);

@override
String toString() {
  return 'CreateEmployeeRequest(fullName: $fullName, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$CreateEmployeeRequestCopyWith<$Res> implements $CreateEmployeeRequestCopyWith<$Res> {
  factory _$CreateEmployeeRequestCopyWith(_CreateEmployeeRequest value, $Res Function(_CreateEmployeeRequest) _then) = __$CreateEmployeeRequestCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String email, String password
});




}
/// @nodoc
class __$CreateEmployeeRequestCopyWithImpl<$Res>
    implements _$CreateEmployeeRequestCopyWith<$Res> {
  __$CreateEmployeeRequestCopyWithImpl(this._self, this._then);

  final _CreateEmployeeRequest _self;
  final $Res Function(_CreateEmployeeRequest) _then;

/// Create a copy of CreateEmployeeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? email = null,Object? password = null,}) {
  return _then(_CreateEmployeeRequest(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
