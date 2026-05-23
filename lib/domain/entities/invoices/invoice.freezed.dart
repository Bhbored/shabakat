// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Invoice {

 String get id; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt; bool get isDeleted; String get companyId; String get customerId; DateTime get issueDate; DateTime get dueDate; double get fixedCharge; double get tva; double get totalAmount; double get paidAmount; double get amountDue; InvoiceStatus get invoiceStatus;
/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceCopyWith<Invoice> get copyWith => _$InvoiceCopyWithImpl<Invoice>(this as Invoice, _$identity);

  /// Serializes this Invoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invoice&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,isDeleted,companyId,customerId,issueDate,dueDate,fixedCharge,tva,totalAmount,paidAmount,amountDue,invoiceStatus);

@override
String toString() {
  return 'Invoice(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isDeleted: $isDeleted, companyId: $companyId, customerId: $customerId, issueDate: $issueDate, dueDate: $dueDate, fixedCharge: $fixedCharge, tva: $tva, totalAmount: $totalAmount, paidAmount: $paidAmount, amountDue: $amountDue, invoiceStatus: $invoiceStatus)';
}


}

/// @nodoc
abstract mixin class $InvoiceCopyWith<$Res>  {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) _then) = _$InvoiceCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, bool isDeleted, String companyId, String customerId, DateTime issueDate, DateTime dueDate, double fixedCharge, double tva, double totalAmount, double paidAmount, double amountDue, InvoiceStatus invoiceStatus
});




}
/// @nodoc
class _$InvoiceCopyWithImpl<$Res>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._self, this._then);

  final Invoice _self;
  final $Res Function(Invoice) _then;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? isDeleted = null,Object? companyId = null,Object? customerId = null,Object? issueDate = null,Object? dueDate = null,Object? fixedCharge = null,Object? tva = null,Object? totalAmount = null,Object? paidAmount = null,Object? amountDue = null,Object? invoiceStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as double,invoiceStatus: null == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Invoice].
extension InvoicePatterns on Invoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Invoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Invoice value)  $default,){
final _that = this;
switch (_that) {
case _Invoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Invoice value)?  $default,){
final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String customerId,  DateTime issueDate,  DateTime dueDate,  double fixedCharge,  double tva,  double totalAmount,  double paidAmount,  double amountDue,  InvoiceStatus invoiceStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Invoice() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.customerId,_that.issueDate,_that.dueDate,_that.fixedCharge,_that.tva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.invoiceStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String customerId,  DateTime issueDate,  DateTime dueDate,  double fixedCharge,  double tva,  double totalAmount,  double paidAmount,  double amountDue,  InvoiceStatus invoiceStatus)  $default,) {final _that = this;
switch (_that) {
case _Invoice():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.customerId,_that.issueDate,_that.dueDate,_that.fixedCharge,_that.tva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.invoiceStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String customerId,  DateTime issueDate,  DateTime dueDate,  double fixedCharge,  double tva,  double totalAmount,  double paidAmount,  double amountDue,  InvoiceStatus invoiceStatus)?  $default,) {final _that = this;
switch (_that) {
case _Invoice() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.customerId,_that.issueDate,_that.dueDate,_that.fixedCharge,_that.tva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.invoiceStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Invoice implements Invoice {
  const _Invoice({required this.id, required this.createdAt, required this.updatedAt, this.deletedAt, this.isDeleted = false, required this.companyId, required this.customerId, required this.issueDate, required this.dueDate, required this.fixedCharge, required this.tva, required this.totalAmount, required this.paidAmount, required this.amountDue, this.invoiceStatus = InvoiceStatus.unpaid});
  factory _Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;
@override@JsonKey() final  bool isDeleted;
@override final  String companyId;
@override final  String customerId;
@override final  DateTime issueDate;
@override final  DateTime dueDate;
@override final  double fixedCharge;
@override final  double tva;
@override final  double totalAmount;
@override final  double paidAmount;
@override final  double amountDue;
@override@JsonKey() final  InvoiceStatus invoiceStatus;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceCopyWith<_Invoice> get copyWith => __$InvoiceCopyWithImpl<_Invoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invoice&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,isDeleted,companyId,customerId,issueDate,dueDate,fixedCharge,tva,totalAmount,paidAmount,amountDue,invoiceStatus);

@override
String toString() {
  return 'Invoice(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isDeleted: $isDeleted, companyId: $companyId, customerId: $customerId, issueDate: $issueDate, dueDate: $dueDate, fixedCharge: $fixedCharge, tva: $tva, totalAmount: $totalAmount, paidAmount: $paidAmount, amountDue: $amountDue, invoiceStatus: $invoiceStatus)';
}


}

/// @nodoc
abstract mixin class _$InvoiceCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$InvoiceCopyWith(_Invoice value, $Res Function(_Invoice) _then) = __$InvoiceCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, bool isDeleted, String companyId, String customerId, DateTime issueDate, DateTime dueDate, double fixedCharge, double tva, double totalAmount, double paidAmount, double amountDue, InvoiceStatus invoiceStatus
});




}
/// @nodoc
class __$InvoiceCopyWithImpl<$Res>
    implements _$InvoiceCopyWith<$Res> {
  __$InvoiceCopyWithImpl(this._self, this._then);

  final _Invoice _self;
  final $Res Function(_Invoice) _then;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? isDeleted = null,Object? companyId = null,Object? customerId = null,Object? issueDate = null,Object? dueDate = null,Object? fixedCharge = null,Object? tva = null,Object? totalAmount = null,Object? paidAmount = null,Object? amountDue = null,Object? invoiceStatus = null,}) {
  return _then(_Invoice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tva: null == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as double,invoiceStatus: null == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,
  ));
}


}

// dart format on
