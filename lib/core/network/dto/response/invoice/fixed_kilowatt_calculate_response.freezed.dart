// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fixed_kilowatt_calculate_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FixedKilowattCalculateResponse {

 double get paymentAmount; double get kilowattAmount; double get unitPrice; double get fixedCharge; double get tva; double get planValue; String get customerType;
/// Create a copy of FixedKilowattCalculateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixedKilowattCalculateResponseCopyWith<FixedKilowattCalculateResponse> get copyWith => _$FixedKilowattCalculateResponseCopyWithImpl<FixedKilowattCalculateResponse>(this as FixedKilowattCalculateResponse, _$identity);

  /// Serializes this FixedKilowattCalculateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixedKilowattCalculateResponse&&(identical(other.paymentAmount, paymentAmount) || other.paymentAmount == paymentAmount)&&(identical(other.kilowattAmount, kilowattAmount) || other.kilowattAmount == kilowattAmount)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.customerType, customerType) || other.customerType == customerType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentAmount,kilowattAmount,unitPrice,fixedCharge,tva,planValue,customerType);

@override
String toString() {
  return 'FixedKilowattCalculateResponse(paymentAmount: $paymentAmount, kilowattAmount: $kilowattAmount, unitPrice: $unitPrice, fixedCharge: $fixedCharge, tva: $tva, planValue: $planValue, customerType: $customerType)';
}


}

/// @nodoc
abstract mixin class $FixedKilowattCalculateResponseCopyWith<$Res>  {
  factory $FixedKilowattCalculateResponseCopyWith(FixedKilowattCalculateResponse value, $Res Function(FixedKilowattCalculateResponse) _then) = _$FixedKilowattCalculateResponseCopyWithImpl;
@useResult
$Res call({
 double paymentAmount, double kilowattAmount, double unitPrice, double fixedCharge, double tva, double planValue, String customerType
});




}
/// @nodoc
class _$FixedKilowattCalculateResponseCopyWithImpl<$Res>
    implements $FixedKilowattCalculateResponseCopyWith<$Res> {
  _$FixedKilowattCalculateResponseCopyWithImpl(this._self, this._then);

  final FixedKilowattCalculateResponse _self;
  final $Res Function(FixedKilowattCalculateResponse) _then;

/// Create a copy of FixedKilowattCalculateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentAmount = null,Object? kilowattAmount = null,Object? unitPrice = null,Object? fixedCharge = null,Object? tva = null,Object? planValue = null,Object? customerType = null,}) {
  return _then(_self.copyWith(
paymentAmount: null == paymentAmount ? _self.paymentAmount : paymentAmount // ignore: cast_nullable_to_non_nullable
as double,kilowattAmount: null == kilowattAmount ? _self.kilowattAmount : kilowattAmount // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FixedKilowattCalculateResponse].
extension FixedKilowattCalculateResponsePatterns on FixedKilowattCalculateResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixedKilowattCalculateResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixedKilowattCalculateResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixedKilowattCalculateResponse value)  $default,){
final _that = this;
switch (_that) {
case _FixedKilowattCalculateResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixedKilowattCalculateResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FixedKilowattCalculateResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double paymentAmount,  double kilowattAmount,  double unitPrice,  double fixedCharge,  double tva,  double planValue,  String customerType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixedKilowattCalculateResponse() when $default != null:
return $default(_that.paymentAmount,_that.kilowattAmount,_that.unitPrice,_that.fixedCharge,_that.tva,_that.planValue,_that.customerType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double paymentAmount,  double kilowattAmount,  double unitPrice,  double fixedCharge,  double tva,  double planValue,  String customerType)  $default,) {final _that = this;
switch (_that) {
case _FixedKilowattCalculateResponse():
return $default(_that.paymentAmount,_that.kilowattAmount,_that.unitPrice,_that.fixedCharge,_that.tva,_that.planValue,_that.customerType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double paymentAmount,  double kilowattAmount,  double unitPrice,  double fixedCharge,  double tva,  double planValue,  String customerType)?  $default,) {final _that = this;
switch (_that) {
case _FixedKilowattCalculateResponse() when $default != null:
return $default(_that.paymentAmount,_that.kilowattAmount,_that.unitPrice,_that.fixedCharge,_that.tva,_that.planValue,_that.customerType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixedKilowattCalculateResponse implements FixedKilowattCalculateResponse {
  const _FixedKilowattCalculateResponse({required this.paymentAmount, required this.kilowattAmount, required this.unitPrice, required this.fixedCharge, required this.tva, required this.planValue, required this.customerType});
  factory _FixedKilowattCalculateResponse.fromJson(Map<String, dynamic> json) => _$FixedKilowattCalculateResponseFromJson(json);

@override final  double paymentAmount;
@override final  double kilowattAmount;
@override final  double unitPrice;
@override final  double fixedCharge;
@override final  double tva;
@override final  double planValue;
@override final  String customerType;

/// Create a copy of FixedKilowattCalculateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixedKilowattCalculateResponseCopyWith<_FixedKilowattCalculateResponse> get copyWith => __$FixedKilowattCalculateResponseCopyWithImpl<_FixedKilowattCalculateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixedKilowattCalculateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixedKilowattCalculateResponse&&(identical(other.paymentAmount, paymentAmount) || other.paymentAmount == paymentAmount)&&(identical(other.kilowattAmount, kilowattAmount) || other.kilowattAmount == kilowattAmount)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.customerType, customerType) || other.customerType == customerType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentAmount,kilowattAmount,unitPrice,fixedCharge,tva,planValue,customerType);

@override
String toString() {
  return 'FixedKilowattCalculateResponse(paymentAmount: $paymentAmount, kilowattAmount: $kilowattAmount, unitPrice: $unitPrice, fixedCharge: $fixedCharge, tva: $tva, planValue: $planValue, customerType: $customerType)';
}


}

/// @nodoc
abstract mixin class _$FixedKilowattCalculateResponseCopyWith<$Res> implements $FixedKilowattCalculateResponseCopyWith<$Res> {
  factory _$FixedKilowattCalculateResponseCopyWith(_FixedKilowattCalculateResponse value, $Res Function(_FixedKilowattCalculateResponse) _then) = __$FixedKilowattCalculateResponseCopyWithImpl;
@override @useResult
$Res call({
 double paymentAmount, double kilowattAmount, double unitPrice, double fixedCharge, double tva, double planValue, String customerType
});




}
/// @nodoc
class __$FixedKilowattCalculateResponseCopyWithImpl<$Res>
    implements _$FixedKilowattCalculateResponseCopyWith<$Res> {
  __$FixedKilowattCalculateResponseCopyWithImpl(this._self, this._then);

  final _FixedKilowattCalculateResponse _self;
  final $Res Function(_FixedKilowattCalculateResponse) _then;

/// Create a copy of FixedKilowattCalculateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentAmount = null,Object? kilowattAmount = null,Object? unitPrice = null,Object? fixedCharge = null,Object? tva = null,Object? planValue = null,Object? customerType = null,}) {
  return _then(_FixedKilowattCalculateResponse(
paymentAmount: null == paymentAmount ? _self.paymentAmount : paymentAmount // ignore: cast_nullable_to_non_nullable
as double,kilowattAmount: null == kilowattAmount ? _self.kilowattAmount : kilowattAmount // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
