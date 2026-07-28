// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_customer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCustomerRequest {

 String get name; String? get phone; String? get address; String? get building; String? get floor; String? get cableName; String? get boxId; String? get ampereScheduleId; String? get areaId; CustomerType get customerType; PlanType get plan; double get planValue; double? get initialMeterReading;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get subscriptionDate; CustomerRelation? get customerRelation; CustomerPricingOverrideDto? get pricingOverride;
/// Create a copy of CreateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCustomerRequestCopyWith<CreateCustomerRequest> get copyWith => _$CreateCustomerRequestCopyWithImpl<CreateCustomerRequest>(this as CreateCustomerRequest, _$identity);

  /// Serializes this CreateCustomerRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCustomerRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.building, building) || other.building == building)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.cableName, cableName) || other.cableName == cableName)&&(identical(other.boxId, boxId) || other.boxId == boxId)&&(identical(other.ampereScheduleId, ampereScheduleId) || other.ampereScheduleId == ampereScheduleId)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.initialMeterReading, initialMeterReading) || other.initialMeterReading == initialMeterReading)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,address,building,floor,cableName,boxId,ampereScheduleId,areaId,customerType,plan,planValue,initialMeterReading,subscriptionDate,customerRelation,pricingOverride);

@override
String toString() {
  return 'CreateCustomerRequest(name: $name, phone: $phone, address: $address, building: $building, floor: $floor, cableName: $cableName, boxId: $boxId, ampereScheduleId: $ampereScheduleId, areaId: $areaId, customerType: $customerType, plan: $plan, planValue: $planValue, initialMeterReading: $initialMeterReading, subscriptionDate: $subscriptionDate, customerRelation: $customerRelation, pricingOverride: $pricingOverride)';
}


}

/// @nodoc
abstract mixin class $CreateCustomerRequestCopyWith<$Res>  {
  factory $CreateCustomerRequestCopyWith(CreateCustomerRequest value, $Res Function(CreateCustomerRequest) _then) = _$CreateCustomerRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? phone, String? address, String? building, String? floor, String? cableName, String? boxId, String? ampereScheduleId, String? areaId, CustomerType customerType, PlanType plan, double planValue, double? initialMeterReading,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? subscriptionDate, CustomerRelation? customerRelation, CustomerPricingOverrideDto? pricingOverride
});


$CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class _$CreateCustomerRequestCopyWithImpl<$Res>
    implements $CreateCustomerRequestCopyWith<$Res> {
  _$CreateCustomerRequestCopyWithImpl(this._self, this._then);

  final CreateCustomerRequest _self;
  final $Res Function(CreateCustomerRequest) _then;

/// Create a copy of CreateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = freezed,Object? address = freezed,Object? building = freezed,Object? floor = freezed,Object? cableName = freezed,Object? boxId = freezed,Object? ampereScheduleId = freezed,Object? areaId = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? initialMeterReading = freezed,Object? subscriptionDate = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,cableName: freezed == cableName ? _self.cableName : cableName // ignore: cast_nullable_to_non_nullable
as String?,boxId: freezed == boxId ? _self.boxId : boxId // ignore: cast_nullable_to_non_nullable
as String?,ampereScheduleId: freezed == ampereScheduleId ? _self.ampereScheduleId : ampereScheduleId // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,initialMeterReading: freezed == initialMeterReading ? _self.initialMeterReading : initialMeterReading // ignore: cast_nullable_to_non_nullable
as double?,subscriptionDate: freezed == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,
  ));
}
/// Create a copy of CreateCustomerRequest
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


/// Adds pattern-matching-related methods to [CreateCustomerRequest].
extension CreateCustomerRequestPatterns on CreateCustomerRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCustomerRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCustomerRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCustomerRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateCustomerRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCustomerRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCustomerRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? phone,  String? address,  String? building,  String? floor,  String? cableName,  String? boxId,  String? ampereScheduleId,  String? areaId,  CustomerType customerType,  PlanType plan,  double planValue,  double? initialMeterReading, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCustomerRequest() when $default != null:
return $default(_that.name,_that.phone,_that.address,_that.building,_that.floor,_that.cableName,_that.boxId,_that.ampereScheduleId,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.initialMeterReading,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? phone,  String? address,  String? building,  String? floor,  String? cableName,  String? boxId,  String? ampereScheduleId,  String? areaId,  CustomerType customerType,  PlanType plan,  double planValue,  double? initialMeterReading, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride)  $default,) {final _that = this;
switch (_that) {
case _CreateCustomerRequest():
return $default(_that.name,_that.phone,_that.address,_that.building,_that.floor,_that.cableName,_that.boxId,_that.ampereScheduleId,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.initialMeterReading,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? phone,  String? address,  String? building,  String? floor,  String? cableName,  String? boxId,  String? ampereScheduleId,  String? areaId,  CustomerType customerType,  PlanType plan,  double planValue,  double? initialMeterReading, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride)?  $default,) {final _that = this;
switch (_that) {
case _CreateCustomerRequest() when $default != null:
return $default(_that.name,_that.phone,_that.address,_that.building,_that.floor,_that.cableName,_that.boxId,_that.ampereScheduleId,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.initialMeterReading,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCustomerRequest implements CreateCustomerRequest {
  const _CreateCustomerRequest({required this.name, this.phone, this.address, this.building, this.floor, this.cableName, this.boxId, this.ampereScheduleId, this.areaId, required this.customerType, required this.plan, required this.planValue, this.initialMeterReading, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.subscriptionDate, this.customerRelation, this.pricingOverride});
  factory _CreateCustomerRequest.fromJson(Map<String, dynamic> json) => _$CreateCustomerRequestFromJson(json);

@override final  String name;
@override final  String? phone;
@override final  String? address;
@override final  String? building;
@override final  String? floor;
@override final  String? cableName;
@override final  String? boxId;
@override final  String? ampereScheduleId;
@override final  String? areaId;
@override final  CustomerType customerType;
@override final  PlanType plan;
@override final  double planValue;
@override final  double? initialMeterReading;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? subscriptionDate;
@override final  CustomerRelation? customerRelation;
@override final  CustomerPricingOverrideDto? pricingOverride;

/// Create a copy of CreateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCustomerRequestCopyWith<_CreateCustomerRequest> get copyWith => __$CreateCustomerRequestCopyWithImpl<_CreateCustomerRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCustomerRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCustomerRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.building, building) || other.building == building)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.cableName, cableName) || other.cableName == cableName)&&(identical(other.boxId, boxId) || other.boxId == boxId)&&(identical(other.ampereScheduleId, ampereScheduleId) || other.ampereScheduleId == ampereScheduleId)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.initialMeterReading, initialMeterReading) || other.initialMeterReading == initialMeterReading)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,address,building,floor,cableName,boxId,ampereScheduleId,areaId,customerType,plan,planValue,initialMeterReading,subscriptionDate,customerRelation,pricingOverride);

@override
String toString() {
  return 'CreateCustomerRequest(name: $name, phone: $phone, address: $address, building: $building, floor: $floor, cableName: $cableName, boxId: $boxId, ampereScheduleId: $ampereScheduleId, areaId: $areaId, customerType: $customerType, plan: $plan, planValue: $planValue, initialMeterReading: $initialMeterReading, subscriptionDate: $subscriptionDate, customerRelation: $customerRelation, pricingOverride: $pricingOverride)';
}


}

/// @nodoc
abstract mixin class _$CreateCustomerRequestCopyWith<$Res> implements $CreateCustomerRequestCopyWith<$Res> {
  factory _$CreateCustomerRequestCopyWith(_CreateCustomerRequest value, $Res Function(_CreateCustomerRequest) _then) = __$CreateCustomerRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? phone, String? address, String? building, String? floor, String? cableName, String? boxId, String? ampereScheduleId, String? areaId, CustomerType customerType, PlanType plan, double planValue, double? initialMeterReading,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? subscriptionDate, CustomerRelation? customerRelation, CustomerPricingOverrideDto? pricingOverride
});


@override $CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class __$CreateCustomerRequestCopyWithImpl<$Res>
    implements _$CreateCustomerRequestCopyWith<$Res> {
  __$CreateCustomerRequestCopyWithImpl(this._self, this._then);

  final _CreateCustomerRequest _self;
  final $Res Function(_CreateCustomerRequest) _then;

/// Create a copy of CreateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = freezed,Object? address = freezed,Object? building = freezed,Object? floor = freezed,Object? cableName = freezed,Object? boxId = freezed,Object? ampereScheduleId = freezed,Object? areaId = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? initialMeterReading = freezed,Object? subscriptionDate = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,}) {
  return _then(_CreateCustomerRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,cableName: freezed == cableName ? _self.cableName : cableName // ignore: cast_nullable_to_non_nullable
as String?,boxId: freezed == boxId ? _self.boxId : boxId // ignore: cast_nullable_to_non_nullable
as String?,ampereScheduleId: freezed == ampereScheduleId ? _self.ampereScheduleId : ampereScheduleId // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,initialMeterReading: freezed == initialMeterReading ? _self.initialMeterReading : initialMeterReading // ignore: cast_nullable_to_non_nullable
as double?,subscriptionDate: freezed == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,
  ));
}

/// Create a copy of CreateCustomerRequest
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
