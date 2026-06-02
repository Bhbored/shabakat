// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerUpdateRequest {

 String? get name; String? get phone; String? get address; String? get areaId; String? get customerType; String? get plan; double? get planValue; String? get customerStatus; String? get customerRelation; CustomerPricingOverrideDto? get pricingOverride; bool get clearPricingOverride;
/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerUpdateRequestCopyWith<CustomerUpdateRequest> get copyWith => _$CustomerUpdateRequestCopyWithImpl<CustomerUpdateRequest>(this as CustomerUpdateRequest, _$identity);

  /// Serializes this CustomerUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerUpdateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride)&&(identical(other.clearPricingOverride, clearPricingOverride) || other.clearPricingOverride == clearPricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,address,areaId,customerType,plan,planValue,customerStatus,customerRelation,pricingOverride,clearPricingOverride);

@override
String toString() {
  return 'CustomerUpdateRequest(name: $name, phone: $phone, address: $address, areaId: $areaId, customerType: $customerType, plan: $plan, planValue: $planValue, customerStatus: $customerStatus, customerRelation: $customerRelation, pricingOverride: $pricingOverride, clearPricingOverride: $clearPricingOverride)';
}


}

/// @nodoc
abstract mixin class $CustomerUpdateRequestCopyWith<$Res>  {
  factory $CustomerUpdateRequestCopyWith(CustomerUpdateRequest value, $Res Function(CustomerUpdateRequest) _then) = _$CustomerUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? phone, String? address, String? areaId, String? customerType, String? plan, double? planValue, String? customerStatus, String? customerRelation, CustomerPricingOverrideDto? pricingOverride, bool clearPricingOverride
});


$CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class _$CustomerUpdateRequestCopyWithImpl<$Res>
    implements $CustomerUpdateRequestCopyWith<$Res> {
  _$CustomerUpdateRequestCopyWithImpl(this._self, this._then);

  final CustomerUpdateRequest _self;
  final $Res Function(CustomerUpdateRequest) _then;

/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? phone = freezed,Object? address = freezed,Object? areaId = freezed,Object? customerType = freezed,Object? plan = freezed,Object? planValue = freezed,Object? customerStatus = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,Object? clearPricingOverride = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,customerType: freezed == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String?,planValue: freezed == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double?,customerStatus: freezed == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as String?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as String?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,clearPricingOverride: null == clearPricingOverride ? _self.clearPricingOverride : clearPricingOverride // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride {
    if (_self.pricingOverride == null) {
    return null;
  }

  return $CustomerPricingOverrideDtoCopyWith<$Res>(_self.pricingOverride!, (value) {
    return _then(_self.copyWith(pricingOverride: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomerUpdateRequest].
extension CustomerUpdateRequestPatterns on CustomerUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _CustomerUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? phone,  String? address,  String? areaId,  String? customerType,  String? plan,  double? planValue,  String? customerStatus,  String? customerRelation,  CustomerPricingOverrideDto? pricingOverride,  bool clearPricingOverride)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerUpdateRequest() when $default != null:
return $default(_that.name,_that.phone,_that.address,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.customerRelation,_that.pricingOverride,_that.clearPricingOverride);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? phone,  String? address,  String? areaId,  String? customerType,  String? plan,  double? planValue,  String? customerStatus,  String? customerRelation,  CustomerPricingOverrideDto? pricingOverride,  bool clearPricingOverride)  $default,) {final _that = this;
switch (_that) {
case _CustomerUpdateRequest():
return $default(_that.name,_that.phone,_that.address,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.customerRelation,_that.pricingOverride,_that.clearPricingOverride);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? phone,  String? address,  String? areaId,  String? customerType,  String? plan,  double? planValue,  String? customerStatus,  String? customerRelation,  CustomerPricingOverrideDto? pricingOverride,  bool clearPricingOverride)?  $default,) {final _that = this;
switch (_that) {
case _CustomerUpdateRequest() when $default != null:
return $default(_that.name,_that.phone,_that.address,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.customerRelation,_that.pricingOverride,_that.clearPricingOverride);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerUpdateRequest implements CustomerUpdateRequest {
  const _CustomerUpdateRequest({this.name, this.phone, this.address, this.areaId, this.customerType, this.plan, this.planValue, this.customerStatus, this.customerRelation, this.pricingOverride, this.clearPricingOverride = false});
  factory _CustomerUpdateRequest.fromJson(Map<String, dynamic> json) => _$CustomerUpdateRequestFromJson(json);

@override final  String? name;
@override final  String? phone;
@override final  String? address;
@override final  String? areaId;
@override final  String? customerType;
@override final  String? plan;
@override final  double? planValue;
@override final  String? customerStatus;
@override final  String? customerRelation;
@override final  CustomerPricingOverrideDto? pricingOverride;
@override@JsonKey() final  bool clearPricingOverride;

/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerUpdateRequestCopyWith<_CustomerUpdateRequest> get copyWith => __$CustomerUpdateRequestCopyWithImpl<_CustomerUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerUpdateRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride)&&(identical(other.clearPricingOverride, clearPricingOverride) || other.clearPricingOverride == clearPricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,address,areaId,customerType,plan,planValue,customerStatus,customerRelation,pricingOverride,clearPricingOverride);

@override
String toString() {
  return 'CustomerUpdateRequest(name: $name, phone: $phone, address: $address, areaId: $areaId, customerType: $customerType, plan: $plan, planValue: $planValue, customerStatus: $customerStatus, customerRelation: $customerRelation, pricingOverride: $pricingOverride, clearPricingOverride: $clearPricingOverride)';
}


}

/// @nodoc
abstract mixin class _$CustomerUpdateRequestCopyWith<$Res> implements $CustomerUpdateRequestCopyWith<$Res> {
  factory _$CustomerUpdateRequestCopyWith(_CustomerUpdateRequest value, $Res Function(_CustomerUpdateRequest) _then) = __$CustomerUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? phone, String? address, String? areaId, String? customerType, String? plan, double? planValue, String? customerStatus, String? customerRelation, CustomerPricingOverrideDto? pricingOverride, bool clearPricingOverride
});


@override $CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class __$CustomerUpdateRequestCopyWithImpl<$Res>
    implements _$CustomerUpdateRequestCopyWith<$Res> {
  __$CustomerUpdateRequestCopyWithImpl(this._self, this._then);

  final _CustomerUpdateRequest _self;
  final $Res Function(_CustomerUpdateRequest) _then;

/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? phone = freezed,Object? address = freezed,Object? areaId = freezed,Object? customerType = freezed,Object? plan = freezed,Object? planValue = freezed,Object? customerStatus = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,Object? clearPricingOverride = null,}) {
  return _then(_CustomerUpdateRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,customerType: freezed == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String?,planValue: freezed == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double?,customerStatus: freezed == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as String?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as String?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,clearPricingOverride: null == clearPricingOverride ? _self.clearPricingOverride : clearPricingOverride // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride {
    if (_self.pricingOverride == null) {
    return null;
  }

  return $CustomerPricingOverrideDtoCopyWith<$Res>(_self.pricingOverride!, (value) {
    return _then(_self.copyWith(pricingOverride: value));
  });
}
}

// dart format on
