// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fixed_kilowatt_calculate_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FixedKilowattCalculateRequest {

 CustomerType get customerType; double? get planValue; double? get paymentAmount; double? get kilowattAmount;
/// Create a copy of FixedKilowattCalculateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FixedKilowattCalculateRequestCopyWith<FixedKilowattCalculateRequest> get copyWith => _$FixedKilowattCalculateRequestCopyWithImpl<FixedKilowattCalculateRequest>(this as FixedKilowattCalculateRequest, _$identity);

  /// Serializes this FixedKilowattCalculateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FixedKilowattCalculateRequest&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.paymentAmount, paymentAmount) || other.paymentAmount == paymentAmount)&&(identical(other.kilowattAmount, kilowattAmount) || other.kilowattAmount == kilowattAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerType,planValue,paymentAmount,kilowattAmount);

@override
String toString() {
  return 'FixedKilowattCalculateRequest(customerType: $customerType, planValue: $planValue, paymentAmount: $paymentAmount, kilowattAmount: $kilowattAmount)';
}


}

/// @nodoc
abstract mixin class $FixedKilowattCalculateRequestCopyWith<$Res>  {
  factory $FixedKilowattCalculateRequestCopyWith(FixedKilowattCalculateRequest value, $Res Function(FixedKilowattCalculateRequest) _then) = _$FixedKilowattCalculateRequestCopyWithImpl;
@useResult
$Res call({
 CustomerType customerType, double? planValue, double? paymentAmount, double? kilowattAmount
});




}
/// @nodoc
class _$FixedKilowattCalculateRequestCopyWithImpl<$Res>
    implements $FixedKilowattCalculateRequestCopyWith<$Res> {
  _$FixedKilowattCalculateRequestCopyWithImpl(this._self, this._then);

  final FixedKilowattCalculateRequest _self;
  final $Res Function(FixedKilowattCalculateRequest) _then;

/// Create a copy of FixedKilowattCalculateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerType = null,Object? planValue = freezed,Object? paymentAmount = freezed,Object? kilowattAmount = freezed,}) {
  return _then(_self.copyWith(
customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,planValue: freezed == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double?,paymentAmount: freezed == paymentAmount ? _self.paymentAmount : paymentAmount // ignore: cast_nullable_to_non_nullable
as double?,kilowattAmount: freezed == kilowattAmount ? _self.kilowattAmount : kilowattAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FixedKilowattCalculateRequest].
extension FixedKilowattCalculateRequestPatterns on FixedKilowattCalculateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FixedKilowattCalculateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FixedKilowattCalculateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FixedKilowattCalculateRequest value)  $default,){
final _that = this;
switch (_that) {
case _FixedKilowattCalculateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FixedKilowattCalculateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FixedKilowattCalculateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomerType customerType,  double? planValue,  double? paymentAmount,  double? kilowattAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FixedKilowattCalculateRequest() when $default != null:
return $default(_that.customerType,_that.planValue,_that.paymentAmount,_that.kilowattAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomerType customerType,  double? planValue,  double? paymentAmount,  double? kilowattAmount)  $default,) {final _that = this;
switch (_that) {
case _FixedKilowattCalculateRequest():
return $default(_that.customerType,_that.planValue,_that.paymentAmount,_that.kilowattAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomerType customerType,  double? planValue,  double? paymentAmount,  double? kilowattAmount)?  $default,) {final _that = this;
switch (_that) {
case _FixedKilowattCalculateRequest() when $default != null:
return $default(_that.customerType,_that.planValue,_that.paymentAmount,_that.kilowattAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FixedKilowattCalculateRequest implements FixedKilowattCalculateRequest {
  const _FixedKilowattCalculateRequest({required this.customerType, this.planValue, this.paymentAmount, this.kilowattAmount});
  factory _FixedKilowattCalculateRequest.fromJson(Map<String, dynamic> json) => _$FixedKilowattCalculateRequestFromJson(json);

@override final  CustomerType customerType;
@override final  double? planValue;
@override final  double? paymentAmount;
@override final  double? kilowattAmount;

/// Create a copy of FixedKilowattCalculateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixedKilowattCalculateRequestCopyWith<_FixedKilowattCalculateRequest> get copyWith => __$FixedKilowattCalculateRequestCopyWithImpl<_FixedKilowattCalculateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FixedKilowattCalculateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FixedKilowattCalculateRequest&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.paymentAmount, paymentAmount) || other.paymentAmount == paymentAmount)&&(identical(other.kilowattAmount, kilowattAmount) || other.kilowattAmount == kilowattAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerType,planValue,paymentAmount,kilowattAmount);

@override
String toString() {
  return 'FixedKilowattCalculateRequest(customerType: $customerType, planValue: $planValue, paymentAmount: $paymentAmount, kilowattAmount: $kilowattAmount)';
}


}

/// @nodoc
abstract mixin class _$FixedKilowattCalculateRequestCopyWith<$Res> implements $FixedKilowattCalculateRequestCopyWith<$Res> {
  factory _$FixedKilowattCalculateRequestCopyWith(_FixedKilowattCalculateRequest value, $Res Function(_FixedKilowattCalculateRequest) _then) = __$FixedKilowattCalculateRequestCopyWithImpl;
@override @useResult
$Res call({
 CustomerType customerType, double? planValue, double? paymentAmount, double? kilowattAmount
});




}
/// @nodoc
class __$FixedKilowattCalculateRequestCopyWithImpl<$Res>
    implements _$FixedKilowattCalculateRequestCopyWith<$Res> {
  __$FixedKilowattCalculateRequestCopyWithImpl(this._self, this._then);

  final _FixedKilowattCalculateRequest _self;
  final $Res Function(_FixedKilowattCalculateRequest) _then;

/// Create a copy of FixedKilowattCalculateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerType = null,Object? planValue = freezed,Object? paymentAmount = freezed,Object? kilowattAmount = freezed,}) {
  return _then(_FixedKilowattCalculateRequest(
customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,planValue: freezed == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double?,paymentAmount: freezed == paymentAmount ? _self.paymentAmount : paymentAmount // ignore: cast_nullable_to_non_nullable
as double?,kilowattAmount: freezed == kilowattAmount ? _self.kilowattAmount : kilowattAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
