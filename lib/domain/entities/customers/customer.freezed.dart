// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Customer {

 String get id; DateTime get createdAt; DateTime get updatedAt; String get companyId; String get name; double? get totalBilled; double? get totalPaid; double? get totalOutstanding; String? get phone; String? get address; String? get areaName; String? get areaId; CustomerType get customerType; CustomerRelation? get customerRelation; DateTime get subscriptionDate; double? get priceOverride; double? get fixedChargeOverride; double? get tvaOverride; CustomerStatus get customerStatus; PlanType get plan; double get planValue; List<Invoice>? get invoices;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.totalBilled, totalBilled) || other.totalBilled == totalBilled)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.priceOverride, priceOverride) || other.priceOverride == priceOverride)&&(identical(other.fixedChargeOverride, fixedChargeOverride) || other.fixedChargeOverride == fixedChargeOverride)&&(identical(other.tvaOverride, tvaOverride) || other.tvaOverride == tvaOverride)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&const DeepCollectionEquality().equals(other.invoices, invoices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,companyId,name,totalBilled,totalPaid,totalOutstanding,phone,address,areaName,areaId,customerType,customerRelation,subscriptionDate,priceOverride,fixedChargeOverride,tvaOverride,customerStatus,plan,planValue,const DeepCollectionEquality().hash(invoices)]);

@override
String toString() {
  return 'Customer(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, companyId: $companyId, name: $name, totalBilled: $totalBilled, totalPaid: $totalPaid, totalOutstanding: $totalOutstanding, phone: $phone, address: $address, areaName: $areaName, areaId: $areaId, customerType: $customerType, customerRelation: $customerRelation, subscriptionDate: $subscriptionDate, priceOverride: $priceOverride, fixedChargeOverride: $fixedChargeOverride, tvaOverride: $tvaOverride, customerStatus: $customerStatus, plan: $plan, planValue: $planValue, invoices: $invoices)';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, String companyId, String name, double? totalBilled, double? totalPaid, double? totalOutstanding, String? phone, String? address, String? areaName, String? areaId, CustomerType customerType, CustomerRelation? customerRelation, DateTime subscriptionDate, double? priceOverride, double? fixedChargeOverride, double? tvaOverride, CustomerStatus customerStatus, PlanType plan, double planValue, List<Invoice>? invoices
});




}
/// @nodoc
class _$CustomerCopyWithImpl<$Res>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._self, this._then);

  final Customer _self;
  final $Res Function(Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? companyId = null,Object? name = null,Object? totalBilled = freezed,Object? totalPaid = freezed,Object? totalOutstanding = freezed,Object? phone = freezed,Object? address = freezed,Object? areaName = freezed,Object? areaId = freezed,Object? customerType = null,Object? customerRelation = freezed,Object? subscriptionDate = null,Object? priceOverride = freezed,Object? fixedChargeOverride = freezed,Object? tvaOverride = freezed,Object? customerStatus = null,Object? plan = null,Object? planValue = null,Object? invoices = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,totalBilled: freezed == totalBilled ? _self.totalBilled : totalBilled // ignore: cast_nullable_to_non_nullable
as double?,totalPaid: freezed == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double?,totalOutstanding: freezed == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as double?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,subscriptionDate: null == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime,priceOverride: freezed == priceOverride ? _self.priceOverride : priceOverride // ignore: cast_nullable_to_non_nullable
as double?,fixedChargeOverride: freezed == fixedChargeOverride ? _self.fixedChargeOverride : fixedChargeOverride // ignore: cast_nullable_to_non_nullable
as double?,tvaOverride: freezed == tvaOverride ? _self.tvaOverride : tvaOverride // ignore: cast_nullable_to_non_nullable
as double?,customerStatus: null == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as CustomerStatus,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,invoices: freezed == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Customer].
extension CustomerPatterns on Customer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Customer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Customer value)  $default,){
final _that = this;
switch (_that) {
case _Customer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Customer value)?  $default,){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  String name,  double? totalBilled,  double? totalPaid,  double? totalOutstanding,  String? phone,  String? address,  String? areaName,  String? areaId,  CustomerType customerType,  CustomerRelation? customerRelation,  DateTime subscriptionDate,  double? priceOverride,  double? fixedChargeOverride,  double? tvaOverride,  CustomerStatus customerStatus,  PlanType plan,  double planValue,  List<Invoice>? invoices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.name,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.phone,_that.address,_that.areaName,_that.areaId,_that.customerType,_that.customerRelation,_that.subscriptionDate,_that.priceOverride,_that.fixedChargeOverride,_that.tvaOverride,_that.customerStatus,_that.plan,_that.planValue,_that.invoices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  String name,  double? totalBilled,  double? totalPaid,  double? totalOutstanding,  String? phone,  String? address,  String? areaName,  String? areaId,  CustomerType customerType,  CustomerRelation? customerRelation,  DateTime subscriptionDate,  double? priceOverride,  double? fixedChargeOverride,  double? tvaOverride,  CustomerStatus customerStatus,  PlanType plan,  double planValue,  List<Invoice>? invoices)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.name,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.phone,_that.address,_that.areaName,_that.areaId,_that.customerType,_that.customerRelation,_that.subscriptionDate,_that.priceOverride,_that.fixedChargeOverride,_that.tvaOverride,_that.customerStatus,_that.plan,_that.planValue,_that.invoices);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  String name,  double? totalBilled,  double? totalPaid,  double? totalOutstanding,  String? phone,  String? address,  String? areaName,  String? areaId,  CustomerType customerType,  CustomerRelation? customerRelation,  DateTime subscriptionDate,  double? priceOverride,  double? fixedChargeOverride,  double? tvaOverride,  CustomerStatus customerStatus,  PlanType plan,  double planValue,  List<Invoice>? invoices)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.name,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.phone,_that.address,_that.areaName,_that.areaId,_that.customerType,_that.customerRelation,_that.subscriptionDate,_that.priceOverride,_that.fixedChargeOverride,_that.tvaOverride,_that.customerStatus,_that.plan,_that.planValue,_that.invoices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer implements Customer {
  const _Customer({required this.id, required this.createdAt, required this.updatedAt, required this.companyId, required this.name, this.totalBilled, this.totalPaid, this.totalOutstanding, this.phone, this.address, this.areaName, this.areaId, required this.customerType, this.customerRelation, required this.subscriptionDate, this.priceOverride, this.fixedChargeOverride, this.tvaOverride, this.customerStatus = CustomerStatus.active, required this.plan, required this.planValue, final  List<Invoice>? invoices}): _invoices = invoices;
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String companyId;
@override final  String name;
@override final  double? totalBilled;
@override final  double? totalPaid;
@override final  double? totalOutstanding;
@override final  String? phone;
@override final  String? address;
@override final  String? areaName;
@override final  String? areaId;
@override final  CustomerType customerType;
@override final  CustomerRelation? customerRelation;
@override final  DateTime subscriptionDate;
@override final  double? priceOverride;
@override final  double? fixedChargeOverride;
@override final  double? tvaOverride;
@override@JsonKey() final  CustomerStatus customerStatus;
@override final  PlanType plan;
@override final  double planValue;
 final  List<Invoice>? _invoices;
@override List<Invoice>? get invoices {
  final value = _invoices;
  if (value == null) return null;
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerCopyWith<_Customer> get copyWith => __$CustomerCopyWithImpl<_Customer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.totalBilled, totalBilled) || other.totalBilled == totalBilled)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.priceOverride, priceOverride) || other.priceOverride == priceOverride)&&(identical(other.fixedChargeOverride, fixedChargeOverride) || other.fixedChargeOverride == fixedChargeOverride)&&(identical(other.tvaOverride, tvaOverride) || other.tvaOverride == tvaOverride)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&const DeepCollectionEquality().equals(other._invoices, _invoices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,createdAt,updatedAt,companyId,name,totalBilled,totalPaid,totalOutstanding,phone,address,areaName,areaId,customerType,customerRelation,subscriptionDate,priceOverride,fixedChargeOverride,tvaOverride,customerStatus,plan,planValue,const DeepCollectionEquality().hash(_invoices)]);

@override
String toString() {
  return 'Customer(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, companyId: $companyId, name: $name, totalBilled: $totalBilled, totalPaid: $totalPaid, totalOutstanding: $totalOutstanding, phone: $phone, address: $address, areaName: $areaName, areaId: $areaId, customerType: $customerType, customerRelation: $customerRelation, subscriptionDate: $subscriptionDate, priceOverride: $priceOverride, fixedChargeOverride: $fixedChargeOverride, tvaOverride: $tvaOverride, customerStatus: $customerStatus, plan: $plan, planValue: $planValue, invoices: $invoices)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, String companyId, String name, double? totalBilled, double? totalPaid, double? totalOutstanding, String? phone, String? address, String? areaName, String? areaId, CustomerType customerType, CustomerRelation? customerRelation, DateTime subscriptionDate, double? priceOverride, double? fixedChargeOverride, double? tvaOverride, CustomerStatus customerStatus, PlanType plan, double planValue, List<Invoice>? invoices
});




}
/// @nodoc
class __$CustomerCopyWithImpl<$Res>
    implements _$CustomerCopyWith<$Res> {
  __$CustomerCopyWithImpl(this._self, this._then);

  final _Customer _self;
  final $Res Function(_Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? companyId = null,Object? name = null,Object? totalBilled = freezed,Object? totalPaid = freezed,Object? totalOutstanding = freezed,Object? phone = freezed,Object? address = freezed,Object? areaName = freezed,Object? areaId = freezed,Object? customerType = null,Object? customerRelation = freezed,Object? subscriptionDate = null,Object? priceOverride = freezed,Object? fixedChargeOverride = freezed,Object? tvaOverride = freezed,Object? customerStatus = null,Object? plan = null,Object? planValue = null,Object? invoices = freezed,}) {
  return _then(_Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,totalBilled: freezed == totalBilled ? _self.totalBilled : totalBilled // ignore: cast_nullable_to_non_nullable
as double?,totalPaid: freezed == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double?,totalOutstanding: freezed == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as double?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as CustomerType,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,subscriptionDate: null == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime,priceOverride: freezed == priceOverride ? _self.priceOverride : priceOverride // ignore: cast_nullable_to_non_nullable
as double?,fixedChargeOverride: freezed == fixedChargeOverride ? _self.fixedChargeOverride : fixedChargeOverride // ignore: cast_nullable_to_non_nullable
as double?,tvaOverride: freezed == tvaOverride ? _self.tvaOverride : tvaOverride // ignore: cast_nullable_to_non_nullable
as double?,customerStatus: null == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as CustomerStatus,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,invoices: freezed == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>?,
  ));
}


}

// dart format on
