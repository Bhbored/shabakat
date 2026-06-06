// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_company_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterCompanyRequest {

 String get companyName; String get email; String get password; String get confirmPassword; String? get phone; String? get logoUrl;
/// Create a copy of RegisterCompanyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterCompanyRequestCopyWith<RegisterCompanyRequest> get copyWith => _$RegisterCompanyRequestCopyWithImpl<RegisterCompanyRequest>(this as RegisterCompanyRequest, _$identity);

  /// Serializes this RegisterCompanyRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterCompanyRequest&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,email,password,confirmPassword,phone,logoUrl);

@override
String toString() {
  return 'RegisterCompanyRequest(companyName: $companyName, email: $email, password: $password, confirmPassword: $confirmPassword, phone: $phone, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $RegisterCompanyRequestCopyWith<$Res>  {
  factory $RegisterCompanyRequestCopyWith(RegisterCompanyRequest value, $Res Function(RegisterCompanyRequest) _then) = _$RegisterCompanyRequestCopyWithImpl;
@useResult
$Res call({
 String companyName, String email, String password, String confirmPassword, String? phone, String? logoUrl
});




}
/// @nodoc
class _$RegisterCompanyRequestCopyWithImpl<$Res>
    implements $RegisterCompanyRequestCopyWith<$Res> {
  _$RegisterCompanyRequestCopyWithImpl(this._self, this._then);

  final RegisterCompanyRequest _self;
  final $Res Function(RegisterCompanyRequest) _then;

/// Create a copy of RegisterCompanyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? phone = freezed,Object? logoUrl = freezed,}) {
  return _then(_self.copyWith(
companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterCompanyRequest].
extension RegisterCompanyRequestPatterns on RegisterCompanyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterCompanyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterCompanyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterCompanyRequest value)  $default,){
final _that = this;
switch (_that) {
case _RegisterCompanyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterCompanyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterCompanyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String companyName,  String email,  String password,  String confirmPassword,  String? phone,  String? logoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterCompanyRequest() when $default != null:
return $default(_that.companyName,_that.email,_that.password,_that.confirmPassword,_that.phone,_that.logoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String companyName,  String email,  String password,  String confirmPassword,  String? phone,  String? logoUrl)  $default,) {final _that = this;
switch (_that) {
case _RegisterCompanyRequest():
return $default(_that.companyName,_that.email,_that.password,_that.confirmPassword,_that.phone,_that.logoUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String companyName,  String email,  String password,  String confirmPassword,  String? phone,  String? logoUrl)?  $default,) {final _that = this;
switch (_that) {
case _RegisterCompanyRequest() when $default != null:
return $default(_that.companyName,_that.email,_that.password,_that.confirmPassword,_that.phone,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterCompanyRequest implements RegisterCompanyRequest {
  const _RegisterCompanyRequest({required this.companyName, required this.email, required this.password, required this.confirmPassword, this.phone, this.logoUrl});
  factory _RegisterCompanyRequest.fromJson(Map<String, dynamic> json) => _$RegisterCompanyRequestFromJson(json);

@override final  String companyName;
@override final  String email;
@override final  String password;
@override final  String confirmPassword;
@override final  String? phone;
@override final  String? logoUrl;

/// Create a copy of RegisterCompanyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCompanyRequestCopyWith<_RegisterCompanyRequest> get copyWith => __$RegisterCompanyRequestCopyWithImpl<_RegisterCompanyRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterCompanyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterCompanyRequest&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,email,password,confirmPassword,phone,logoUrl);

@override
String toString() {
  return 'RegisterCompanyRequest(companyName: $companyName, email: $email, password: $password, confirmPassword: $confirmPassword, phone: $phone, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$RegisterCompanyRequestCopyWith<$Res> implements $RegisterCompanyRequestCopyWith<$Res> {
  factory _$RegisterCompanyRequestCopyWith(_RegisterCompanyRequest value, $Res Function(_RegisterCompanyRequest) _then) = __$RegisterCompanyRequestCopyWithImpl;
@override @useResult
$Res call({
 String companyName, String email, String password, String confirmPassword, String? phone, String? logoUrl
});




}
/// @nodoc
class __$RegisterCompanyRequestCopyWithImpl<$Res>
    implements _$RegisterCompanyRequestCopyWith<$Res> {
  __$RegisterCompanyRequestCopyWithImpl(this._self, this._then);

  final _RegisterCompanyRequest _self;
  final $Res Function(_RegisterCompanyRequest) _then;

/// Create a copy of RegisterCompanyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? phone = freezed,Object? logoUrl = freezed,}) {
  return _then(_RegisterCompanyRequest(
companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
