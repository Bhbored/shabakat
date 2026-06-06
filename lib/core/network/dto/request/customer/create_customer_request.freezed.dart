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

 String get name; String? get phone; String? get address; String? get areaId; String get customerType; String get plan; double get planValue;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get subscriptionDate; String? get customerRelation; CustomerPricingOverrideDto? get pricingOverride;
/// Create a copy of CreateCustomerRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCustomerRequestCopyWith<CreateCustomerRequest> get copyWith => _$CreateCustomerRequestCopyWithImpl<CreateCustomerRequest>(this as CreateCustomerRequest, _$identity);

  /// Serializes this CreateCustomerRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCustomerRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,address,areaId,customerType,plan,planValue,subscriptionDate,customerRelation,pricingOverride);

@override
String toString() {
  return 'CreateCustomerRequest(name: $name, phone: $phone, address: $address, areaId: $areaId, customerType: $customerType, plan: $plan, planValue: $planValue, subscriptionDate: $subscriptionDate, customerRelation: $customerRelation, pricingOverride: $pricingOverride)';
}


}

/// @nodoc
abstract mixin class $CreateCustomerRequestCopyWith<$Res>  {
  factory $CreateCustomerRequestCopyWith(CreateCustomerRequest value, $Res Function(CreateCustomerRequest) _then) = _$CreateCustomerRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? phone, String? address, String? areaId, String customerType, String plan, double planValue,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? subscriptionDate, String? customerRelation, CustomerPricingOverrideDto? pricingOverride
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = freezed,Object? address = freezed,Object? areaId = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? subscriptionDate = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,subscriptionDate: freezed == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as String?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? phone,  String? address,  String? areaId,  String customerType,  String plan,  double planValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  String? customerRelation,  CustomerPricingOverrideDto? pricingOverride)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCustomerRequest() when $default != null:
return $default(_that.name,_that.phone,_that.address,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? phone,  String? address,  String? areaId,  String customerType,  String plan,  double planValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  String? customerRelation,  CustomerPricingOverrideDto? pricingOverride)  $default,) {final _that = this;
switch (_that) {
case _CreateCustomerRequest():
return $default(_that.name,_that.phone,_that.address,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? phone,  String? address,  String? areaId,  String customerType,  String plan,  double planValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  String? customerRelation,  CustomerPricingOverrideDto? pricingOverride)?  $default,) {final _that = this;
switch (_that) {
case _CreateCustomerRequest() when $default != null:
return $default(_that.name,_that.phone,_that.address,_that.areaId,_that.customerType,_that.plan,_that.planValue,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCustomerRequest implements CreateCustomerRequest {
  const _CreateCustomerRequest({required this.name, this.phone, this.address, this.areaId, required this.customerType, required this.plan, required this.planValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.subscriptionDate, this.customerRelation, this.pricingOverride});
  factory _CreateCustomerRequest.fromJson(Map<String, dynamic> json) => _$CreateCustomerRequestFromJson(json);

@override final  String name;
@override final  String? phone;
@override final  String? address;
@override final  String? areaId;
@override final  String customerType;
@override final  String plan;
@override final  double planValue;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? subscriptionDate;
@override final  String? customerRelation;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCustomerRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,address,areaId,customerType,plan,planValue,subscriptionDate,customerRelation,pricingOverride);

@override
String toString() {
  return 'CreateCustomerRequest(name: $name, phone: $phone, address: $address, areaId: $areaId, customerType: $customerType, plan: $plan, planValue: $planValue, subscriptionDate: $subscriptionDate, customerRelation: $customerRelation, pricingOverride: $pricingOverride)';
}


}

/// @nodoc
abstract mixin class _$CreateCustomerRequestCopyWith<$Res> implements $CreateCustomerRequestCopyWith<$Res> {
  factory _$CreateCustomerRequestCopyWith(_CreateCustomerRequest value, $Res Function(_CreateCustomerRequest) _then) = __$CreateCustomerRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? phone, String? address, String? areaId, String customerType, String plan, double planValue,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? subscriptionDate, String? customerRelation, CustomerPricingOverrideDto? pricingOverride
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = freezed,Object? address = freezed,Object? areaId = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? subscriptionDate = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,}) {
  return _then(_CreateCustomerRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,subscriptionDate: freezed == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as String?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
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
