// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_preferences_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePreferencesRequest {

 double get pricePerKilowat; double get pricePerAmp; double get fixedCharge; double get tva; double get residentialPricePerAmp; double get residentialPricePerKilowat; double get residentialFixedCharge; double get residentialTVA; double get commercialPricePerAmp; double get commercialPricePerKilowat; double get commercialFixedCharge; double get commercialTVA; double get industrialPricePerAmp; double get industrialPricePerKilowat; double get industrialFixedCharge; double get industrialTVA; String get language; int get dueDate; int get triggerDate; String? get triggerMessage; bool get ampereSchedulePricingEnabled; bool get ampereProrateByDaysEnabled;
/// Create a copy of UpdatePreferencesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePreferencesRequestCopyWith<UpdatePreferencesRequest> get copyWith => _$UpdatePreferencesRequestCopyWithImpl<UpdatePreferencesRequest>(this as UpdatePreferencesRequest, _$identity);

  /// Serializes this UpdatePreferencesRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePreferencesRequest&&(identical(other.pricePerKilowat, pricePerKilowat) || other.pricePerKilowat == pricePerKilowat)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.residentialPricePerAmp, residentialPricePerAmp) || other.residentialPricePerAmp == residentialPricePerAmp)&&(identical(other.residentialPricePerKilowat, residentialPricePerKilowat) || other.residentialPricePerKilowat == residentialPricePerKilowat)&&(identical(other.residentialFixedCharge, residentialFixedCharge) || other.residentialFixedCharge == residentialFixedCharge)&&(identical(other.residentialTVA, residentialTVA) || other.residentialTVA == residentialTVA)&&(identical(other.commercialPricePerAmp, commercialPricePerAmp) || other.commercialPricePerAmp == commercialPricePerAmp)&&(identical(other.commercialPricePerKilowat, commercialPricePerKilowat) || other.commercialPricePerKilowat == commercialPricePerKilowat)&&(identical(other.commercialFixedCharge, commercialFixedCharge) || other.commercialFixedCharge == commercialFixedCharge)&&(identical(other.commercialTVA, commercialTVA) || other.commercialTVA == commercialTVA)&&(identical(other.industrialPricePerAmp, industrialPricePerAmp) || other.industrialPricePerAmp == industrialPricePerAmp)&&(identical(other.industrialPricePerKilowat, industrialPricePerKilowat) || other.industrialPricePerKilowat == industrialPricePerKilowat)&&(identical(other.industrialFixedCharge, industrialFixedCharge) || other.industrialFixedCharge == industrialFixedCharge)&&(identical(other.industrialTVA, industrialTVA) || other.industrialTVA == industrialTVA)&&(identical(other.language, language) || other.language == language)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerMessage, triggerMessage) || other.triggerMessage == triggerMessage)&&(identical(other.ampereSchedulePricingEnabled, ampereSchedulePricingEnabled) || other.ampereSchedulePricingEnabled == ampereSchedulePricingEnabled)&&(identical(other.ampereProrateByDaysEnabled, ampereProrateByDaysEnabled) || other.ampereProrateByDaysEnabled == ampereProrateByDaysEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,pricePerKilowat,pricePerAmp,fixedCharge,tva,residentialPricePerAmp,residentialPricePerKilowat,residentialFixedCharge,residentialTVA,commercialPricePerAmp,commercialPricePerKilowat,commercialFixedCharge,commercialTVA,industrialPricePerAmp,industrialPricePerKilowat,industrialFixedCharge,industrialTVA,language,dueDate,triggerDate,triggerMessage,ampereSchedulePricingEnabled,ampereProrateByDaysEnabled]);

@override
String toString() {
  return 'UpdatePreferencesRequest(pricePerKilowat: $pricePerKilowat, pricePerAmp: $pricePerAmp, fixedCharge: $fixedCharge, tva: $tva, residentialPricePerAmp: $residentialPricePerAmp, residentialPricePerKilowat: $residentialPricePerKilowat, residentialFixedCharge: $residentialFixedCharge, residentialTVA: $residentialTVA, commercialPricePerAmp: $commercialPricePerAmp, commercialPricePerKilowat: $commercialPricePerKilowat, commercialFixedCharge: $commercialFixedCharge, commercialTVA: $commercialTVA, industrialPricePerAmp: $industrialPricePerAmp, industrialPricePerKilowat: $industrialPricePerKilowat, industrialFixedCharge: $industrialFixedCharge, industrialTVA: $industrialTVA, language: $language, dueDate: $dueDate, triggerDate: $triggerDate, triggerMessage: $triggerMessage, ampereSchedulePricingEnabled: $ampereSchedulePricingEnabled, ampereProrateByDaysEnabled: $ampereProrateByDaysEnabled)';
}


}

/// @nodoc
abstract mixin class $UpdatePreferencesRequestCopyWith<$Res>  {
  factory $UpdatePreferencesRequestCopyWith(UpdatePreferencesRequest value, $Res Function(UpdatePreferencesRequest) _then) = _$UpdatePreferencesRequestCopyWithImpl;
@useResult
$Res call({
 double pricePerKilowat, double pricePerAmp, double fixedCharge, double tva, double residentialPricePerAmp, double residentialPricePerKilowat, double residentialFixedCharge, double residentialTVA, double commercialPricePerAmp, double commercialPricePerKilowat, double commercialFixedCharge, double commercialTVA, double industrialPricePerAmp, double industrialPricePerKilowat, double industrialFixedCharge, double industrialTVA, String language, int dueDate, int triggerDate, String? triggerMessage, bool ampereSchedulePricingEnabled, bool ampereProrateByDaysEnabled
});




}
/// @nodoc
class _$UpdatePreferencesRequestCopyWithImpl<$Res>
    implements $UpdatePreferencesRequestCopyWith<$Res> {
  _$UpdatePreferencesRequestCopyWithImpl(this._self, this._then);

  final UpdatePreferencesRequest _self;
  final $Res Function(UpdatePreferencesRequest) _then;

/// Create a copy of UpdatePreferencesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pricePerKilowat = null,Object? pricePerAmp = null,Object? fixedCharge = null,Object? tva = null,Object? residentialPricePerAmp = null,Object? residentialPricePerKilowat = null,Object? residentialFixedCharge = null,Object? residentialTVA = null,Object? commercialPricePerAmp = null,Object? commercialPricePerKilowat = null,Object? commercialFixedCharge = null,Object? commercialTVA = null,Object? industrialPricePerAmp = null,Object? industrialPricePerKilowat = null,Object? industrialFixedCharge = null,Object? industrialTVA = null,Object? language = null,Object? dueDate = null,Object? triggerDate = null,Object? triggerMessage = freezed,Object? ampereSchedulePricingEnabled = null,Object? ampereProrateByDaysEnabled = null,}) {
  return _then(_self.copyWith(
pricePerKilowat: null == pricePerKilowat ? _self.pricePerKilowat : pricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,pricePerAmp: null == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,residentialPricePerAmp: null == residentialPricePerAmp ? _self.residentialPricePerAmp : residentialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,residentialPricePerKilowat: null == residentialPricePerKilowat ? _self.residentialPricePerKilowat : residentialPricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,residentialFixedCharge: null == residentialFixedCharge ? _self.residentialFixedCharge : residentialFixedCharge // ignore: cast_nullable_to_non_nullable
as double,residentialTVA: null == residentialTVA ? _self.residentialTVA : residentialTVA // ignore: cast_nullable_to_non_nullable
as double,commercialPricePerAmp: null == commercialPricePerAmp ? _self.commercialPricePerAmp : commercialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,commercialPricePerKilowat: null == commercialPricePerKilowat ? _self.commercialPricePerKilowat : commercialPricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,commercialFixedCharge: null == commercialFixedCharge ? _self.commercialFixedCharge : commercialFixedCharge // ignore: cast_nullable_to_non_nullable
as double,commercialTVA: null == commercialTVA ? _self.commercialTVA : commercialTVA // ignore: cast_nullable_to_non_nullable
as double,industrialPricePerAmp: null == industrialPricePerAmp ? _self.industrialPricePerAmp : industrialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,industrialPricePerKilowat: null == industrialPricePerKilowat ? _self.industrialPricePerKilowat : industrialPricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,industrialFixedCharge: null == industrialFixedCharge ? _self.industrialFixedCharge : industrialFixedCharge // ignore: cast_nullable_to_non_nullable
as double,industrialTVA: null == industrialTVA ? _self.industrialTVA : industrialTVA // ignore: cast_nullable_to_non_nullable
as double,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as int,triggerDate: null == triggerDate ? _self.triggerDate : triggerDate // ignore: cast_nullable_to_non_nullable
as int,triggerMessage: freezed == triggerMessage ? _self.triggerMessage : triggerMessage // ignore: cast_nullable_to_non_nullable
as String?,ampereSchedulePricingEnabled: null == ampereSchedulePricingEnabled ? _self.ampereSchedulePricingEnabled : ampereSchedulePricingEnabled // ignore: cast_nullable_to_non_nullable
as bool,ampereProrateByDaysEnabled: null == ampereProrateByDaysEnabled ? _self.ampereProrateByDaysEnabled : ampereProrateByDaysEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatePreferencesRequest].
extension UpdatePreferencesRequestPatterns on UpdatePreferencesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePreferencesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePreferencesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePreferencesRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePreferencesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePreferencesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePreferencesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  double residentialPricePerAmp,  double residentialPricePerKilowat,  double residentialFixedCharge,  double residentialTVA,  double commercialPricePerAmp,  double commercialPricePerKilowat,  double commercialFixedCharge,  double commercialTVA,  double industrialPricePerAmp,  double industrialPricePerKilowat,  double industrialFixedCharge,  double industrialTVA,  String language,  int dueDate,  int triggerDate,  String? triggerMessage,  bool ampereSchedulePricingEnabled,  bool ampereProrateByDaysEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatePreferencesRequest() when $default != null:
return $default(_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.residentialPricePerAmp,_that.residentialPricePerKilowat,_that.residentialFixedCharge,_that.residentialTVA,_that.commercialPricePerAmp,_that.commercialPricePerKilowat,_that.commercialFixedCharge,_that.commercialTVA,_that.industrialPricePerAmp,_that.industrialPricePerKilowat,_that.industrialFixedCharge,_that.industrialTVA,_that.language,_that.dueDate,_that.triggerDate,_that.triggerMessage,_that.ampereSchedulePricingEnabled,_that.ampereProrateByDaysEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  double residentialPricePerAmp,  double residentialPricePerKilowat,  double residentialFixedCharge,  double residentialTVA,  double commercialPricePerAmp,  double commercialPricePerKilowat,  double commercialFixedCharge,  double commercialTVA,  double industrialPricePerAmp,  double industrialPricePerKilowat,  double industrialFixedCharge,  double industrialTVA,  String language,  int dueDate,  int triggerDate,  String? triggerMessage,  bool ampereSchedulePricingEnabled,  bool ampereProrateByDaysEnabled)  $default,) {final _that = this;
switch (_that) {
case _UpdatePreferencesRequest():
return $default(_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.residentialPricePerAmp,_that.residentialPricePerKilowat,_that.residentialFixedCharge,_that.residentialTVA,_that.commercialPricePerAmp,_that.commercialPricePerKilowat,_that.commercialFixedCharge,_that.commercialTVA,_that.industrialPricePerAmp,_that.industrialPricePerKilowat,_that.industrialFixedCharge,_that.industrialTVA,_that.language,_that.dueDate,_that.triggerDate,_that.triggerMessage,_that.ampereSchedulePricingEnabled,_that.ampereProrateByDaysEnabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double pricePerKilowat,  double pricePerAmp,  double fixedCharge,  double tva,  double residentialPricePerAmp,  double residentialPricePerKilowat,  double residentialFixedCharge,  double residentialTVA,  double commercialPricePerAmp,  double commercialPricePerKilowat,  double commercialFixedCharge,  double commercialTVA,  double industrialPricePerAmp,  double industrialPricePerKilowat,  double industrialFixedCharge,  double industrialTVA,  String language,  int dueDate,  int triggerDate,  String? triggerMessage,  bool ampereSchedulePricingEnabled,  bool ampereProrateByDaysEnabled)?  $default,) {final _that = this;
switch (_that) {
case _UpdatePreferencesRequest() when $default != null:
return $default(_that.pricePerKilowat,_that.pricePerAmp,_that.fixedCharge,_that.tva,_that.residentialPricePerAmp,_that.residentialPricePerKilowat,_that.residentialFixedCharge,_that.residentialTVA,_that.commercialPricePerAmp,_that.commercialPricePerKilowat,_that.commercialFixedCharge,_that.commercialTVA,_that.industrialPricePerAmp,_that.industrialPricePerKilowat,_that.industrialFixedCharge,_that.industrialTVA,_that.language,_that.dueDate,_that.triggerDate,_that.triggerMessage,_that.ampereSchedulePricingEnabled,_that.ampereProrateByDaysEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatePreferencesRequest implements UpdatePreferencesRequest {
  const _UpdatePreferencesRequest({required this.pricePerKilowat, required this.pricePerAmp, required this.fixedCharge, required this.tva, required this.residentialPricePerAmp, required this.residentialPricePerKilowat, required this.residentialFixedCharge, required this.residentialTVA, required this.commercialPricePerAmp, required this.commercialPricePerKilowat, required this.commercialFixedCharge, required this.commercialTVA, required this.industrialPricePerAmp, required this.industrialPricePerKilowat, required this.industrialFixedCharge, required this.industrialTVA, required this.language, required this.dueDate, required this.triggerDate, this.triggerMessage, required this.ampereSchedulePricingEnabled, required this.ampereProrateByDaysEnabled});
  factory _UpdatePreferencesRequest.fromJson(Map<String, dynamic> json) => _$UpdatePreferencesRequestFromJson(json);

@override final  double pricePerKilowat;
@override final  double pricePerAmp;
@override final  double fixedCharge;
@override final  double tva;
@override final  double residentialPricePerAmp;
@override final  double residentialPricePerKilowat;
@override final  double residentialFixedCharge;
@override final  double residentialTVA;
@override final  double commercialPricePerAmp;
@override final  double commercialPricePerKilowat;
@override final  double commercialFixedCharge;
@override final  double commercialTVA;
@override final  double industrialPricePerAmp;
@override final  double industrialPricePerKilowat;
@override final  double industrialFixedCharge;
@override final  double industrialTVA;
@override final  String language;
@override final  int dueDate;
@override final  int triggerDate;
@override final  String? triggerMessage;
@override final  bool ampereSchedulePricingEnabled;
@override final  bool ampereProrateByDaysEnabled;

/// Create a copy of UpdatePreferencesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePreferencesRequestCopyWith<_UpdatePreferencesRequest> get copyWith => __$UpdatePreferencesRequestCopyWithImpl<_UpdatePreferencesRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePreferencesRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePreferencesRequest&&(identical(other.pricePerKilowat, pricePerKilowat) || other.pricePerKilowat == pricePerKilowat)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.residentialPricePerAmp, residentialPricePerAmp) || other.residentialPricePerAmp == residentialPricePerAmp)&&(identical(other.residentialPricePerKilowat, residentialPricePerKilowat) || other.residentialPricePerKilowat == residentialPricePerKilowat)&&(identical(other.residentialFixedCharge, residentialFixedCharge) || other.residentialFixedCharge == residentialFixedCharge)&&(identical(other.residentialTVA, residentialTVA) || other.residentialTVA == residentialTVA)&&(identical(other.commercialPricePerAmp, commercialPricePerAmp) || other.commercialPricePerAmp == commercialPricePerAmp)&&(identical(other.commercialPricePerKilowat, commercialPricePerKilowat) || other.commercialPricePerKilowat == commercialPricePerKilowat)&&(identical(other.commercialFixedCharge, commercialFixedCharge) || other.commercialFixedCharge == commercialFixedCharge)&&(identical(other.commercialTVA, commercialTVA) || other.commercialTVA == commercialTVA)&&(identical(other.industrialPricePerAmp, industrialPricePerAmp) || other.industrialPricePerAmp == industrialPricePerAmp)&&(identical(other.industrialPricePerKilowat, industrialPricePerKilowat) || other.industrialPricePerKilowat == industrialPricePerKilowat)&&(identical(other.industrialFixedCharge, industrialFixedCharge) || other.industrialFixedCharge == industrialFixedCharge)&&(identical(other.industrialTVA, industrialTVA) || other.industrialTVA == industrialTVA)&&(identical(other.language, language) || other.language == language)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.triggerDate, triggerDate) || other.triggerDate == triggerDate)&&(identical(other.triggerMessage, triggerMessage) || other.triggerMessage == triggerMessage)&&(identical(other.ampereSchedulePricingEnabled, ampereSchedulePricingEnabled) || other.ampereSchedulePricingEnabled == ampereSchedulePricingEnabled)&&(identical(other.ampereProrateByDaysEnabled, ampereProrateByDaysEnabled) || other.ampereProrateByDaysEnabled == ampereProrateByDaysEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,pricePerKilowat,pricePerAmp,fixedCharge,tva,residentialPricePerAmp,residentialPricePerKilowat,residentialFixedCharge,residentialTVA,commercialPricePerAmp,commercialPricePerKilowat,commercialFixedCharge,commercialTVA,industrialPricePerAmp,industrialPricePerKilowat,industrialFixedCharge,industrialTVA,language,dueDate,triggerDate,triggerMessage,ampereSchedulePricingEnabled,ampereProrateByDaysEnabled]);

@override
String toString() {
  return 'UpdatePreferencesRequest(pricePerKilowat: $pricePerKilowat, pricePerAmp: $pricePerAmp, fixedCharge: $fixedCharge, tva: $tva, residentialPricePerAmp: $residentialPricePerAmp, residentialPricePerKilowat: $residentialPricePerKilowat, residentialFixedCharge: $residentialFixedCharge, residentialTVA: $residentialTVA, commercialPricePerAmp: $commercialPricePerAmp, commercialPricePerKilowat: $commercialPricePerKilowat, commercialFixedCharge: $commercialFixedCharge, commercialTVA: $commercialTVA, industrialPricePerAmp: $industrialPricePerAmp, industrialPricePerKilowat: $industrialPricePerKilowat, industrialFixedCharge: $industrialFixedCharge, industrialTVA: $industrialTVA, language: $language, dueDate: $dueDate, triggerDate: $triggerDate, triggerMessage: $triggerMessage, ampereSchedulePricingEnabled: $ampereSchedulePricingEnabled, ampereProrateByDaysEnabled: $ampereProrateByDaysEnabled)';
}


}

/// @nodoc
abstract mixin class _$UpdatePreferencesRequestCopyWith<$Res> implements $UpdatePreferencesRequestCopyWith<$Res> {
  factory _$UpdatePreferencesRequestCopyWith(_UpdatePreferencesRequest value, $Res Function(_UpdatePreferencesRequest) _then) = __$UpdatePreferencesRequestCopyWithImpl;
@override @useResult
$Res call({
 double pricePerKilowat, double pricePerAmp, double fixedCharge, double tva, double residentialPricePerAmp, double residentialPricePerKilowat, double residentialFixedCharge, double residentialTVA, double commercialPricePerAmp, double commercialPricePerKilowat, double commercialFixedCharge, double commercialTVA, double industrialPricePerAmp, double industrialPricePerKilowat, double industrialFixedCharge, double industrialTVA, String language, int dueDate, int triggerDate, String? triggerMessage, bool ampereSchedulePricingEnabled, bool ampereProrateByDaysEnabled
});




}
/// @nodoc
class __$UpdatePreferencesRequestCopyWithImpl<$Res>
    implements _$UpdatePreferencesRequestCopyWith<$Res> {
  __$UpdatePreferencesRequestCopyWithImpl(this._self, this._then);

  final _UpdatePreferencesRequest _self;
  final $Res Function(_UpdatePreferencesRequest) _then;

/// Create a copy of UpdatePreferencesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pricePerKilowat = null,Object? pricePerAmp = null,Object? fixedCharge = null,Object? tva = null,Object? residentialPricePerAmp = null,Object? residentialPricePerKilowat = null,Object? residentialFixedCharge = null,Object? residentialTVA = null,Object? commercialPricePerAmp = null,Object? commercialPricePerKilowat = null,Object? commercialFixedCharge = null,Object? commercialTVA = null,Object? industrialPricePerAmp = null,Object? industrialPricePerKilowat = null,Object? industrialFixedCharge = null,Object? industrialTVA = null,Object? language = null,Object? dueDate = null,Object? triggerDate = null,Object? triggerMessage = freezed,Object? ampereSchedulePricingEnabled = null,Object? ampereProrateByDaysEnabled = null,}) {
  return _then(_UpdatePreferencesRequest(
pricePerKilowat: null == pricePerKilowat ? _self.pricePerKilowat : pricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,pricePerAmp: null == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,residentialPricePerAmp: null == residentialPricePerAmp ? _self.residentialPricePerAmp : residentialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,residentialPricePerKilowat: null == residentialPricePerKilowat ? _self.residentialPricePerKilowat : residentialPricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,residentialFixedCharge: null == residentialFixedCharge ? _self.residentialFixedCharge : residentialFixedCharge // ignore: cast_nullable_to_non_nullable
as double,residentialTVA: null == residentialTVA ? _self.residentialTVA : residentialTVA // ignore: cast_nullable_to_non_nullable
as double,commercialPricePerAmp: null == commercialPricePerAmp ? _self.commercialPricePerAmp : commercialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,commercialPricePerKilowat: null == commercialPricePerKilowat ? _self.commercialPricePerKilowat : commercialPricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,commercialFixedCharge: null == commercialFixedCharge ? _self.commercialFixedCharge : commercialFixedCharge // ignore: cast_nullable_to_non_nullable
as double,commercialTVA: null == commercialTVA ? _self.commercialTVA : commercialTVA // ignore: cast_nullable_to_non_nullable
as double,industrialPricePerAmp: null == industrialPricePerAmp ? _self.industrialPricePerAmp : industrialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,industrialPricePerKilowat: null == industrialPricePerKilowat ? _self.industrialPricePerKilowat : industrialPricePerKilowat // ignore: cast_nullable_to_non_nullable
as double,industrialFixedCharge: null == industrialFixedCharge ? _self.industrialFixedCharge : industrialFixedCharge // ignore: cast_nullable_to_non_nullable
as double,industrialTVA: null == industrialTVA ? _self.industrialTVA : industrialTVA // ignore: cast_nullable_to_non_nullable
as double,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as int,triggerDate: null == triggerDate ? _self.triggerDate : triggerDate // ignore: cast_nullable_to_non_nullable
as int,triggerMessage: freezed == triggerMessage ? _self.triggerMessage : triggerMessage // ignore: cast_nullable_to_non_nullable
as String?,ampereSchedulePricingEnabled: null == ampereSchedulePricingEnabled ? _self.ampereSchedulePricingEnabled : ampereSchedulePricingEnabled // ignore: cast_nullable_to_non_nullable
as bool,ampereProrateByDaysEnabled: null == ampereProrateByDaysEnabled ? _self.ampereProrateByDaysEnabled : ampereProrateByDaysEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
