// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_add_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerAddRequest {

 String get name; String? get phone; String? get address; CustomerType get customerType; PlanType get plan; double get planValue;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get subscriptionDate; CustomerRelation? get customerRelation; CustomerPricingOverrideDto? get pricingOverride;
/// Create a copy of CustomerAddRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerAddRequestCopyWith<CustomerAddRequest> get copyWith => _$CustomerAddRequestCopyWithImpl<CustomerAddRequest>(this as CustomerAddRequest, _$identity);

  /// Serializes this CustomerAddRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerAddRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,address,customerType,plan,planValue,subscriptionDate,customerRelation,pricingOverride);

@override
String toString() {
  return 'CustomerAddRequest(name: $name, phone: $phone, address: $address, customerType: $customerType, plan: $plan, planValue: $planValue, subscriptionDate: $subscriptionDate, customerRelation: $customerRelation, pricingOverride: $pricingOverride)';
}


}

/// @nodoc
abstract mixin class $CustomerAddRequestCopyWith<$Res>  {
  factory $CustomerAddRequestCopyWith(CustomerAddRequest value, $Res Function(CustomerAddRequest) _then) = _$CustomerAddRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? phone, String? address, CustomerType customerType, PlanType plan, double planValue,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? subscriptionDate, CustomerRelation? customerRelation, CustomerPricingOverrideDto? pricingOverride
});


$CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class _$CustomerAddRequestCopyWithImpl<$Res>
    implements $CustomerAddRequestCopyWith<$Res> {
  _$CustomerAddRequestCopyWithImpl(this._self, this._then);

  final CustomerAddRequest _self;
  final $Res Function(CustomerAddRequest) _then;

/// Create a copy of CustomerAddRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = freezed,Object? address = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? subscriptionDate = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,subscriptionDate: freezed == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,
  ));
}
/// Create a copy of CustomerAddRequest
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


/// Adds pattern-matching-related methods to [CustomerAddRequest].
extension CustomerAddRequestPatterns on CustomerAddRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerAddRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerAddRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerAddRequest value)  $default,){
final _that = this;
switch (_that) {
case _CustomerAddRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerAddRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerAddRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? phone,  String? address,  CustomerType customerType,  PlanType plan,  double planValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerAddRequest() when $default != null:
return $default(_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? phone,  String? address,  CustomerType customerType,  PlanType plan,  double planValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride)  $default,) {final _that = this;
switch (_that) {
case _CustomerAddRequest():
return $default(_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? phone,  String? address,  CustomerType customerType,  PlanType plan,  double planValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? subscriptionDate,  CustomerRelation? customerRelation,  CustomerPricingOverrideDto? pricingOverride)?  $default,) {final _that = this;
switch (_that) {
case _CustomerAddRequest() when $default != null:
return $default(_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.subscriptionDate,_that.customerRelation,_that.pricingOverride);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerAddRequest implements CustomerAddRequest {
  const _CustomerAddRequest({required this.name, this.phone, this.address, required this.customerType, required this.plan, required this.planValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.subscriptionDate, this.customerRelation, this.pricingOverride});
  factory _CustomerAddRequest.fromJson(Map<String, dynamic> json) => _$CustomerAddRequestFromJson(json);

@override final  String name;
@override final  String? phone;
@override final  String? address;
@override final  CustomerType customerType;
@override final  PlanType plan;
@override final  double planValue;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? subscriptionDate;
@override final  CustomerRelation? customerRelation;
@override final  CustomerPricingOverrideDto? pricingOverride;

/// Create a copy of CustomerAddRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerAddRequestCopyWith<_CustomerAddRequest> get copyWith => __$CustomerAddRequestCopyWithImpl<_CustomerAddRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerAddRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerAddRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,address,customerType,plan,planValue,subscriptionDate,customerRelation,pricingOverride);

@override
String toString() {
  return 'CustomerAddRequest(name: $name, phone: $phone, address: $address, customerType: $customerType, plan: $plan, planValue: $planValue, subscriptionDate: $subscriptionDate, customerRelation: $customerRelation, pricingOverride: $pricingOverride)';
}


}

/// @nodoc
abstract mixin class _$CustomerAddRequestCopyWith<$Res> implements $CustomerAddRequestCopyWith<$Res> {
  factory _$CustomerAddRequestCopyWith(_CustomerAddRequest value, $Res Function(_CustomerAddRequest) _then) = __$CustomerAddRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? phone, String? address, CustomerType customerType, PlanType plan, double planValue,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? subscriptionDate, CustomerRelation? customerRelation, CustomerPricingOverrideDto? pricingOverride
});


@override $CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class __$CustomerAddRequestCopyWithImpl<$Res>
    implements _$CustomerAddRequestCopyWith<$Res> {
  __$CustomerAddRequestCopyWithImpl(this._self, this._then);

  final _CustomerAddRequest _self;
  final $Res Function(_CustomerAddRequest) _then;

/// Create a copy of CustomerAddRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = freezed,Object? address = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? subscriptionDate = freezed,Object? customerRelation = freezed,Object? pricingOverride = freezed,}) {
  return _then(_CustomerAddRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,subscriptionDate: freezed == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,
  ));
}

/// Create a copy of CustomerAddRequest
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
