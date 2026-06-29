// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetProfileResponse {

 String get name; String? get logoUrl;
/// Create a copy of GetProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProfileResponseCopyWith<GetProfileResponse> get copyWith => _$GetProfileResponseCopyWithImpl<GetProfileResponse>(this as GetProfileResponse, _$identity);

  /// Serializes this GetProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProfileResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,logoUrl);

@override
String toString() {
  return 'GetProfileResponse(name: $name, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $GetProfileResponseCopyWith<$Res>  {
  factory $GetProfileResponseCopyWith(GetProfileResponse value, $Res Function(GetProfileResponse) _then) = _$GetProfileResponseCopyWithImpl;
@useResult
$Res call({
 String name, String? logoUrl
});




}
/// @nodoc
class _$GetProfileResponseCopyWithImpl<$Res>
    implements $GetProfileResponseCopyWith<$Res> {
  _$GetProfileResponseCopyWithImpl(this._self, this._then);

  final GetProfileResponse _self;
  final $Res Function(GetProfileResponse) _then;

/// Create a copy of GetProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? logoUrl = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetProfileResponse].
extension GetProfileResponsePatterns on GetProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? logoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetProfileResponse() when $default != null:
return $default(_that.name,_that.logoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? logoUrl)  $default,) {final _that = this;
switch (_that) {
case _GetProfileResponse():
return $default(_that.name,_that.logoUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? logoUrl)?  $default,) {final _that = this;
switch (_that) {
case _GetProfileResponse() when $default != null:
return $default(_that.name,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetProfileResponse implements GetProfileResponse {
  const _GetProfileResponse({required this.name, this.logoUrl});
  factory _GetProfileResponse.fromJson(Map<String, dynamic> json) => _$GetProfileResponseFromJson(json);

@override final  String name;
@override final  String? logoUrl;

/// Create a copy of GetProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetProfileResponseCopyWith<_GetProfileResponse> get copyWith => __$GetProfileResponseCopyWithImpl<_GetProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProfileResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,logoUrl);

@override
String toString() {
  return 'GetProfileResponse(name: $name, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$GetProfileResponseCopyWith<$Res> implements $GetProfileResponseCopyWith<$Res> {
  factory _$GetProfileResponseCopyWith(_GetProfileResponse value, $Res Function(_GetProfileResponse) _then) = __$GetProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 String name, String? logoUrl
});




}
/// @nodoc
class __$GetProfileResponseCopyWithImpl<$Res>
    implements _$GetProfileResponseCopyWith<$Res> {
  __$GetProfileResponseCopyWithImpl(this._self, this._then);

  final _GetProfileResponse _self;
  final $Res Function(_GetProfileResponse) _then;

/// Create a copy of GetProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? logoUrl = freezed,}) {
  return _then(_GetProfileResponse(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
