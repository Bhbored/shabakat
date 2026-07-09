// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_customer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCustomerRequest {

 String? get name; String? get phone; String? get areaId; String? get address; String? get building; String? get floor; String? get cableName; String? get boxId; String? get ampereScheduleId; CustomerType? get customerType; PlanType? get plan; double? get planValue; CustomerStatus? get customerStatus; CustomerRelation? get customerRelation; CustomerPricingOverrideDto? get pricingOverride; bool get clearPricingOverride;
/// Create a copy of UpdateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCustomerRequestCopyWith<UpdateCustomerRequest> get copyWith => _$UpdateCustomerRequestCopyWithImpl<UpdateCustomerRequest>(this as UpdateCustomerRequest, _$identity);

  /// Serializes this UpdateCustomerRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCustomerRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.address, address) || other.address == address)&&(identical(other.building, building) || other.building == building)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.cableName, cableName) || other.cableName == cableName)&&(identical(other.boxId, boxId) || other.boxId == boxId)&&(identical(other.ampereScheduleId, ampereScheduleId) || other.ampereScheduleId == ampereScheduleId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride)&&(identical(other.clearPricingOverride, clearPricingOverride) || other.clearPricingOverride == clearPricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,areaId,address,building,floor,cableName,boxId,ampereScheduleId,customerType,plan,planValue,customerStatus,customerRelation,pricingOverride,clearPricingOverride);

@override
String toString() {
  return 'UpdateCustomerRequest(name: $name, phone: $phone, areaId: $areaId, address: $address, building: $building, floor: $floor, cableName: $cableName, boxId: $boxId, ampereScheduleId: $ampereScheduleId, customerType: $customerType, plan: $plan, planValue: $planValue, customerStatus: $customerStatus, customerRelation: $customerRelation, pricingOverride: $pricingOverride, clearPricingOverride: $clearPricingOverride)';
}


}

/// @nodoc
abstract mixin class $UpdateCustomerRequestCopyWith<$Res>  {
  factory $UpdateCustomerRequestCopyWith(UpdateCustomerRequest value, $Res Function(UpdateCustomerRequest) _then) = _$UpdateCustomerRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? phone, String? areaId, String? address, String? building, String? floor, String? cableName, String? boxId, String? ampereScheduleId, CustomerType? customerType, PlanType? plan, double? planValue, CustomerStatus? customerStatus, CustomerRelation? customerRelation, CustomerPricingOverrideDto? pricingOverride, bool clearPricingOverride
});


$CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class _$UpdateCustomerRequestCopyWithImpl<$Res>
    implements $UpdateCustomerRequestCopyWith<$Res> {
  _$UpdateCustomerRequestCopyWithImpl(this._self, this._then);

  final UpdateCustomerRequest _self;
  final $Res Function(UpdateCustomerRequest) _then;

/// Create a copy of UpdateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? phone = freezed,Object? areaId = freezed,Object? address = freezed,Object? building = freezed,Object? floor = freezed,Object? cableName = freezed,Object? boxId = freezed,Object? ampereScheduleId = freezed,Object? customerType = freezed,Object? plan = freezed,Object? planValue = freezed,Object? customerStatus = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,Object? clearPricingOverride = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,cableName: freezed == cableName ? _self.cableName : cableName // ignore: cast_nullable_to_non_nullable
as String?,boxId: freezed == boxId ? _self.boxId : boxId // ignore: cast_nullable_to_non_nullable
as String?,ampereScheduleId: freezed == ampereScheduleId ? _self.ampereScheduleId : ampereScheduleId // ignore: cast_nullable_to_non_nullable
as String?,customerType: freezed == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType?,planValue: freezed == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double?,customerStatus: freezed == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as CustomerStatus?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,clearPricingOverride: null == clearPricingOverride ? _self.clearPricingOverride : clearPricingOverride // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of UpdateCustomerRequest
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


/// Adds pattern-matching-related methods to [UpdateCustomerRequest].
extension UpdateCustomerRequestPatterns on UpdateCustomerRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCustomerRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCustomerRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCustomerRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCustomerRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCustomerRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCustomerRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? phone,  String? areaId,  String? address,  String? building,  String? floor,  String? cableName,  String? boxId,  String? ampereScheduleId,  CustomerType? customerType,  PlanType? plan,  double? planValue,  CustomerStatus? customerStatus,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride,  bool clearPricingOverride)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCustomerRequest() when $default != null:
return $default(_that.name,_that.phone,_that.areaId,_that.address,_that.building,_that.floor,_that.cableName,_that.boxId,_that.ampereScheduleId,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.customerRelation,_that.pricingOverride,_that.clearPricingOverride);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? phone,  String? areaId,  String? address,  String? building,  String? floor,  String? cableName,  String? boxId,  String? ampereScheduleId,  CustomerType? customerType,  PlanType? plan,  double? planValue,  CustomerStatus? customerStatus,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride,  bool clearPricingOverride)  $default,) {final _that = this;
switch (_that) {
case _UpdateCustomerRequest():
return $default(_that.name,_that.phone,_that.areaId,_that.address,_that.building,_that.floor,_that.cableName,_that.boxId,_that.ampereScheduleId,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.customerRelation,_that.pricingOverride,_that.clearPricingOverride);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? phone,  String? areaId,  String? address,  String? building,  String? floor,  String? cableName,  String? boxId,  String? ampereScheduleId,  CustomerType? customerType,  PlanType? plan,  double? planValue,  CustomerStatus? customerStatus,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride,  bool clearPricingOverride)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCustomerRequest() when $default != null:
return $default(_that.name,_that.phone,_that.areaId,_that.address,_that.building,_that.floor,_that.cableName,_that.boxId,_that.ampereScheduleId,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.customerRelation,_that.pricingOverride,_that.clearPricingOverride);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCustomerRequest implements UpdateCustomerRequest {
  const _UpdateCustomerRequest({this.name, this.phone, this.areaId, this.address, this.building, this.floor, this.cableName, this.boxId, this.ampereScheduleId, this.customerType, this.plan, this.planValue, this.customerStatus, this.customerRelation, this.pricingOverride, this.clearPricingOverride = false});
  factory _UpdateCustomerRequest.fromJson(Map<String, dynamic> json) => _$UpdateCustomerRequestFromJson(json);

@override final  String? name;
@override final  String? phone;
@override final  String? areaId;
@override final  String? address;
@override final  String? building;
@override final  String? floor;
@override final  String? cableName;
@override final  String? boxId;
@override final  String? ampereScheduleId;
@override final  CustomerType? customerType;
@override final  PlanType? plan;
@override final  double? planValue;
@override final  CustomerStatus? customerStatus;
@override final  CustomerRelation? customerRelation;
@override final  CustomerPricingOverrideDto? pricingOverride;
@override@JsonKey() final  bool clearPricingOverride;

/// Create a copy of UpdateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCustomerRequestCopyWith<_UpdateCustomerRequest> get copyWith => __$UpdateCustomerRequestCopyWithImpl<_UpdateCustomerRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCustomerRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCustomerRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.address, address) || other.address == address)&&(identical(other.building, building) || other.building == building)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.cableName, cableName) || other.cableName == cableName)&&(identical(other.boxId, boxId) || other.boxId == boxId)&&(identical(other.ampereScheduleId, ampereScheduleId) || other.ampereScheduleId == ampereScheduleId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride)&&(identical(other.clearPricingOverride, clearPricingOverride) || other.clearPricingOverride == clearPricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,areaId,address,building,floor,cableName,boxId,ampereScheduleId,customerType,plan,planValue,customerStatus,customerRelation,pricingOverride,clearPricingOverride);

@override
String toString() {
  return 'UpdateCustomerRequest(name: $name, phone: $phone, areaId: $areaId, address: $address, building: $building, floor: $floor, cableName: $cableName, boxId: $boxId, ampereScheduleId: $ampereScheduleId, customerType: $customerType, plan: $plan, planValue: $planValue, customerStatus: $customerStatus, customerRelation: $customerRelation, pricingOverride: $pricingOverride, clearPricingOverride: $clearPricingOverride)';
}


}

/// @nodoc
abstract mixin class _$UpdateCustomerRequestCopyWith<$Res> implements $UpdateCustomerRequestCopyWith<$Res> {
  factory _$UpdateCustomerRequestCopyWith(_UpdateCustomerRequest value, $Res Function(_UpdateCustomerRequest) _then) = __$UpdateCustomerRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? phone, String? areaId, String? address, String? building, String? floor, String? cableName, String? boxId, String? ampereScheduleId, CustomerType? customerType, PlanType? plan, double? planValue, CustomerStatus? customerStatus, CustomerRelation? customerRelation, CustomerPricingOverrideDto? pricingOverride, bool clearPricingOverride
});


@override $CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class __$UpdateCustomerRequestCopyWithImpl<$Res>
    implements _$UpdateCustomerRequestCopyWith<$Res> {
  __$UpdateCustomerRequestCopyWithImpl(this._self, this._then);

  final _UpdateCustomerRequest _self;
  final $Res Function(_UpdateCustomerRequest) _then;

/// Create a copy of UpdateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? phone = freezed,Object? areaId = freezed,Object? address = freezed,Object? building = freezed,Object? floor = freezed,Object? cableName = freezed,Object? boxId = freezed,Object? ampereScheduleId = freezed,Object? customerType = freezed,Object? plan = freezed,Object? planValue = freezed,Object? customerStatus = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,Object? clearPricingOverride = null,}) {
  return _then(_UpdateCustomerRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,cableName: freezed == cableName ? _self.cableName : cableName // ignore: cast_nullable_to_non_nullable
as String?,boxId: freezed == boxId ? _self.boxId : boxId // ignore: cast_nullable_to_non_nullable
as String?,ampereScheduleId: freezed == ampereScheduleId ? _self.ampereScheduleId : ampereScheduleId // ignore: cast_nullable_to_non_nullable
as String?,customerType: freezed == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType?,planValue: freezed == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double?,customerStatus: freezed == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as CustomerStatus?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,clearPricingOverride: null == clearPricingOverride ? _self.clearPricingOverride : clearPricingOverride // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of UpdateCustomerRequest
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
