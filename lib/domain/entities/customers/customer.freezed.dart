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

 String get id; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt; bool get isDeleted; String get companyId; String get name; String? get phone; String? get address; String get customerType; DateTime get subscriptionDate; CustomerStatus get customerStatus; PlanType get plan; double get planValue;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,isDeleted,companyId,name,phone,address,customerType,subscriptionDate,customerStatus,plan,planValue);

@override
String toString() {
  return 'Customer(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isDeleted: $isDeleted, companyId: $companyId, name: $name, phone: $phone, address: $address, customerType: $customerType, subscriptionDate: $subscriptionDate, customerStatus: $customerStatus, plan: $plan, planValue: $planValue)';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, bool isDeleted, String companyId, String name, String? phone, String? address, String customerType, DateTime subscriptionDate, CustomerStatus customerStatus, PlanType plan, double planValue
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? isDeleted = null,Object? companyId = null,Object? name = null,Object? phone = freezed,Object? address = freezed,Object? customerType = null,Object? subscriptionDate = null,Object? customerStatus = null,Object? plan = null,Object? planValue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,subscriptionDate: null == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime,customerStatus: null == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as CustomerStatus,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String name,  String? phone,  String? address,  String customerType,  DateTime subscriptionDate,  CustomerStatus customerStatus,  PlanType plan,  double planValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.name,_that.phone,_that.address,_that.customerType,_that.subscriptionDate,_that.customerStatus,_that.plan,_that.planValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String name,  String? phone,  String? address,  String customerType,  DateTime subscriptionDate,  CustomerStatus customerStatus,  PlanType plan,  double planValue)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.name,_that.phone,_that.address,_that.customerType,_that.subscriptionDate,_that.customerStatus,_that.plan,_that.planValue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String name,  String? phone,  String? address,  String customerType,  DateTime subscriptionDate,  CustomerStatus customerStatus,  PlanType plan,  double planValue)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.name,_that.phone,_that.address,_that.customerType,_that.subscriptionDate,_that.customerStatus,_that.plan,_that.planValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer implements Customer {
  const _Customer({required this.id, required this.createdAt, required this.updatedAt, this.deletedAt, this.isDeleted = false, required this.companyId, required this.name, this.phone, this.address, required this.customerType, required this.subscriptionDate, this.customerStatus = CustomerStatus.active, required this.plan, required this.planValue});
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;
@override@JsonKey() final  bool isDeleted;
@override final  String companyId;
@override final  String name;
@override final  String? phone;
@override final  String? address;
@override final  String customerType;
@override final  DateTime subscriptionDate;
@override@JsonKey() final  CustomerStatus customerStatus;
@override final  PlanType plan;
@override final  double planValue;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,isDeleted,companyId,name,phone,address,customerType,subscriptionDate,customerStatus,plan,planValue);

@override
String toString() {
  return 'Customer(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isDeleted: $isDeleted, companyId: $companyId, name: $name, phone: $phone, address: $address, customerType: $customerType, subscriptionDate: $subscriptionDate, customerStatus: $customerStatus, plan: $plan, planValue: $planValue)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, bool isDeleted, String companyId, String name, String? phone, String? address, String customerType, DateTime subscriptionDate, CustomerStatus customerStatus, PlanType plan, double planValue
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? isDeleted = null,Object? companyId = null,Object? name = null,Object? phone = freezed,Object? address = freezed,Object? customerType = null,Object? subscriptionDate = null,Object? customerStatus = null,Object? plan = null,Object? planValue = null,}) {
  return _then(_Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,subscriptionDate: null == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime,customerStatus: null == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as CustomerStatus,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as PlanType,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
