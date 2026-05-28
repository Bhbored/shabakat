// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyPreferences {

 String get id; DateTime get createdAt; DateTime get updatedAt; String get companyId; double get pricePerKilowat; double get pricePerAmp; double get fixedCharge; double get tva; String get language; int get triggerDate; String? get triggerMessage;
/// Create a copy of CompanyPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyPreferencesCopyWith<CompanyPreferences> get copyWith => _$CompanyPreferencesCopyWithImpl<CompanyPreferences>(this as CompanyPreferences, _$identity);

  /// Serializes this CompanyPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyPreferences&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.pricePerKilowat, pricePerKilowat) || other.pricePerKilowat == pricePerKilowat)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.language, language) || other.language == language)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerMessage, triggerMessage) || other.triggerMessage == triggerMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,companyId,pricePerKilowat,pricePerAmp,fixedCharge,tva,language,triggerDate,triggerMessage);

@override
String toString() {
  return 'CompanyPreferences(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, companyId: $companyId, pricePerKilowat: $pricePerKilowat, pricePerAmp: $pricePerAmp, fixedCharge: $fixedCharge, tva: $tva, language: $language, triggerDate: $triggerDate, triggerMessage: $triggerMessage)';
}


}

/// @nodoc
abstract mixin class $CompanyPreferencesCopyWith<$Res>  {
  factory $CompanyPreferencesCopyWith(CompanyPreferences value, $Res Function(CompanyPreferences) _then) = _$CompanyPreferencesCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, String companyId, double pricePerKilowat, double pricePerAmp, double fixedCharge, double tva, String language, int triggerDate, String? triggerMessage
});




}
/// @nodoc
class _$CompanyPreferencesCopyWithImpl<$Res>
    implements $CompanyPreferencesCopyWith<$Res> {
  _$CompanyPreferencesCopyWithImpl(this._self, this._then);

  final CompanyPreferences _self;
  final $Res Function(CompanyPreferences) _then;

/// Create a copy of CompanyPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? companyId = null,Object? pricePerKilowat = null,Object? pricePerAmp = null,Object? fixedCharge = null,Object? tva = null,Object? language = null,Object? triggerDate = null,Object? triggerMessage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,pricePerKilowat: null == pricePerKilowat ? _self.pricePerKilowat : pricePerKilowat // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [CompanyPreferences].
extension CompanyPreferencesPatterns on CompanyPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyPreferences value)  $default,){
final _that = this;
switch (_that) {
case _CompanyPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyPreferences() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage)  $default,) {final _that = this;
switch (_that) {
case _CompanyPreferences():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  String language,  int triggerDate,  String? triggerMessage)?  $default,) {final _that = this;
switch (_that) {
case _CompanyPreferences() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.language,_that.triggerDate,_that.triggerMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyPreferences implements CompanyPreferences {
  const _CompanyPreferences({required this.id, required this.createdAt, required this.updatedAt, required this.companyId, required this.pricePerKilowat, required this.pricePerAmp, required this.fixedCharge, required this.tva, this.language = 'en', this.triggerDate = 1, this.triggerMessage});
  factory _CompanyPreferences.fromJson(Map<String, dynamic> json) => _$CompanyPreferencesFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String companyId;
@override final  double pricePerKilowat;
@override final  double pricePerAmp;
@override final  double fixedCharge;
@override final  double tva;
@override@JsonKey() final  String language;
@override@JsonKey() final  int triggerDate;
@override final  String? triggerMessage;

/// Create a copy of CompanyPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyPreferencesCopyWith<_CompanyPreferences> get copyWith => __$CompanyPreferencesCopyWithImpl<_CompanyPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyPreferences&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.pricePerKilowat, pricePerKilowat) || other.pricePerKilowat == pricePerKilowat)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.language, language) || other.language == language)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerMessage, triggerMessage) || other.triggerMessage == triggerMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,companyId,pricePerKilowat,pricePerAmp,fixedCharge,tva,language,triggerDate,triggerMessage);

@override
String toString() {
  return 'CompanyPreferences(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, companyId: $companyId, pricePerKilowat: $pricePerKilowat, pricePerAmp: $pricePerAmp, fixedCharge: $fixedCharge, tva: $tva, language: $language, triggerDate: $triggerDate, triggerMessage: $triggerMessage)';
}


}

/// @nodoc
abstract mixin class _$CompanyPreferencesCopyWith<$Res> implements $CompanyPreferencesCopyWith<$Res> {
  factory _$CompanyPreferencesCopyWith(_CompanyPreferences value, $Res Function(_CompanyPreferences) _then) = __$CompanyPreferencesCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, String companyId, double pricePerKilowat, double pricePerAmp, double fixedCharge, double tva, String language, int triggerDate, String? triggerMessage
});




}
/// @nodoc
class __$CompanyPreferencesCopyWithImpl<$Res>
    implements _$CompanyPreferencesCopyWith<$Res> {
  __$CompanyPreferencesCopyWithImpl(this._self, this._then);

  final _CompanyPreferences _self;
  final $Res Function(_CompanyPreferences) _then;

/// Create a copy of CompanyPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? companyId = null,Object? pricePerKilowat = null,Object? pricePerAmp = null,Object? fixedCharge = null,Object? tva = null,Object? language = null,Object? triggerDate = null,Object? triggerMessage = freezed,}) {
  return _then(_CompanyPreferences(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,pricePerKilowat: null == pricePerKilowat ? _self.pricePerKilowat : pricePerKilowat // ignore: cast_nullable_to_non_nullable
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
