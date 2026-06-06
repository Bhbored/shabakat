// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_with_invoices_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerWithInvoicesResponse {

 String get id; String get name; String? get phone; String? get address; String get customerType; String get plan; double get planValue; String get customerStatus;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get subscriptionDate; double get totalBilled; double get totalPaid; double get totalOutstanding; bool get paidThisMonth; List<InvoiceResponse> get invoices;
/// Create a copy of CustomerWithInvoicesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerWithInvoicesResponseCopyWith<CustomerWithInvoicesResponse> get copyWith => _$CustomerWithInvoicesResponseCopyWithImpl<CustomerWithInvoicesResponse>(this as CustomerWithInvoicesResponse, _$identity);

  /// Serializes this CustomerWithInvoicesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerWithInvoicesResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.totalBilled, totalBilled) || other.totalBilled == totalBilled)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.paidThisMonth, paidThisMonth) || other.paidThisMonth == paidThisMonth)&&const DeepCollectionEquality().equals(other.invoices, invoices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,customerType,plan,planValue,customerStatus,subscriptionDate,totalBilled,totalPaid,totalOutstanding,paidThisMonth,const DeepCollectionEquality().hash(invoices));

@override
String toString() {
  return 'CustomerWithInvoicesResponse(id: $id, name: $name, phone: $phone, address: $address, customerType: $customerType, plan: $plan, planValue: $planValue, customerStatus: $customerStatus, subscriptionDate: $subscriptionDate, totalBilled: $totalBilled, totalPaid: $totalPaid, totalOutstanding: $totalOutstanding, paidThisMonth: $paidThisMonth, invoices: $invoices)';
}


}

/// @nodoc
abstract mixin class $CustomerWithInvoicesResponseCopyWith<$Res>  {
  factory $CustomerWithInvoicesResponseCopyWith(CustomerWithInvoicesResponse value, $Res Function(CustomerWithInvoicesResponse) _then) = _$CustomerWithInvoicesResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? phone, String? address, String customerType, String plan, double planValue, String customerStatus,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime subscriptionDate, double totalBilled, double totalPaid, double totalOutstanding, bool paidThisMonth, List<InvoiceResponse> invoices
});




}
/// @nodoc
class _$CustomerWithInvoicesResponseCopyWithImpl<$Res>
    implements $CustomerWithInvoicesResponseCopyWith<$Res> {
  _$CustomerWithInvoicesResponseCopyWithImpl(this._self, this._then);

  final CustomerWithInvoicesResponse _self;
  final $Res Function(CustomerWithInvoicesResponse) _then;

/// Create a copy of CustomerWithInvoicesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? address = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? customerStatus = null,Object? subscriptionDate = null,Object? totalBilled = null,Object? totalPaid = null,Object? totalOutstanding = null,Object? paidThisMonth = null,Object? invoices = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,customerStatus: null == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionDate: null == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalBilled: null == totalBilled ? _self.totalBilled : totalBilled // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as double,paidThisMonth: null == paidThisMonth ? _self.paidThisMonth : paidThisMonth // ignore: cast_nullable_to_non_nullable
as bool,invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerWithInvoicesResponse].
extension CustomerWithInvoicesResponsePatterns on CustomerWithInvoicesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerWithInvoicesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerWithInvoicesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerWithInvoicesResponse value)  $default,){
final _that = this;
switch (_that) {
case _CustomerWithInvoicesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerWithInvoicesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerWithInvoicesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? phone,  String? address,  String customerType,  String plan,  double planValue,  String customerStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime subscriptionDate,  double totalBilled,  double totalPaid,  double totalOutstanding,  bool paidThisMonth,  List<InvoiceResponse> invoices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerWithInvoicesResponse() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.subscriptionDate,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.paidThisMonth,_that.invoices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? phone,  String? address,  String customerType,  String plan,  double planValue,  String customerStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime subscriptionDate,  double totalBilled,  double totalPaid,  double totalOutstanding,  bool paidThisMonth,  List<InvoiceResponse> invoices)  $default,) {final _that = this;
switch (_that) {
case _CustomerWithInvoicesResponse():
return $default(_that.id,_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.subscriptionDate,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.paidThisMonth,_that.invoices);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? phone,  String? address,  String customerType,  String plan,  double planValue,  String customerStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime subscriptionDate,  double totalBilled,  double totalPaid,  double totalOutstanding,  bool paidThisMonth,  List<InvoiceResponse> invoices)?  $default,) {final _that = this;
switch (_that) {
case _CustomerWithInvoicesResponse() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.address,_that.customerType,_that.plan,_that.planValue,_that.customerStatus,_that.subscriptionDate,_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.paidThisMonth,_that.invoices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerWithInvoicesResponse implements CustomerWithInvoicesResponse {
  const _CustomerWithInvoicesResponse({required this.id, required this.name, this.phone, this.address, required this.customerType, required this.plan, required this.planValue, required this.customerStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.subscriptionDate, required this.totalBilled, required this.totalPaid, required this.totalOutstanding, required this.paidThisMonth, required final  List<InvoiceResponse> invoices}): _invoices = invoices;
  factory _CustomerWithInvoicesResponse.fromJson(Map<String, dynamic> json) => _$CustomerWithInvoicesResponseFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? phone;
@override final  String? address;
@override final  String customerType;
@override final  String plan;
@override final  double planValue;
@override final  String customerStatus;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime subscriptionDate;
@override final  double totalBilled;
@override final  double totalPaid;
@override final  double totalOutstanding;
@override final  bool paidThisMonth;
 final  List<InvoiceResponse> _invoices;
@override List<InvoiceResponse> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}


/// Create a copy of CustomerWithInvoicesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerWithInvoicesResponseCopyWith<_CustomerWithInvoicesResponse> get copyWith => __$CustomerWithInvoicesResponseCopyWithImpl<_CustomerWithInvoicesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerWithInvoicesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerWithInvoicesResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.customerType, customerType) || other.customerType == customerType)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.customerStatus, customerStatus) || other.customerStatus == customerStatus)&&(identical(other.subscriptionDate, subscriptionDate) || other.subscriptionDate == subscriptionDate)&&(identical(other.totalBilled, totalBilled) || other.totalBilled == totalBilled)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.paidThisMonth, paidThisMonth) || other.paidThisMonth == paidThisMonth)&&const DeepCollectionEquality().equals(other._invoices, _invoices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,address,customerType,plan,planValue,customerStatus,subscriptionDate,totalBilled,totalPaid,totalOutstanding,paidThisMonth,const DeepCollectionEquality().hash(_invoices));

@override
String toString() {
  return 'CustomerWithInvoicesResponse(id: $id, name: $name, phone: $phone, address: $address, customerType: $customerType, plan: $plan, planValue: $planValue, customerStatus: $customerStatus, subscriptionDate: $subscriptionDate, totalBilled: $totalBilled, totalPaid: $totalPaid, totalOutstanding: $totalOutstanding, paidThisMonth: $paidThisMonth, invoices: $invoices)';
}


}

/// @nodoc
abstract mixin class _$CustomerWithInvoicesResponseCopyWith<$Res> implements $CustomerWithInvoicesResponseCopyWith<$Res> {
  factory _$CustomerWithInvoicesResponseCopyWith(_CustomerWithInvoicesResponse value, $Res Function(_CustomerWithInvoicesResponse) _then) = __$CustomerWithInvoicesResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? phone, String? address, String customerType, String plan, double planValue, String customerStatus,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime subscriptionDate, double totalBilled, double totalPaid, double totalOutstanding, bool paidThisMonth, List<InvoiceResponse> invoices
});




}
/// @nodoc
class __$CustomerWithInvoicesResponseCopyWithImpl<$Res>
    implements _$CustomerWithInvoicesResponseCopyWith<$Res> {
  __$CustomerWithInvoicesResponseCopyWithImpl(this._self, this._then);

  final _CustomerWithInvoicesResponse _self;
  final $Res Function(_CustomerWithInvoicesResponse) _then;

/// Create a copy of CustomerWithInvoicesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? address = freezed,Object? customerType = null,Object? plan = null,Object? planValue = null,Object? customerStatus = null,Object? subscriptionDate = null,Object? totalBilled = null,Object? totalPaid = null,Object? totalOutstanding = null,Object? paidThisMonth = null,Object? invoices = null,}) {
  return _then(_CustomerWithInvoicesResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,customerType: null == customerType ? _self.customerType : customerType // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,customerStatus: null == customerStatus ? _self.customerStatus : customerStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionDate: null == subscriptionDate ? _self.subscriptionDate : subscriptionDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalBilled: null == totalBilled ? _self.totalBilled : totalBilled // ignore: cast_nullable_to_non_nullable
as double,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as double,totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as double,paidThisMonth: null == paidThisMonth ? _self.paidThisMonth : paidThisMonth // ignore: cast_nullable_to_non_nullable
as bool,invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceResponse>,
  ));
}


}

// dart format on
