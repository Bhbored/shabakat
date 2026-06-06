// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_preferences_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetPreferencesResponse {

 double get pricePerKilowat; double get pricePerAmp; double get fixedCharge; double get tva; String get language; int get triggerDate; String? get triggerMessage;
/// Create a copy of GetPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPreferencesResponseCopyWith<GetPreferencesResponse> get copyWith => _$GetPreferencesResponseCopyWithImpl<GetPreferencesResponse>(this as GetPreferencesResponse, _$identity);

  /// Serializes this GetPreferencesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPreferencesResponse&&(identical(other.pricePerKilowat, pricePerKilowat) || other.pricePerKilowat == pricePerKilowat)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.language, language) || other.language == language)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerMessage, triggerMessage) || other.triggerMessage == triggerMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pricePerKilowat,pricePerAmp,fixedCharge,tva,language,triggerDate,triggerMessage);

@override
String toString() {
  return 'GetPreferencesResponse(pricePerKilowat: $pricePerKilowat, pricePerAmp: $pricePerAmp, fixedCharge: $fixedCharge, tva: $tva, language: $language, triggerDate: $triggerDate, triggerMessage: $triggerMessage)';
}


}

/// @nodoc
abstract mixin class $GetPreferencesResponseCopyWith<$Res>  {
  factory $GetPreferencesResponseCopyWith(GetPreferencesResponse value, $Res Function(GetPreferencesResponse) _then) = _$GetPreferencesResponseCopyWithImpl;
@useResult
$Res call({
 double pricePerKilowat, double pricePerAmp, double fixedCharge, double tva, String language, int triggerDate, String? triggerMessage
});




}
/// @nodoc
class _$GetPreferencesResponseCopyWithImpl<$Res>
    implements $GetPreferencesResponseCopyWith<$Res> {
  _$GetPreferencesResponseCopyWithImpl(this._self, this._then);

  final GetPreferencesResponse _self;
  final $Res Function(GetPreferencesResponse) _then;

/// Create a copy of GetPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pricePerKilowat = null,Object? pricePerAmp = null,Object? fixedCharge = null,Object? tva = null,Object? language = null,Object? triggerDate = null,Object? triggerMessage = freezed,}) {
  return _then(_self.copyWith(
pricePerKilowat: null == pricePerKilowat ? _self.pricePerKilowat : pricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,pricePerAmp: null == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,triggerDate: null == triggerDate ? _self.triggerDate : triggerDate // ignore: cast_nullable_to_non_nullable
as int,triggerMessage: freezed == triggerMessage ? _self.triggerMessage : triggerMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetPreferencesResponse].
extension GetPreferencesResponsePatterns on GetPreferencesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPreferencesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPreferencesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPreferencesResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetPreferencesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPreferencesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetPreferencesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPreferencesResponse() when $default != null:
return $default(_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage)  $default,) {final _that = this;
switch (_that) {
case _GetPreferencesResponse():
return $default(_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage)?  $default,) {final _that = this;
switch (_that) {
case _GetPreferencesResponse() when $default != null:
return $default(_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPreferencesResponse implements GetPreferencesResponse {
  const _GetPreferencesResponse({required this.pricePerKilowat, required this.pricePerAmp, required this.fixedCharge, required this.tva, required this.language, required this.triggerDate, this.triggerMessage});
  factory _GetPreferencesResponse.fromJson(Map<String, dynamic> json) => _$GetPreferencesResponseFromJson(json);

@override final  double pricePerKilowat;
@override final  double pricePerAmp;
@override final  double fixedCharge;
@override final  double tva;
@override final  String language;
@override final  int triggerDate;
@override final  String? triggerMessage;

/// Create a copy of GetPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPreferencesResponseCopyWith<_GetPreferencesResponse> get copyWith => __$GetPreferencesResponseCopyWithImpl<_GetPreferencesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPreferencesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPreferencesResponse&&(identical(other.pricePerKilowat, pricePerKilowat) || other.pricePerKilowat == pricePerKilowat)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.language, language) || other.language == language)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerMessage, triggerMessage) || other.triggerMessage == triggerMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pricePerKilowat,pricePerAmp,fixedCharge,tva,language,triggerDate,triggerMessage);

@override
String toString() {
  return 'GetPreferencesResponse(pricePerKilowat: $pricePerKilowat, pricePerAmp: $pricePerAmp, fixedCharge: $fixedCharge, tva: $tva, language: $language, triggerDate: $triggerDate, triggerMessage: $triggerMessage)';
}


}

/// @nodoc
abstract mixin class _$GetPreferencesResponseCopyWith<$Res> implements $GetPreferencesResponseCopyWith<$Res> {
  factory _$GetPreferencesResponseCopyWith(_GetPreferencesResponse value, $Res Function(_GetPreferencesResponse) _then) = __$GetPreferencesResponseCopyWithImpl;
@override @useResult
$Res call({
 double pricePerKilowat, double pricePerAmp, double fixedCharge, double tva, String language, int triggerDate, String? triggerMessage
});




}
/// @nodoc
class __$GetPreferencesResponseCopyWithImpl<$Res>
    implements _$GetPreferencesResponseCopyWith<$Res> {
  __$GetPreferencesResponseCopyWithImpl(this._self, this._then);

  final _GetPreferencesResponse _self;
  final $Res Function(_GetPreferencesResponse) _then;

/// Create a copy of GetPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pricePerKilowat = null,Object? pricePerAmp = null,Object? fixedCharge = null,Object? tva = null,Object? language = null,Object? triggerDate = null,Object? triggerMessage = freezed,}) {
  return _then(_GetPreferencesResponse(
pricePerKilowat: null == pricePerKilowat ? _self.pricePerKilowat : pricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,pricePerAmp: null == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,triggerDate: null == triggerDate ? _self.triggerDate : triggerDate // ignore: cast_nullable_to_non_nullable
as int,triggerMessage: freezed == triggerMessage ? _self.triggerMessage : triggerMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
