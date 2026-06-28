// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceSummaryResponse {

 String get id; int get invoiceNumber; String get customerName; String get invoiceStatus;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get issueDate;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get dueDate; double get totalAmount; double get paidAmount; double get amountDue; double? get billedConsumption; DateTime get createdAt;
/// Create a copy of InvoiceSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceSummaryResponseCopyWith<InvoiceSummaryResponse> get copyWith => _$InvoiceSummaryResponseCopyWithImpl<InvoiceSummaryResponse>(this as InvoiceSummaryResponse, _$identity);

  /// Serializes this InvoiceSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceSummaryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.billedConsumption, billedConsumption) || other.billedConsumption == billedConsumption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerName,invoiceStatus,issueDate,dueDate,totalAmount,paidAmount,amountDue,billedConsumption,createdAt);

@override
String toString() {
  return 'InvoiceSummaryResponse(id: $id, invoiceNumber: $invoiceNumber, customerName: $customerName, invoiceStatus: $invoiceStatus, issueDate: $issueDate, dueDate: $dueDate, totalAmount: $totalAmount, paidAmount: $paidAmount, amountDue: $amountDue, billedConsumption: $billedConsumption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $InvoiceSummaryResponseCopyWith<$Res>  {
  factory $InvoiceSummaryResponseCopyWith(InvoiceSummaryResponse value, $Res Function(InvoiceSummaryResponse) _then) = _$InvoiceSummaryResponseCopyWithImpl;
@useResult
$Res call({
 String id, int invoiceNumber, String customerName, String invoiceStatus,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime issueDate,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime dueDate, double totalAmount, double paidAmount, double amountDue, double? billedConsumption, DateTime createdAt
});




}
/// @nodoc
class _$InvoiceSummaryResponseCopyWithImpl<$Res>
    implements $InvoiceSummaryResponseCopyWith<$Res> {
  _$InvoiceSummaryResponseCopyWithImpl(this._self, this._then);

  final InvoiceSummaryResponse _self;
  final $Res Function(InvoiceSummaryResponse) _then;

/// Create a copy of InvoiceSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerName = null,Object? invoiceStatus = null,Object? issueDate = null,Object? dueDate = null,Object? totalAmount = null,Object? paidAmount = null,Object? amountDue = null,Object? billedConsumption = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,invoiceStatus: null == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as double,billedConsumption: freezed == billedConsumption ? _self.billedConsumption : billedConsumption // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceSummaryResponse].
extension InvoiceSummaryResponsePatterns on InvoiceSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int invoiceNumber,  String customerName,  String invoiceStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime issueDate, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate,  double totalAmount,  double paidAmount,  double amountDue,  double? billedConsumption,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceSummaryResponse() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.invoiceStatus,_that.issueDate,_that.dueDate,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.billedConsumption,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int invoiceNumber,  String customerName,  String invoiceStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime issueDate, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate,  double totalAmount,  double paidAmount,  double amountDue,  double? billedConsumption,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _InvoiceSummaryResponse():
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.invoiceStatus,_that.issueDate,_that.dueDate,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.billedConsumption,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int invoiceNumber,  String customerName,  String invoiceStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime issueDate, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate,  double totalAmount,  double paidAmount,  double amountDue,  double? billedConsumption,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceSummaryResponse() when $default != null:
return $default(_that.id,_that.invoiceNumber,_that.customerName,_that.invoiceStatus,_that.issueDate,_that.dueDate,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.billedConsumption,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceSummaryResponse implements InvoiceSummaryResponse {
  const _InvoiceSummaryResponse({required this.id, required this.invoiceNumber, required this.customerName, required this.invoiceStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.issueDate, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.dueDate, required this.totalAmount, required this.paidAmount, required this.amountDue, this.billedConsumption, required this.createdAt});
  factory _InvoiceSummaryResponse.fromJson(Map<String, dynamic> json) => _$InvoiceSummaryResponseFromJson(json);

@override final  String id;
@override final  int invoiceNumber;
@override final  String customerName;
@override final  String invoiceStatus;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime issueDate;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime dueDate;
@override final  double totalAmount;
@override final  double paidAmount;
@override final  double amountDue;
@override final  double? billedConsumption;
@override final  DateTime createdAt;

/// Create a copy of InvoiceSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceSummaryResponseCopyWith<_InvoiceSummaryResponse> get copyWith => __$InvoiceSummaryResponseCopyWithImpl<_InvoiceSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceSummaryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.billedConsumption, billedConsumption) || other.billedConsumption == billedConsumption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceNumber,customerName,invoiceStatus,issueDate,dueDate,totalAmount,paidAmount,amountDue,billedConsumption,createdAt);

@override
String toString() {
  return 'InvoiceSummaryResponse(id: $id, invoiceNumber: $invoiceNumber, customerName: $customerName, invoiceStatus: $invoiceStatus, issueDate: $issueDate, dueDate: $dueDate, totalAmount: $totalAmount, paidAmount: $paidAmount, amountDue: $amountDue, billedConsumption: $billedConsumption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$InvoiceSummaryResponseCopyWith<$Res> implements $InvoiceSummaryResponseCopyWith<$Res> {
  factory _$InvoiceSummaryResponseCopyWith(_InvoiceSummaryResponse value, $Res Function(_InvoiceSummaryResponse) _then) = __$InvoiceSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, int invoiceNumber, String customerName, String invoiceStatus,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime issueDate,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime dueDate, double totalAmount, double paidAmount, double amountDue, double? billedConsumption, DateTime createdAt
});




}
/// @nodoc
class __$InvoiceSummaryResponseCopyWithImpl<$Res>
    implements _$InvoiceSummaryResponseCopyWith<$Res> {
  __$InvoiceSummaryResponseCopyWithImpl(this._self, this._then);

  final _InvoiceSummaryResponse _self;
  final $Res Function(_InvoiceSummaryResponse) _then;

/// Create a copy of InvoiceSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceNumber = null,Object? customerName = null,Object? invoiceStatus = null,Object? issueDate = null,Object? dueDate = null,Object? totalAmount = null,Object? paidAmount = null,Object? amountDue = null,Object? billedConsumption = freezed,Object? createdAt = null,}) {
  return _then(_InvoiceSummaryResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,invoiceStatus: null == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as double,billedConsumption: freezed == billedConsumption ? _self.billedConsumption : billedConsumption // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
