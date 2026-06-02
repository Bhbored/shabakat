// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerResponse {

 String get id; String get name; String? get phone; String? get address; String get customerType; String get plan; double get planValue; String? get areaName; String get customerStatus;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get subscriptionDate; DateTime get createdAt; String? get customerRelation; bool get hasPricingOverride; CustomerPricingOverrideDto? get pricingOverride; double get totalBilled; double get totalPaid; double get totalOutstanding; bool get paidThisMonth;
/// Create a copy of CustomerResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerResponseCopyWith<CustomerResponse> get copyWith => _$CustomerResponseCopyWithImpl<CustomerResponse>(this as CustomerResponse, _$identity);

  /// Serializes this CustomerResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.hasPricingOverride, hasPricingOverride) || other.hasPricingOverride == hasPricingOverride)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride)&&(identical(other.totalBilled, totalBilled) || other.totalBilled == totalBilled)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.paidThisMonth, paidThisMonth) || other.paidThisMonth == paidThisMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,customerType,plan,planValue,areaName,customerStatus,subscriptionDate,createdAt,customerRelation,hasPricingOverride,pricingOverride,totalBilled,totalPaid,totalOutstanding,paidThisMonth);

@override
String toString() {
  return 'CustomerResponse(id: $id, name: $name, phone: $phone, address: $address, customerType: $customerType, plan: $plan, planValue: $planValue, areaName: $areaName, customerStatus: $customerStatus, subscriptionDate: $subscriptionDate, createdAt: $createdAt, customerRelation: $customerRelation, hasPricingOverride: $hasPricingOverride, pricingOverride: $pricingOverride, totalBilled: $totalBilled, totalPaid: $totalPaid, totalOutstanding: $totalOutstanding, paidThisMonth: $paidThisMonth)';
}


}

/// @nodoc
abstract mixin class $CustomerResponseCopyWith<$Res>  {
  factory $CustomerResponseCopyWith(CustomerResponse value, $Res Function(CustomerResponse) _then) = _$CustomerResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? phone, String? address, String customerType, String plan, double planValue, String? areaName, String customerStatus,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime subscriptionDate, DateTime createdAt, String? customerRelation, bool hasPricingOverride, CustomerPricingOverrideDto? pricingOverride, double totalBilled, double totalPaid, double totalOutstanding, bool paidThisMonth
});


$CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class _$CustomerResponseCopyWithImpl<$Res>
    implements $CustomerResponseCopyWith<$Res> {
  _$CustomerResponseCopyWithImpl(this._self, this._then);

  final CustomerResponse _self;
  final $Res Function(CustomerResponse) _then;

/// Create a copy of CustomerResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? address = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? areaName = freezed,Object? customerStatus = null,Object? subscriptionDate = null,Object? createdAt = null,Object? customerRelation = freezed,Object? hasPricingOverride = null,Object? pricingOverride = freezed,Object? totalBilled = null,Object? totalPaid = null,Object? totalOutstanding = null,Object? paidThisMonth = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,customerStatus: null == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionDate: null == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as String?,hasPricingOverride: null == hasPricingOverride ? _self.hasPricingOverride : hasPricingOverride // ignore: cast_nullable_to_non_nullable
as bool,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,totalBilled: null == totalBilled ? _self.totalBilled : totalBilled // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as double,paidThisMonth: null == paidThisMonth ? _self.paidThisMonth : paidThisMonth // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CustomerResponse
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


/// Adds pattern-matching-related methods to [CustomerResponse].
extension CustomerResponsePatterns on CustomerResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerResponse value)  $default,){
final _that = this;
switch (_that) {
case _CustomerResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? phone,  String? address,  String customerType,  String plan,  double planValue,  String? areaName,  String customerStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime subscriptionDate,  DateTime createdAt,  String? customerRelation,  bool hasPricingOverride,  CustomerPricingOverrideDto? pricingOverride,  double totalBilled,  double totalPaid,  double totalOutstanding,  bool paidThisMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerResponse() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.areaName,_that.customerStatus,_that.subscriptionDate,_that.createdAt,_that.customerRelation,_that.hasPricingOverride,_that.pricingOverride,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.paidThisMonth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? phone,  String? address,  String customerType,  String plan,  double planValue,  String? areaName,  String customerStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime subscriptionDate,  DateTime createdAt,  String? customerRelation,  bool hasPricingOverride,  CustomerPricingOverrideDto? pricingOverride,  double totalBilled,  double totalPaid,  double totalOutstanding,  bool paidThisMonth)  $default,) {final _that = this;
switch (_that) {
case _CustomerResponse():
return $default(_that.id,_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.areaName,_that.customerStatus,_that.subscriptionDate,_that.createdAt,_that.customerRelation,_that.hasPricingOverride,_that.pricingOverride,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.paidThisMonth);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? phone,  String? address,  String customerType,  String plan,  double planValue,  String? areaName,  String customerStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime subscriptionDate,  DateTime createdAt,  String? customerRelation,  bool hasPricingOverride,  CustomerPricingOverrideDto? pricingOverride,  double totalBilled,  double totalPaid,  double totalOutstanding,  bool paidThisMonth)?  $default,) {final _that = this;
switch (_that) {
case _CustomerResponse() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.areaName,_that.customerStatus,_that.subscriptionDate,_that.createdAt,_that.customerRelation,_that.hasPricingOverride,_that.pricingOverride,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.paidThisMonth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerResponse implements CustomerResponse {
  const _CustomerResponse({required this.id, required this.name, this.phone, this.address, required this.customerType, required this.plan, required this.planValue, this.areaName, required this.customerStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.subscriptionDate, required this.createdAt, this.customerRelation, required this.hasPricingOverride, this.pricingOverride, required this.totalBilled, required this.totalPaid, required this.totalOutstanding, required this.paidThisMonth});
  factory _CustomerResponse.fromJson(Map<String, dynamic> json) => _$CustomerResponseFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? phone;
@override final  String? address;
@override final  String customerType;
@override final  String plan;
@override final  double planValue;
@override final  String? areaName;
@override final  String customerStatus;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime subscriptionDate;
@override final  DateTime createdAt;
@override final  String? customerRelation;
@override final  bool hasPricingOverride;
@override final  CustomerPricingOverrideDto? pricingOverride;
@override final  double totalBilled;
@override final  double totalPaid;
@override final  double totalOutstanding;
@override final  bool paidThisMonth;

/// Create a copy of CustomerResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerResponseCopyWith<_CustomerResponse> get copyWith => __$CustomerResponseCopyWithImpl<_CustomerResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.hasPricingOverride, hasPricingOverride) || other.hasPricingOverride == hasPricingOverride)&&(identical(other.pricingOverride, pricingOverride) || other.pricingOverride == pricingOverride)&&(identical(other.totalBilled, totalBilled) || other.totalBilled == totalBilled)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.paidThisMonth, paidThisMonth) || other.paidThisMonth == paidThisMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,customerType,plan,planValue,areaName,customerStatus,subscriptionDate,createdAt,customerRelation,hasPricingOverride,pricingOverride,totalBilled,totalPaid,totalOutstanding,paidThisMonth);

@override
String toString() {
  return 'CustomerResponse(id: $id, name: $name, phone: $phone, address: $address, customerType: $customerType, plan: $plan, planValue: $planValue, areaName: $areaName, customerStatus: $customerStatus, subscriptionDate: $subscriptionDate, createdAt: $createdAt, customerRelation: $customerRelation, hasPricingOverride: $hasPricingOverride, pricingOverride: $pricingOverride, totalBilled: $totalBilled, totalPaid: $totalPaid, totalOutstanding: $totalOutstanding, paidThisMonth: $paidThisMonth)';
}


}

/// @nodoc
abstract mixin class _$CustomerResponseCopyWith<$Res> implements $CustomerResponseCopyWith<$Res> {
  factory _$CustomerResponseCopyWith(_CustomerResponse value, $Res Function(_CustomerResponse) _then) = __$CustomerResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? phone, String? address, String customerType, String plan, double planValue, String? areaName, String customerStatus,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime subscriptionDate, DateTime createdAt, String? customerRelation, bool hasPricingOverride, CustomerPricingOverrideDto? pricingOverride, double totalBilled, double totalPaid, double totalOutstanding, bool paidThisMonth
});


@override $CustomerPricingOverrideDtoCopyWith<$Res>? get pricingOverride;

}
/// @nodoc
class __$CustomerResponseCopyWithImpl<$Res>
    implements _$CustomerResponseCopyWith<$Res> {
  __$CustomerResponseCopyWithImpl(this._self, this._then);

  final _CustomerResponse _self;
  final $Res Function(_CustomerResponse) _then;

/// Create a copy of CustomerResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? address = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? areaName = freezed,Object? customerStatus = null,Object? subscriptionDate = null,Object? createdAt = null,Object? customerRelation = freezed,Object? hasPricingOverride = null,Object? pricingOverride = freezed,Object? totalBilled = null,Object? totalPaid = null,Object? totalOutstanding = null,Object? paidThisMonth = null,}) {
  return _then(_CustomerResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,customerStatus: null == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionDate: null == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as String?,hasPricingOverride: null == hasPricingOverride ? _self.hasPricingOverride : hasPricingOverride // ignore: cast_nullable_to_non_nullable
as bool,pricingOverride: freezed == pricingOverride ? _self.pricingOverride : pricingOverride // ignore: cast_nullable_to_non_nullable
as CustomerPricingOverrideDto?,totalBilled: null == totalBilled ? _self.totalBilled : totalBilled // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as double,paidThisMonth: null == paidThisMonth ? _self.paidThisMonth : paidThisMonth // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CustomerResponse
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
