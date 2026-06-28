// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_print_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoicePrintResponse {

 String get companyName; String? get logoUrl; int get invoiceNumber; String get customerName; String? get customerPhone; String? get customerAddress; String get planType; double get planValue; double get unitPrice; double get fixedCharge; double get tvaPercent; double get tvaAmount; bool get showTva; double? get previousReading; String? get previousReadingDate; double? get currentReading; String? get currentReadingDate; double? get totalConsumption; double get consumptionCost; double get subtotalBeforeTva; double get totalAmount; double get paidAmount; double get amountDue; String get invoiceStatus; String get issueDate; String get dueDate; bool get isKilowattPlan; bool get isFixedKilowattPlan;
/// Create a copy of InvoicePrintResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoicePrintResponseCopyWith<InvoicePrintResponse> get copyWith => _$InvoicePrintResponseCopyWithImpl<InvoicePrintResponse>(this as InvoicePrintResponse, _$identity);

  /// Serializes this InvoicePrintResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoicePrintResponse&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.customerAddress, customerAddress) || other.customerAddress == customerAddress)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tvaPercent, tvaPercent) || other.tvaPercent == tvaPercent)&&(identical(other.tvaAmount, tvaAmount) || other.tvaAmount == tvaAmount)&&(identical(other.showTva, showTva) || other.showTva == showTva)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.previousReadingDate, previousReadingDate) || other.previousReadingDate == previousReadingDate)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.currentReadingDate, currentReadingDate) || other.currentReadingDate == currentReadingDate)&&(identical(other.totalConsumption, totalConsumption) || other.totalConsumption == totalConsumption)&&(identical(other.consumptionCost, consumptionCost) || other.consumptionCost == consumptionCost)&&(identical(other.subtotalBeforeTva, subtotalBeforeTva) || other.subtotalBeforeTva == subtotalBeforeTva)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isKilowattPlan, isKilowattPlan) || other.isKilowattPlan == isKilowattPlan)&&(identical(other.isFixedKilowattPlan, isFixedKilowattPlan) || other.isFixedKilowattPlan == isFixedKilowattPlan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,companyName,logoUrl,invoiceNumber,customerName,customerPhone,customerAddress,planType,planValue,unitPrice,fixedCharge,tvaPercent,tvaAmount,showTva,previousReading,previousReadingDate,currentReading,currentReadingDate,totalConsumption,consumptionCost,subtotalBeforeTva,totalAmount,paidAmount,amountDue,invoiceStatus,issueDate,dueDate,isKilowattPlan,isFixedKilowattPlan]);

@override
String toString() {
  return 'InvoicePrintResponse(companyName: $companyName, logoUrl: $logoUrl, invoiceNumber: $invoiceNumber, customerName: $customerName, customerPhone: $customerPhone, customerAddress: $customerAddress, planType: $planType, planValue: $planValue, unitPrice: $unitPrice, fixedCharge: $fixedCharge, tvaPercent: $tvaPercent, tvaAmount: $tvaAmount, showTva: $showTva, previousReading: $previousReading, previousReadingDate: $previousReadingDate, currentReading: $currentReading, currentReadingDate: $currentReadingDate, totalConsumption: $totalConsumption, consumptionCost: $consumptionCost, subtotalBeforeTva: $subtotalBeforeTva, totalAmount: $totalAmount, paidAmount: $paidAmount, amountDue: $amountDue, invoiceStatus: $invoiceStatus, issueDate: $issueDate, dueDate: $dueDate, isKilowattPlan: $isKilowattPlan, isFixedKilowattPlan: $isFixedKilowattPlan)';
}


}

/// @nodoc
abstract mixin class $InvoicePrintResponseCopyWith<$Res>  {
  factory $InvoicePrintResponseCopyWith(InvoicePrintResponse value, $Res Function(InvoicePrintResponse) _then) = _$InvoicePrintResponseCopyWithImpl;
@useResult
$Res call({
 String companyName, String? logoUrl, int invoiceNumber, String customerName, String? customerPhone, String? customerAddress, String planType, double planValue, double unitPrice, double fixedCharge, double tvaPercent, double tvaAmount, bool showTva, double? previousReading, String? previousReadingDate, double? currentReading, String? currentReadingDate, double? totalConsumption, double consumptionCost, double subtotalBeforeTva, double totalAmount, double paidAmount, double amountDue, String invoiceStatus, String issueDate, String dueDate, bool isKilowattPlan, bool isFixedKilowattPlan
});




}
/// @nodoc
class _$InvoicePrintResponseCopyWithImpl<$Res>
    implements $InvoicePrintResponseCopyWith<$Res> {
  _$InvoicePrintResponseCopyWithImpl(this._self, this._then);

  final InvoicePrintResponse _self;
  final $Res Function(InvoicePrintResponse) _then;

/// Create a copy of InvoicePrintResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = null,Object? logoUrl = freezed,Object? invoiceNumber = null,Object? customerName = null,Object? customerPhone = freezed,Object? customerAddress = freezed,Object? planType = null,Object? planValue = null,Object? unitPrice = null,Object? fixedCharge = null,Object? tvaPercent = null,Object? tvaAmount = null,Object? showTva = null,Object? previousReading = freezed,Object? previousReadingDate = freezed,Object? currentReading = freezed,Object? currentReadingDate = freezed,Object? totalConsumption = freezed,Object? consumptionCost = null,Object? subtotalBeforeTva = null,Object? totalAmount = null,Object? paidAmount = null,Object? amountDue = null,Object? invoiceStatus = null,Object? issueDate = null,Object? dueDate = null,Object? isKilowattPlan = null,Object? isFixedKilowattPlan = null,}) {
  return _then(_self.copyWith(
companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,customerAddress: freezed == customerAddress ? _self.customerAddress : customerAddress // ignore: cast_nullable_to_non_nullable
as String?,planType: null == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as String,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tvaPercent: null == tvaPercent ? _self.tvaPercent : tvaPercent // ignore: cast_nullable_to_non_nullable
as double,tvaAmount: null == tvaAmount ? _self.tvaAmount : tvaAmount // ignore: cast_nullable_to_non_nullable
as double,showTva: null == showTva ? _self.showTva : showTva // ignore: cast_nullable_to_non_nullable
as bool,previousReading: freezed == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double?,previousReadingDate: freezed == previousReadingDate ? _self.previousReadingDate : previousReadingDate // ignore: cast_nullable_to_non_nullable
as String?,currentReading: freezed == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double?,currentReadingDate: freezed == currentReadingDate ? _self.currentReadingDate : currentReadingDate // ignore: cast_nullable_to_non_nullable
as String?,totalConsumption: freezed == totalConsumption ? _self.totalConsumption : totalConsumption // ignore: cast_nullable_to_non_nullable
as double?,consumptionCost: null == consumptionCost ? _self.consumptionCost : consumptionCost // ignore: cast_nullable_to_non_nullable
as double,subtotalBeforeTva: null == subtotalBeforeTva ? _self.subtotalBeforeTva : subtotalBeforeTva // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as double,invoiceStatus: null == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,isKilowattPlan: null == isKilowattPlan ? _self.isKilowattPlan : isKilowattPlan // ignore: cast_nullable_to_non_nullable
as bool,isFixedKilowattPlan: null == isFixedKilowattPlan ? _self.isFixedKilowattPlan : isFixedKilowattPlan // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoicePrintResponse].
extension InvoicePrintResponsePatterns on InvoicePrintResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoicePrintResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoicePrintResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoicePrintResponse value)  $default,){
final _that = this;
switch (_that) {
case _InvoicePrintResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoicePrintResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InvoicePrintResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String companyName,  String? logoUrl,  int invoiceNumber,  String customerName,  String? customerPhone,  String? customerAddress,  String planType,  double planValue,  double unitPrice,  double fixedCharge,  double tvaPercent,  double tvaAmount,  bool showTva,  double? previousReading,  String? previousReadingDate,  double? currentReading,  String? currentReadingDate,  double? totalConsumption,  double consumptionCost,  double subtotalBeforeTva,  double totalAmount,  double paidAmount,  double amountDue,  String invoiceStatus,  String issueDate,  String dueDate,  bool isKilowattPlan,  bool isFixedKilowattPlan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoicePrintResponse() when $default != null:
return $default(_that.companyName,_that.logoUrl,_that.invoiceNumber,_that.customerName,_that.customerPhone,_that.customerAddress,_that.planType,_that.planValue,_that.unitPrice,_that.fixedCharge,_that.tvaPercent,_that.tvaAmount,_that.showTva,_that.previousReading,_that.previousReadingDate,_that.currentReading,_that.currentReadingDate,_that.totalConsumption,_that.consumptionCost,_that.subtotalBeforeTva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.invoiceStatus,_that.issueDate,_that.dueDate,_that.isKilowattPlan,_that.isFixedKilowattPlan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String companyName,  String? logoUrl,  int invoiceNumber,  String customerName,  String? customerPhone,  String? customerAddress,  String planType,  double planValue,  double unitPrice,  double fixedCharge,  double tvaPercent,  double tvaAmount,  bool showTva,  double? previousReading,  String? previousReadingDate,  double? currentReading,  String? currentReadingDate,  double? totalConsumption,  double consumptionCost,  double subtotalBeforeTva,  double totalAmount,  double paidAmount,  double amountDue,  String invoiceStatus,  String issueDate,  String dueDate,  bool isKilowattPlan,  bool isFixedKilowattPlan)  $default,) {final _that = this;
switch (_that) {
case _InvoicePrintResponse():
return $default(_that.companyName,_that.logoUrl,_that.invoiceNumber,_that.customerName,_that.customerPhone,_that.customerAddress,_that.planType,_that.planValue,_that.unitPrice,_that.fixedCharge,_that.tvaPercent,_that.tvaAmount,_that.showTva,_that.previousReading,_that.previousReadingDate,_that.currentReading,_that.currentReadingDate,_that.totalConsumption,_that.consumptionCost,_that.subtotalBeforeTva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.invoiceStatus,_that.issueDate,_that.dueDate,_that.isKilowattPlan,_that.isFixedKilowattPlan);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String companyName,  String? logoUrl,  int invoiceNumber,  String customerName,  String? customerPhone,  String? customerAddress,  String planType,  double planValue,  double unitPrice,  double fixedCharge,  double tvaPercent,  double tvaAmount,  bool showTva,  double? previousReading,  String? previousReadingDate,  double? currentReading,  String? currentReadingDate,  double? totalConsumption,  double consumptionCost,  double subtotalBeforeTva,  double totalAmount,  double paidAmount,  double amountDue,  String invoiceStatus,  String issueDate,  String dueDate,  bool isKilowattPlan,  bool isFixedKilowattPlan)?  $default,) {final _that = this;
switch (_that) {
case _InvoicePrintResponse() when $default != null:
return $default(_that.companyName,_that.logoUrl,_that.invoiceNumber,_that.customerName,_that.customerPhone,_that.customerAddress,_that.planType,_that.planValue,_that.unitPrice,_that.fixedCharge,_that.tvaPercent,_that.tvaAmount,_that.showTva,_that.previousReading,_that.previousReadingDate,_that.currentReading,_that.currentReadingDate,_that.totalConsumption,_that.consumptionCost,_that.subtotalBeforeTva,_that.totalAmount,_that.paidAmount,_that.amountDue,_that.invoiceStatus,_that.issueDate,_that.dueDate,_that.isKilowattPlan,_that.isFixedKilowattPlan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoicePrintResponse implements InvoicePrintResponse {
  const _InvoicePrintResponse({required this.companyName, this.logoUrl, required this.invoiceNumber, required this.customerName, this.customerPhone, this.customerAddress, required this.planType, required this.planValue, required this.unitPrice, required this.fixedCharge, required this.tvaPercent, required this.tvaAmount, required this.showTva, this.previousReading, this.previousReadingDate, this.currentReading, this.currentReadingDate, this.totalConsumption, required this.consumptionCost, required this.subtotalBeforeTva, required this.totalAmount, required this.paidAmount, required this.amountDue, required this.invoiceStatus, required this.issueDate, required this.dueDate, required this.isKilowattPlan, required this.isFixedKilowattPlan});
  factory _InvoicePrintResponse.fromJson(Map<String, dynamic> json) => _$InvoicePrintResponseFromJson(json);

@override final  String companyName;
@override final  String? logoUrl;
@override final  int invoiceNumber;
@override final  String customerName;
@override final  String? customerPhone;
@override final  String? customerAddress;
@override final  String planType;
@override final  double planValue;
@override final  double unitPrice;
@override final  double fixedCharge;
@override final  double tvaPercent;
@override final  double tvaAmount;
@override final  bool showTva;
@override final  double? previousReading;
@override final  String? previousReadingDate;
@override final  double? currentReading;
@override final  String? currentReadingDate;
@override final  double? totalConsumption;
@override final  double consumptionCost;
@override final  double subtotalBeforeTva;
@override final  double totalAmount;
@override final  double paidAmount;
@override final  double amountDue;
@override final  String invoiceStatus;
@override final  String issueDate;
@override final  String dueDate;
@override final  bool isKilowattPlan;
@override final  bool isFixedKilowattPlan;

/// Create a copy of InvoicePrintResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoicePrintResponseCopyWith<_InvoicePrintResponse> get copyWith => __$InvoicePrintResponseCopyWithImpl<_InvoicePrintResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoicePrintResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoicePrintResponse&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.customerAddress, customerAddress) || other.customerAddress == customerAddress)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.planValue, planValue) || other.planValue == planValue)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tvaPercent, tvaPercent) || other.tvaPercent == tvaPercent)&&(identical(other.tvaAmount, tvaAmount) || other.tvaAmount == tvaAmount)&&(identical(other.showTva, showTva) || other.showTva == showTva)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.previousReadingDate, previousReadingDate) || other.previousReadingDate == previousReadingDate)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.currentReadingDate, currentReadingDate) || other.currentReadingDate == currentReadingDate)&&(identical(other.totalConsumption, totalConsumption) || other.totalConsumption == totalConsumption)&&(identical(other.consumptionCost, consumptionCost) || other.consumptionCost == consumptionCost)&&(identical(other.subtotalBeforeTva, subtotalBeforeTva) || other.subtotalBeforeTva == subtotalBeforeTva)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.amountDue, amountDue) || other.amountDue == amountDue)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isKilowattPlan, isKilowattPlan) || other.isKilowattPlan == isKilowattPlan)&&(identical(other.isFixedKilowattPlan, isFixedKilowattPlan) || other.isFixedKilowattPlan == isFixedKilowattPlan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,companyName,logoUrl,invoiceNumber,customerName,customerPhone,customerAddress,planType,planValue,unitPrice,fixedCharge,tvaPercent,tvaAmount,showTva,previousReading,previousReadingDate,currentReading,currentReadingDate,totalConsumption,consumptionCost,subtotalBeforeTva,totalAmount,paidAmount,amountDue,invoiceStatus,issueDate,dueDate,isKilowattPlan,isFixedKilowattPlan]);

@override
String toString() {
  return 'InvoicePrintResponse(companyName: $companyName, logoUrl: $logoUrl, invoiceNumber: $invoiceNumber, customerName: $customerName, customerPhone: $customerPhone, customerAddress: $customerAddress, planType: $planType, planValue: $planValue, unitPrice: $unitPrice, fixedCharge: $fixedCharge, tvaPercent: $tvaPercent, tvaAmount: $tvaAmount, showTva: $showTva, previousReading: $previousReading, previousReadingDate: $previousReadingDate, currentReading: $currentReading, currentReadingDate: $currentReadingDate, totalConsumption: $totalConsumption, consumptionCost: $consumptionCost, subtotalBeforeTva: $subtotalBeforeTva, totalAmount: $totalAmount, paidAmount: $paidAmount, amountDue: $amountDue, invoiceStatus: $invoiceStatus, issueDate: $issueDate, dueDate: $dueDate, isKilowattPlan: $isKilowattPlan, isFixedKilowattPlan: $isFixedKilowattPlan)';
}


}

/// @nodoc
abstract mixin class _$InvoicePrintResponseCopyWith<$Res> implements $InvoicePrintResponseCopyWith<$Res> {
  factory _$InvoicePrintResponseCopyWith(_InvoicePrintResponse value, $Res Function(_InvoicePrintResponse) _then) = __$InvoicePrintResponseCopyWithImpl;
@override @useResult
$Res call({
 String companyName, String? logoUrl, int invoiceNumber, String customerName, String? customerPhone, String? customerAddress, String planType, double planValue, double unitPrice, double fixedCharge, double tvaPercent, double tvaAmount, bool showTva, double? previousReading, String? previousReadingDate, double? currentReading, String? currentReadingDate, double? totalConsumption, double consumptionCost, double subtotalBeforeTva, double totalAmount, double paidAmount, double amountDue, String invoiceStatus, String issueDate, String dueDate, bool isKilowattPlan, bool isFixedKilowattPlan
});




}
/// @nodoc
class __$InvoicePrintResponseCopyWithImpl<$Res>
    implements _$InvoicePrintResponseCopyWith<$Res> {
  __$InvoicePrintResponseCopyWithImpl(this._self, this._then);

  final _InvoicePrintResponse _self;
  final $Res Function(_InvoicePrintResponse) _then;

/// Create a copy of InvoicePrintResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = null,Object? logoUrl = freezed,Object? invoiceNumber = null,Object? customerName = null,Object? customerPhone = freezed,Object? customerAddress = freezed,Object? planType = null,Object? planValue = null,Object? unitPrice = null,Object? fixedCharge = null,Object? tvaPercent = null,Object? tvaAmount = null,Object? showTva = null,Object? previousReading = freezed,Object? previousReadingDate = freezed,Object? currentReading = freezed,Object? currentReadingDate = freezed,Object? totalConsumption = freezed,Object? consumptionCost = null,Object? subtotalBeforeTva = null,Object? totalAmount = null,Object? paidAmount = null,Object? amountDue = null,Object? invoiceStatus = null,Object? issueDate = null,Object? dueDate = null,Object? isKilowattPlan = null,Object? isFixedKilowattPlan = null,}) {
  return _then(_InvoicePrintResponse(
companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,customerAddress: freezed == customerAddress ? _self.customerAddress : customerAddress // ignore: cast_nullable_to_non_nullable
as String?,planType: null == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as String,planValue: null == planValue ? _self.planValue : planValue // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,fixedCharge: null == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double,tvaPercent: null == tvaPercent ? _self.tvaPercent : tvaPercent // ignore: cast_nullable_to_non_nullable
as double,tvaAmount: null == tvaAmount ? _self.tvaAmount : tvaAmount // ignore: cast_nullable_to_non_nullable
as double,showTva: null == showTva ? _self.showTva : showTva // ignore: cast_nullable_to_non_nullable
as bool,previousReading: freezed == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as double?,previousReadingDate: freezed == previousReadingDate ? _self.previousReadingDate : previousReadingDate // ignore: cast_nullable_to_non_nullable
as String?,currentReading: freezed == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as double?,currentReadingDate: freezed == currentReadingDate ? _self.currentReadingDate : currentReadingDate // ignore: cast_nullable_to_non_nullable
as String?,totalConsumption: freezed == totalConsumption ? _self.totalConsumption : totalConsumption // ignore: cast_nullable_to_non_nullable
as double?,consumptionCost: null == consumptionCost ? _self.consumptionCost : consumptionCost // ignore: cast_nullable_to_non_nullable
as double,subtotalBeforeTva: null == subtotalBeforeTva ? _self.subtotalBeforeTva : subtotalBeforeTva // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,amountDue: null == amountDue ? _self.amountDue : amountDue // ignore: cast_nullable_to_non_nullable
as double,invoiceStatus: null == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,isKilowattPlan: null == isKilowattPlan ? _self.isKilowattPlan : isKilowattPlan // ignore: cast_nullable_to_non_nullable
as bool,isFixedKilowattPlan: null == isFixedKilowattPlan ? _self.isFixedKilowattPlan : isFixedKilowattPlan // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
