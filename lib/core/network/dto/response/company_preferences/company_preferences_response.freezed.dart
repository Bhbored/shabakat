// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_preferences_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyPreferencesResponse {

 String get id; double get pricePerKilowat; double get pricePerAmp; double get fixedCharge; double get tva; String get language; int get triggerDate; String? get triggerMessage; DateTime get updatedAt;
/// Create a copy of CompanyPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyPreferencesResponseCopyWith<CompanyPreferencesResponse> get copyWith => _$CompanyPreferencesResponseCopyWithImpl<CompanyPreferencesResponse>(this as CompanyPreferencesResponse, _$identity);

  /// Serializes this CompanyPreferencesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyPreferencesResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.pricePerKilowat, pricePerKilowat) || other.pricePerKilowat == pricePerKilowat)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.language, language) || other.language == language)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerMessage, triggerMessage) || other.triggerMessage == triggerMessage)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pricePerKilowat,pricePerAmp,fixedCharge,tva,language,triggerDate,triggerMessage,updatedAt);

@override
String toString() {
  return 'CompanyPreferencesResponse(id: $id, pricePerKilowat: $pricePerKilowat, pricePerAmp: $pricePerAmp, fixedCharge: $fixedCharge, tva: $tva, language: $language, triggerDate: $triggerDate, triggerMessage: $triggerMessage, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CompanyPreferencesResponseCopyWith<$Res>  {
  factory $CompanyPreferencesResponseCopyWith(CompanyPreferencesResponse value, $Res Function(CompanyPreferencesResponse) _then) = _$CompanyPreferencesResponseCopyWithImpl;
@useResult
$Res call({
 String id, double pricePerKilowat, double pricePerAmp, double fixedCharge, double tva, String language, int triggerDate, String? triggerMessage, DateTime updatedAt
});




}
/// @nodoc
class _$CompanyPreferencesResponseCopyWithImpl<$Res>
    implements $CompanyPreferencesResponseCopyWith<$Res> {
  _$CompanyPreferencesResponseCopyWithImpl(this._self, this._then);

  final CompanyPreferencesResponse _self;
  final $Res Function(CompanyPreferencesResponse) _then;

/// Create a copy of CompanyPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pricePerKilowat = null,Object? pricePerAmp = null,Object? fixedCharge = null,Object? tva = null,Object? language = null,Object? triggerDate = null,Object? triggerMessage = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pricePerKilowat: null == pricePerKilowat ? _self.pricePerKilowat : pricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,pricePerAmp: null == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,triggerDate: null == triggerDate ? _self.triggerDate : triggerDate // ignore: cast_nullable_to_non_nullable
as int,triggerMessage: freezed == triggerMessage ? _self.triggerMessage : triggerMessage // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyPreferencesResponse].
extension CompanyPreferencesResponsePatterns on CompanyPreferencesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyPreferencesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyPreferencesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyPreferencesResponse value)  $default,){
final _that = this;
switch (_that) {
case _CompanyPreferencesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyPreferencesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyPreferencesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyPreferencesResponse() when $default != null:
return $default(_that.id,_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CompanyPreferencesResponse():
return $default(_that.id,_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CompanyPreferencesResponse() when $default != null:
return $default(_that.id,_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyPreferencesResponse implements CompanyPreferencesResponse {
  const _CompanyPreferencesResponse({required this.id, required this.pricePerKilowat, required this.pricePerAmp, required this.fixedCharge, required this.tva, required this.language, required this.triggerDate, this.triggerMessage, required this.updatedAt});
  factory _CompanyPreferencesResponse.fromJson(Map<String, dynamic> json) => _$CompanyPreferencesResponseFromJson(json);

@override final  String id;
@override final  double pricePerKilowat;
@override final  double pricePerAmp;
@override final  double fixedCharge;
@override final  double tva;
@override final  String language;
@override final  int triggerDate;
@override final  String? triggerMessage;
@override final  DateTime updatedAt;

/// Create a copy of CompanyPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyPreferencesResponseCopyWith<_CompanyPreferencesResponse> get copyWith => __$CompanyPreferencesResponseCopyWithImpl<_CompanyPreferencesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyPreferencesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyPreferencesResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.pricePerKilowat, pricePerKilowat) || other.pricePerKilowat == pricePerKilowat)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.language, language) || other.language == language)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerMessage, triggerMessage) || other.triggerMessage == triggerMessage)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pricePerKilowat,pricePerAmp,fixedCharge,tva,language,triggerDate,triggerMessage,updatedAt);

@override
String toString() {
  return 'CompanyPreferencesResponse(id: $id, pricePerKilowat: $pricePerKilowat, pricePerAmp: $pricePerAmp, fixedCharge: $fixedCharge, tva: $tva, language: $language, triggerDate: $triggerDate, triggerMessage: $triggerMessage, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CompanyPreferencesResponseCopyWith<$Res> implements $CompanyPreferencesResponseCopyWith<$Res> {
  factory _$CompanyPreferencesResponseCopyWith(_CompanyPreferencesResponse value, $Res Function(_CompanyPreferencesResponse) _then) = __$CompanyPreferencesResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, double pricePerKilowat, double pricePerAmp, double fixedCharge, double tva, String language, int triggerDate, String? triggerMessage, DateTime updatedAt
});




}
/// @nodoc
class __$CompanyPreferencesResponseCopyWithImpl<$Res>
    implements _$CompanyPreferencesResponseCopyWith<$Res> {
  __$CompanyPreferencesResponseCopyWithImpl(this._self, this._then);

  final _CompanyPreferencesResponse _self;
  final $Res Function(_CompanyPreferencesResponse) _then;

/// Create a copy of CompanyPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pricePerKilowat = null,Object? pricePerAmp = null,Object? fixedCharge = null,Object? tva = null,Object? language = null,Object? triggerDate = null,Object? triggerMessage = freezed,Object? updatedAt = null,}) {
  return _then(_CompanyPreferencesResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pricePerKilowat: null == pricePerKilowat ? _self.pricePerKilowat : pricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,pricePerAmp: null == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,triggerDate: null == triggerDate ? _self.triggerDate : triggerDate // ignore: cast_nullable_to_non_nullable
as int,triggerMessage: freezed == triggerMessage ? _self.triggerMessage : triggerMessage // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
