// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerFilterRequest {

 String? get name; String? get phone; String? get areaId; String? get boxId; String? get ampereScheduleId; PlanType? get planType; CustomerRelation? get customerRelation; CustomerStatus? get customerStatus; String? get paymentFilter; int get pageNumber; int get pageSize;
/// Create a copy of CustomerFilterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerFilterRequestCopyWith<CustomerFilterRequest> get copyWith => _$CustomerFilterRequestCopyWithImpl<CustomerFilterRequest>(this as CustomerFilterRequest, _$identity);

  /// Serializes this CustomerFilterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerFilterRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.boxId, boxId) || other.boxId == boxId)&&(identical(other.ampereScheduleId, ampereScheduleId) || other.ampereScheduleId == ampereScheduleId)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.paymentFilter, paymentFilter) || other.paymentFilter == paymentFilter)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,areaId,boxId,ampereScheduleId,planType,customerRelation,customerStatus,paymentFilter,pageNumber,pageSize);

@override
String toString() {
  return 'CustomerFilterRequest(name: $name, phone: $phone, areaId: $areaId, boxId: $boxId, ampereScheduleId: $ampereScheduleId, planType: $planType, customerRelation: $customerRelation, customerStatus: $customerStatus, paymentFilter: $paymentFilter, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $CustomerFilterRequestCopyWith<$Res>  {
  factory $CustomerFilterRequestCopyWith(CustomerFilterRequest value, $Res Function(CustomerFilterRequest) _then) = _$CustomerFilterRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? phone, String? areaId, String? boxId, String? ampereScheduleId, PlanType? planType, CustomerRelation? customerRelation, CustomerStatus? customerStatus, String? paymentFilter, int pageNumber, int pageSize
});




}
/// @nodoc
class _$CustomerFilterRequestCopyWithImpl<$Res>
    implements $CustomerFilterRequestCopyWith<$Res> {
  _$CustomerFilterRequestCopyWithImpl(this._self, this._then);

  final CustomerFilterRequest _self;
  final $Res Function(CustomerFilterRequest) _then;

/// Create a copy of CustomerFilterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? phone = freezed,Object? areaId = freezed,Object? boxId = freezed,Object? ampereScheduleId = freezed,Object? planType = freezed,Object? customerRelation = freezed,Object? customerStatus = freezed,Object? paymentFilter = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,boxId: freezed == boxId ? _self.boxId : boxId // ignore: cast_nullable_to_non_nullable
as String?,ampereScheduleId: freezed == ampereScheduleId ? _self.ampereScheduleId : ampereScheduleId // ignore: cast_nullable_to_non_nullable
as String?,planType: freezed == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as PlanType?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,customerStatus: freezed == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as CustomerStatus?,paymentFilter: freezed == paymentFilter ? _self.paymentFilter : paymentFilter // ignore: cast_nullable_to_non_nullable
as String?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerFilterRequest].
extension CustomerFilterRequestPatterns on CustomerFilterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerFilterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerFilterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerFilterRequest value)  $default,){
final _that = this;
switch (_that) {
case _CustomerFilterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerFilterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerFilterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? phone,  String? areaId,  String? boxId,  String? ampereScheduleId,  PlanType? planType,  CustomerRelation? customerRelation,  CustomerStatus? customerStatus,  String? paymentFilter,  int pageNumber,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerFilterRequest() when $default != null:
return $default(_that.name,_that.phone,_that.areaId,_that.boxId,_that.ampereScheduleId,_that.planType,_that.customerRelation,_that.customerStatus,_that.paymentFilter,_that.pageNumber,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? phone,  String? areaId,  String? boxId,  String? ampereScheduleId,  PlanType? planType,  CustomerRelation? customerRelation,  CustomerStatus? customerStatus,  String? paymentFilter,  int pageNumber,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _CustomerFilterRequest():
return $default(_that.name,_that.phone,_that.areaId,_that.boxId,_that.ampereScheduleId,_that.planType,_that.customerRelation,_that.customerStatus,_that.paymentFilter,_that.pageNumber,_that.pageSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? phone,  String? areaId,  String? boxId,  String? ampereScheduleId,  PlanType? planType,  CustomerRelation? customerRelation,  CustomerStatus? customerStatus,  String? paymentFilter,  int pageNumber,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _CustomerFilterRequest() when $default != null:
return $default(_that.name,_that.phone,_that.areaId,_that.boxId,_that.ampereScheduleId,_that.planType,_that.customerRelation,_that.customerStatus,_that.paymentFilter,_that.pageNumber,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerFilterRequest implements CustomerFilterRequest {
  const _CustomerFilterRequest({this.name, this.phone, this.areaId, this.boxId, this.ampereScheduleId, this.planType, this.customerRelation, this.customerStatus, this.paymentFilter, this.pageNumber = 1, this.pageSize = 10});
  factory _CustomerFilterRequest.fromJson(Map<String, dynamic> json) => _$CustomerFilterRequestFromJson(json);

@override final  String? name;
@override final  String? phone;
@override final  String? areaId;
@override final  String? boxId;
@override final  String? ampereScheduleId;
@override final  PlanType? planType;
@override final  CustomerRelation? customerRelation;
@override final  CustomerStatus? customerStatus;
@override final  String? paymentFilter;
@override@JsonKey() final  int pageNumber;
@override@JsonKey() final  int pageSize;

/// Create a copy of CustomerFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerFilterRequestCopyWith<_CustomerFilterRequest> get copyWith => __$CustomerFilterRequestCopyWithImpl<_CustomerFilterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerFilterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerFilterRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.boxId, boxId) || other.boxId == boxId)&&(identical(other.ampereScheduleId, ampereScheduleId) || other.ampereScheduleId == ampereScheduleId)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.customerRelation, customerRelation) || other.customerRelation == customerRelation)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.paymentFilter, paymentFilter) || other.paymentFilter == paymentFilter)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,areaId,boxId,ampereScheduleId,planType,customerRelation,customerStatus,paymentFilter,pageNumber,pageSize);

@override
String toString() {
  return 'CustomerFilterRequest(name: $name, phone: $phone, areaId: $areaId, boxId: $boxId, ampereScheduleId: $ampereScheduleId, planType: $planType, customerRelation: $customerRelation, customerStatus: $customerStatus, paymentFilter: $paymentFilter, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$CustomerFilterRequestCopyWith<$Res> implements $CustomerFilterRequestCopyWith<$Res> {
  factory _$CustomerFilterRequestCopyWith(_CustomerFilterRequest value, $Res Function(_CustomerFilterRequest) _then) = __$CustomerFilterRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? phone, String? areaId, String? boxId, String? ampereScheduleId, PlanType? planType, CustomerRelation? customerRelation, CustomerStatus? customerStatus, String? paymentFilter, int pageNumber, int pageSize
});




}
/// @nodoc
class __$CustomerFilterRequestCopyWithImpl<$Res>
    implements _$CustomerFilterRequestCopyWith<$Res> {
  __$CustomerFilterRequestCopyWithImpl(this._self, this._then);

  final _CustomerFilterRequest _self;
  final $Res Function(_CustomerFilterRequest) _then;

/// Create a copy of CustomerFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? phone = freezed,Object? areaId = freezed,Object? boxId = freezed,Object? ampereScheduleId = freezed,Object? planType = freezed,Object? customerRelation = freezed,Object? customerStatus = freezed,Object? paymentFilter = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_CustomerFilterRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,boxId: freezed == boxId ? _self.boxId : boxId // ignore: cast_nullable_to_non_nullable
as String?,ampereScheduleId: freezed == ampereScheduleId ? _self.ampereScheduleId : ampereScheduleId // ignore: cast_nullable_to_non_nullable
as String?,planType: freezed == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as PlanType?,customerRelation: freezed == customerRelation ? _self.customerRelation : customerRelation // ignore: cast_nullable_to_non_nullable
as CustomerRelation?,customerStatus: freezed == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as CustomerStatus?,paymentFilter: freezed == paymentFilter ? _self.paymentFilter : paymentFilter // ignore: cast_nullable_to_non_nullable
as String?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
