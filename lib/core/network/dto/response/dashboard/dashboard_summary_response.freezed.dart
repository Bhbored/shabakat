// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardSummaryResponse {

 double get totalBilledThisMonth; double get totalCollectedThisMonth; double get totalOutstandingAllTime; double get collectionRate; double get totalExpensesThisMonth; double get netIncomeThisMonth; CustomerOverviewResponse get customers; InvoiceOverviewResponse get invoices; ExpensesByTypeResponse get expensesByType;
/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryResponseCopyWith<DashboardSummaryResponse> get copyWith => _$DashboardSummaryResponseCopyWithImpl<DashboardSummaryResponse>(this as DashboardSummaryResponse, _$identity);

  /// Serializes this DashboardSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummaryResponse&&(identical(other.totalBilledThisMonth, totalBilledThisMonth) || other.totalBilledThisMonth == totalBilledThisMonth)&&(identical(other.totalCollectedThisMonth, totalCollectedThisMonth) || other.totalCollectedThisMonth == totalCollectedThisMonth)&&(identical(other.totalOutstandingAllTime, totalOutstandingAllTime) || other.totalOutstandingAllTime == totalOutstandingAllTime)&&(identical(other.collectionRate, collectionRate) || other.collectionRate == collectionRate)&&(identical(other.totalExpensesThisMonth, totalExpensesThisMonth) || other.totalExpensesThisMonth == totalExpensesThisMonth)&&(identical(other.netIncomeThisMonth, netIncomeThisMonth) || other.netIncomeThisMonth == netIncomeThisMonth)&&(identical(other.customers, customers) || other.customers == customers)&&(identical(other.invoices, invoices) || other.invoices == invoices)&&(identical(other.expensesByType, expensesByType) || other.expensesByType == expensesByType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBilledThisMonth,totalCollectedThisMonth,totalOutstandingAllTime,collectionRate,totalExpensesThisMonth,netIncomeThisMonth,customers,invoices,expensesByType);

@override
String toString() {
  return 'DashboardSummaryResponse(totalBilledThisMonth: $totalBilledThisMonth, totalCollectedThisMonth: $totalCollectedThisMonth, totalOutstandingAllTime: $totalOutstandingAllTime, collectionRate: $collectionRate, totalExpensesThisMonth: $totalExpensesThisMonth, netIncomeThisMonth: $netIncomeThisMonth, customers: $customers, invoices: $invoices, expensesByType: $expensesByType)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryResponseCopyWith<$Res>  {
  factory $DashboardSummaryResponseCopyWith(DashboardSummaryResponse value, $Res Function(DashboardSummaryResponse) _then) = _$DashboardSummaryResponseCopyWithImpl;
@useResult
$Res call({
 double totalBilledThisMonth, double totalCollectedThisMonth, double totalOutstandingAllTime, double collectionRate, double totalExpensesThisMonth, double netIncomeThisMonth, CustomerOverviewResponse customers, InvoiceOverviewResponse invoices, ExpensesByTypeResponse expensesByType
});


$CustomerOverviewResponseCopyWith<$Res> get customers;$InvoiceOverviewResponseCopyWith<$Res> get invoices;$ExpensesByTypeResponseCopyWith<$Res> get expensesByType;

}
/// @nodoc
class _$DashboardSummaryResponseCopyWithImpl<$Res>
    implements $DashboardSummaryResponseCopyWith<$Res> {
  _$DashboardSummaryResponseCopyWithImpl(this._self, this._then);

  final DashboardSummaryResponse _self;
  final $Res Function(DashboardSummaryResponse) _then;

/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBilledThisMonth = null,Object? totalCollectedThisMonth = null,Object? totalOutstandingAllTime = null,Object? collectionRate = null,Object? totalExpensesThisMonth = null,Object? netIncomeThisMonth = null,Object? customers = null,Object? invoices = null,Object? expensesByType = null,}) {
  return _then(_self.copyWith(
totalBilledThisMonth: null == totalBilledThisMonth ? _self.totalBilledThisMonth : totalBilledThisMonth // ignore: cast_nullable_to_non_nullable
as double,totalCollectedThisMonth: null == totalCollectedThisMonth ? _self.totalCollectedThisMonth : totalCollectedThisMonth // ignore: cast_nullable_to_non_nullable
as double,totalOutstandingAllTime: null == totalOutstandingAllTime ? _self.totalOutstandingAllTime : totalOutstandingAllTime // ignore: cast_nullable_to_non_nullable
as double,collectionRate: null == collectionRate ? _self.collectionRate : collectionRate // ignore: cast_nullable_to_non_nullable
as double,totalExpensesThisMonth: null == totalExpensesThisMonth ? _self.totalExpensesThisMonth : totalExpensesThisMonth // ignore: cast_nullable_to_non_nullable
as double,netIncomeThisMonth: null == netIncomeThisMonth ? _self.netIncomeThisMonth : netIncomeThisMonth // ignore: cast_nullable_to_non_nullable
as double,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as CustomerOverviewResponse,invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as InvoiceOverviewResponse,expensesByType: null == expensesByType ? _self.expensesByType : expensesByType // ignore: cast_nullable_to_non_nullable
as ExpensesByTypeResponse,
  ));
}
/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerOverviewResponseCopyWith<$Res> get customers {
  
  return $CustomerOverviewResponseCopyWith<$Res>(_self.customers, (value) {
    return _then(_self.copyWith(customers: value));
  });
}/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceOverviewResponseCopyWith<$Res> get invoices {
  
  return $InvoiceOverviewResponseCopyWith<$Res>(_self.invoices, (value) {
    return _then(_self.copyWith(invoices: value));
  });
}/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpensesByTypeResponseCopyWith<$Res> get expensesByType {
  
  return $ExpensesByTypeResponseCopyWith<$Res>(_self.expensesByType, (value) {
    return _then(_self.copyWith(expensesByType: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardSummaryResponse].
extension DashboardSummaryResponsePatterns on DashboardSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalBilledThisMonth,  double totalCollectedThisMonth,  double totalOutstandingAllTime,  double collectionRate,  double totalExpensesThisMonth,  double netIncomeThisMonth,  CustomerOverviewResponse customers,  InvoiceOverviewResponse invoices,  ExpensesByTypeResponse expensesByType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummaryResponse() when $default != null:
return $default(_that.totalBilledThisMonth,_that.totalCollectedThisMonth,_that.totalOutstandingAllTime,_that.collectionRate,_that.totalExpensesThisMonth,_that.netIncomeThisMonth,_that.customers,_that.invoices,_that.expensesByType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalBilledThisMonth,  double totalCollectedThisMonth,  double totalOutstandingAllTime,  double collectionRate,  double totalExpensesThisMonth,  double netIncomeThisMonth,  CustomerOverviewResponse customers,  InvoiceOverviewResponse invoices,  ExpensesByTypeResponse expensesByType)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryResponse():
return $default(_that.totalBilledThisMonth,_that.totalCollectedThisMonth,_that.totalOutstandingAllTime,_that.collectionRate,_that.totalExpensesThisMonth,_that.netIncomeThisMonth,_that.customers,_that.invoices,_that.expensesByType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalBilledThisMonth,  double totalCollectedThisMonth,  double totalOutstandingAllTime,  double collectionRate,  double totalExpensesThisMonth,  double netIncomeThisMonth,  CustomerOverviewResponse customers,  InvoiceOverviewResponse invoices,  ExpensesByTypeResponse expensesByType)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryResponse() when $default != null:
return $default(_that.totalBilledThisMonth,_that.totalCollectedThisMonth,_that.totalOutstandingAllTime,_that.collectionRate,_that.totalExpensesThisMonth,_that.netIncomeThisMonth,_that.customers,_that.invoices,_that.expensesByType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummaryResponse implements DashboardSummaryResponse {
  const _DashboardSummaryResponse({this.totalBilledThisMonth = 0.0, this.totalCollectedThisMonth = 0.0, this.totalOutstandingAllTime = 0.0, this.collectionRate = 0.0, this.totalExpensesThisMonth = 0.0, this.netIncomeThisMonth = 0.0, this.customers = const CustomerOverviewResponse(), this.invoices = const InvoiceOverviewResponse(), this.expensesByType = const ExpensesByTypeResponse()});
  factory _DashboardSummaryResponse.fromJson(Map<String, dynamic> json) => _$DashboardSummaryResponseFromJson(json);

@override@JsonKey() final  double totalBilledThisMonth;
@override@JsonKey() final  double totalCollectedThisMonth;
@override@JsonKey() final  double totalOutstandingAllTime;
@override@JsonKey() final  double collectionRate;
@override@JsonKey() final  double totalExpensesThisMonth;
@override@JsonKey() final  double netIncomeThisMonth;
@override@JsonKey() final  CustomerOverviewResponse customers;
@override@JsonKey() final  InvoiceOverviewResponse invoices;
@override@JsonKey() final  ExpensesByTypeResponse expensesByType;

/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryResponseCopyWith<_DashboardSummaryResponse> get copyWith => __$DashboardSummaryResponseCopyWithImpl<_DashboardSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummaryResponse&&(identical(other.totalBilledThisMonth, totalBilledThisMonth) || other.totalBilledThisMonth == totalBilledThisMonth)&&(identical(other.totalCollectedThisMonth, totalCollectedThisMonth) || other.totalCollectedThisMonth == totalCollectedThisMonth)&&(identical(other.totalOutstandingAllTime, totalOutstandingAllTime) || other.totalOutstandingAllTime == totalOutstandingAllTime)&&(identical(other.collectionRate, collectionRate) || other.collectionRate == collectionRate)&&(identical(other.totalExpensesThisMonth, totalExpensesThisMonth) || other.totalExpensesThisMonth == totalExpensesThisMonth)&&(identical(other.netIncomeThisMonth, netIncomeThisMonth) || other.netIncomeThisMonth == netIncomeThisMonth)&&(identical(other.customers, customers) || other.customers == customers)&&(identical(other.invoices, invoices) || other.invoices == invoices)&&(identical(other.expensesByType, expensesByType) || other.expensesByType == expensesByType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBilledThisMonth,totalCollectedThisMonth,totalOutstandingAllTime,collectionRate,totalExpensesThisMonth,netIncomeThisMonth,customers,invoices,expensesByType);

@override
String toString() {
  return 'DashboardSummaryResponse(totalBilledThisMonth: $totalBilledThisMonth, totalCollectedThisMonth: $totalCollectedThisMonth, totalOutstandingAllTime: $totalOutstandingAllTime, collectionRate: $collectionRate, totalExpensesThisMonth: $totalExpensesThisMonth, netIncomeThisMonth: $netIncomeThisMonth, customers: $customers, invoices: $invoices, expensesByType: $expensesByType)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryResponseCopyWith<$Res> implements $DashboardSummaryResponseCopyWith<$Res> {
  factory _$DashboardSummaryResponseCopyWith(_DashboardSummaryResponse value, $Res Function(_DashboardSummaryResponse) _then) = __$DashboardSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 double totalBilledThisMonth, double totalCollectedThisMonth, double totalOutstandingAllTime, double collectionRate, double totalExpensesThisMonth, double netIncomeThisMonth, CustomerOverviewResponse customers, InvoiceOverviewResponse invoices, ExpensesByTypeResponse expensesByType
});


@override $CustomerOverviewResponseCopyWith<$Res> get customers;@override $InvoiceOverviewResponseCopyWith<$Res> get invoices;@override $ExpensesByTypeResponseCopyWith<$Res> get expensesByType;

}
/// @nodoc
class __$DashboardSummaryResponseCopyWithImpl<$Res>
    implements _$DashboardSummaryResponseCopyWith<$Res> {
  __$DashboardSummaryResponseCopyWithImpl(this._self, this._then);

  final _DashboardSummaryResponse _self;
  final $Res Function(_DashboardSummaryResponse) _then;

/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBilledThisMonth = null,Object? totalCollectedThisMonth = null,Object? totalOutstandingAllTime = null,Object? collectionRate = null,Object? totalExpensesThisMonth = null,Object? netIncomeThisMonth = null,Object? customers = null,Object? invoices = null,Object? expensesByType = null,}) {
  return _then(_DashboardSummaryResponse(
totalBilledThisMonth: null == totalBilledThisMonth ? _self.totalBilledThisMonth : totalBilledThisMonth // ignore: cast_nullable_to_non_nullable
as double,totalCollectedThisMonth: null == totalCollectedThisMonth ? _self.totalCollectedThisMonth : totalCollectedThisMonth // ignore: cast_nullable_to_non_nullable
as double,totalOutstandingAllTime: null == totalOutstandingAllTime ? _self.totalOutstandingAllTime : totalOutstandingAllTime // ignore: cast_nullable_to_non_nullable
as double,collectionRate: null == collectionRate ? _self.collectionRate : collectionRate // ignore: cast_nullable_to_non_nullable
as double,totalExpensesThisMonth: null == totalExpensesThisMonth ? _self.totalExpensesThisMonth : totalExpensesThisMonth // ignore: cast_nullable_to_non_nullable
as double,netIncomeThisMonth: null == netIncomeThisMonth ? _self.netIncomeThisMonth : netIncomeThisMonth // ignore: cast_nullable_to_non_nullable
as double,customers: null == customers ? _self.customers : customers // ignore: cast_nullable_to_non_nullable
as CustomerOverviewResponse,invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as InvoiceOverviewResponse,expensesByType: null == expensesByType ? _self.expensesByType : expensesByType // ignore: cast_nullable_to_non_nullable
as ExpensesByTypeResponse,
  ));
}

/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerOverviewResponseCopyWith<$Res> get customers {
  
  return $CustomerOverviewResponseCopyWith<$Res>(_self.customers, (value) {
    return _then(_self.copyWith(customers: value));
  });
}/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceOverviewResponseCopyWith<$Res> get invoices {
  
  return $InvoiceOverviewResponseCopyWith<$Res>(_self.invoices, (value) {
    return _then(_self.copyWith(invoices: value));
  });
}/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpensesByTypeResponseCopyWith<$Res> get expensesByType {
  
  return $ExpensesByTypeResponseCopyWith<$Res>(_self.expensesByType, (value) {
    return _then(_self.copyWith(expensesByType: value));
  });
}
}

// dart format on
