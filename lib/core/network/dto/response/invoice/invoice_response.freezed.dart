// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceResponse {

 String get id; int get invoiceNumber; String get customerName;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get issueDate;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get dueDate; double get fixedCharge; double get tva; double get totalAmount; double get paidAmount; double get amountDue; double? get billedConsumption; String get invoiceStatus; DateTime get createdAt; DateTime get updatedAt; List<PaymentResponse> get payments;
/// Create a copy of InvoiceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceResponseCopyWith<InvoiceResponse> get copyWith => _$InvoiceResponseCopyWithImpl<InvoiceResponse>(this as InvoiceResponse, _$identity);

  /// Serializes this InvoiceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.billedConsumption, billedConsumption) || other.billedConsumption == billedConsumption)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.payments, payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerName,issueDate,dueDate,fixedCharge,tva,totalAmount,paidAmount,amountDue,billedConsumption,invoiceStatus,createdAt,updatedAt,const DeepCollectionEquality().hash(payments));

@override
String toString() {
  return 'InvoiceResponse(id: $id, invoiceNumber: $invoiceNumber, customerName: $customerName, issueDate: $issueDate, dueDate: $dueDate, fixedCharge: $fixedCharge, tva: $tva, totalAmount: $totalAmount, paidAmount: $paidAmount, amountDue: $amountDue, billedConsumption: $billedConsumption, invoiceStatus: $invoiceStatus, createdAt: $createdAt, updatedAt: $updatedAt, payments: $payments)';
}


}

/// @nodoc
abstract mixin class $InvoiceResponseCopyWith<$Res>  {
  factory $InvoiceResponseCopyWith(InvoiceResponse value, $Res Function(InvoiceResponse) _then) = _$InvoiceResponseCopyWithImpl;
@useResult
$Res call({
 String id, int invoiceNumber, String customerName,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime issueDate,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime dueDate, double fixedCharge, double tva, double totalAmount, double paidAmount, double amountDue, double? billedConsumption, String invoiceStatus, DateTime createdAt, DateTime updatedAt, List<PaymentResponse> payments
});




}
/// @nodoc
class _$InvoiceResponseCopyWithImpl<$Res>
    implements $InvoiceResponseCopyWith<$Res> {
  _$InvoiceResponseCopyWithImpl(this._self, this._then);

  final InvoiceResponse _self;
  final $Res Function(InvoiceResponse) _then;

/// Create a copy of InvoiceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerName = null,Object? issueDate = null,Object? dueDate = null,Object? fixedCharge = null,Object? tva = null,Object? totalAmount = null,Object? paidAmount = null,Object? amountDue = null,Object? billedConsumption = freezed,Object? invoiceStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? payments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as double,billedConsumption: freezed == billedConsumption ? _self.billedConsumption : billedConsumption // ignore: cast_nullable_to_non_nullable
as double?,invoiceStatus: null == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceResponse].
extension InvoiceResponsePatterns on InvoiceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceResponse value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int invoiceNumber,  String customerName, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime issueDate, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate,  double fixedCharge,  double tva,  double totalAmount,  double paidAmount,  double amountDue,  double? billedConsumption,  String invoiceStatus,  DateTime createdAt,  DateTime updatedAt,  List<PaymentResponse> payments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceResponse() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.issueDate,_that.dueDate,_that.fixedCharge,_that.tva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.billedConsumption,_that.invoiceStatus,_that.createdAt,_that.updatedAt,_that.payments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int invoiceNumber,  String customerName, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime issueDate, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate,  double fixedCharge,  double tva,  double totalAmount,  double paidAmount,  double amountDue,  double? billedConsumption,  String invoiceStatus,  DateTime createdAt,  DateTime updatedAt,  List<PaymentResponse> payments)  $default,) {final _that = this;
switch (_that) {
case _InvoiceResponse():
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.issueDate,_that.dueDate,_that.fixedCharge,_that.tva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.billedConsumption,_that.invoiceStatus,_that.createdAt,_that.updatedAt,_that.payments);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int invoiceNumber,  String customerName, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime issueDate, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate,  double fixedCharge,  double tva,  double totalAmount,  double paidAmount,  double amountDue,  double? billedConsumption,  String invoiceStatus,  DateTime createdAt,  DateTime updatedAt,  List<PaymentResponse> payments)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceResponse() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.issueDate,_that.dueDate,_that.fixedCharge,_that.tva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.billedConsumption,_that.invoiceStatus,_that.createdAt,_that.updatedAt,_that.payments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceResponse implements InvoiceResponse {
  const _InvoiceResponse({required this.id, required this.invoiceNumber, required this.customerName, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.issueDate, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.dueDate, required this.fixedCharge, required this.tva, required this.totalAmount, required this.paidAmount, required this.amountDue, this.billedConsumption, required this.invoiceStatus, required this.createdAt, required this.updatedAt, required final  List<PaymentResponse> payments}): _payments = payments;
  factory _InvoiceResponse.fromJson(Map<String, dynamic> json) => _$InvoiceResponseFromJson(json);

@override final  String id;
@override final  int invoiceNumber;
@override final  String customerName;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime issueDate;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime dueDate;
@override final  double fixedCharge;
@override final  double tva;
@override final  double totalAmount;
@override final  double paidAmount;
@override final  double amountDue;
@override final  double? billedConsumption;
@override final  String invoiceStatus;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<PaymentResponse> _payments;
@override List<PaymentResponse> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}


/// Create a copy of InvoiceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceResponseCopyWith<_InvoiceResponse> get copyWith => __$InvoiceResponseCopyWithImpl<_InvoiceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.billedConsumption, billedConsumption) || other.billedConsumption == billedConsumption)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._payments, _payments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerName,issueDate,dueDate,fixedCharge,tva,totalAmount,paidAmount,amountDue,billedConsumption,invoiceStatus,createdAt,updatedAt,const DeepCollectionEquality().hash(_payments));

@override
String toString() {
  return 'InvoiceResponse(id: $id, invoiceNumber: $invoiceNumber, customerName: $customerName, issueDate: $issueDate, dueDate: $dueDate, fixedCharge: $fixedCharge, tva: $tva, totalAmount: $totalAmount, paidAmount: $paidAmount, amountDue: $amountDue, billedConsumption: $billedConsumption, invoiceStatus: $invoiceStatus, createdAt: $createdAt, updatedAt: $updatedAt, payments: $payments)';
}


}

/// @nodoc
abstract mixin class _$InvoiceResponseCopyWith<$Res> implements $InvoiceResponseCopyWith<$Res> {
  factory _$InvoiceResponseCopyWith(_InvoiceResponse value, $Res Function(_InvoiceResponse) _then) = __$InvoiceResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, int invoiceNumber, String customerName,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime issueDate,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime dueDate, double fixedCharge, double tva, double totalAmount, double paidAmount, double amountDue, double? billedConsumption, String invoiceStatus, DateTime createdAt, DateTime updatedAt, List<PaymentResponse> payments
});




}
/// @nodoc
class __$InvoiceResponseCopyWithImpl<$Res>
    implements _$InvoiceResponseCopyWith<$Res> {
  __$InvoiceResponseCopyWithImpl(this._self, this._then);

  final _InvoiceResponse _self;
  final $Res Function(_InvoiceResponse) _then;

/// Create a copy of InvoiceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerName = null,Object? issueDate = null,Object? dueDate = null,Object? fixedCharge = null,Object? tva = null,Object? totalAmount = null,Object? paidAmount = null,Object? amountDue = null,Object? billedConsumption = freezed,Object? invoiceStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? payments = null,}) {
  return _then(_InvoiceResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as double,billedConsumption: freezed == billedConsumption ? _self.billedConsumption : billedConsumption // ignore: cast_nullable_to_non_nullable
as double?,invoiceStatus: null == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentResponse>,
  ));
}


}

// dart format on
