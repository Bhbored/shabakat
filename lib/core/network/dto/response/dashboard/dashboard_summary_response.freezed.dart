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

 double get totalBilledAllTime; double get totalCollectedAllTime; double get totalOutstandingAllTime; double get collectionRate; double get totalExpensesAllTime; double get netIncomeAllTime; CustomerOverviewResponse get customers; InvoiceOverviewResponse get invoices; ExpensesByTypeResponse get expensesByType;
/// Create a copy of DashboardSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryResponseCopyWith<DashboardSummaryResponse> get copyWith => _$DashboardSummaryResponseCopyWithImpl<DashboardSummaryResponse>(this as DashboardSummaryResponse, _$identity);

  /// Serializes this DashboardSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummaryResponse&&(identical(other.totalBilledAllTime, totalBilledAllTime) || other.totalBilledAllTime == totalBilledAllTime)&&(identical(other.totalCollectedAllTime, totalCollectedAllTime) || other.totalCollectedAllTime == totalCollectedAllTime)&&(identical(other.totalOutstandingAllTime, totalOutstandingAllTime) || other.totalOutstandingAllTime == totalOutstandingAllTime)&&(identical(other.collectionRate, collectionRate) || other.collectionRate == collectionRate)&&(identical(other.totalExpensesAllTime, totalExpensesAllTime) || other.totalExpensesAllTime == totalExpensesAllTime)&&(identical(other.netIncomeAllTime, netIncomeAllTime) || other.netIncomeAllTime == netIncomeAllTime)&&(identical(other.customers, customers) || other.customers == customers)&&(identical(other.invoices, invoices) || other.invoices == invoices)&&(identical(other.expensesByType, expensesByType) || other.expensesByType == expensesByType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBilledAllTime,totalCollectedAllTime,totalOutstandingAllTime,collectionRate,totalExpensesAllTime,netIncomeAllTime,customers,invoices,expensesByType);

@override
String toString() {
  return 'DashboardSummaryResponse(totalBilledAllTime: $totalBilledAllTime, totalCollectedAllTime: $totalCollectedAllTime, totalOutstandingAllTime: $totalOutstandingAllTime, collectionRate: $collectionRate, totalExpensesAllTime: $totalExpensesAllTime, netIncomeAllTime: $netIncomeAllTime, customers: $customers, invoices: $invoices, expensesByType: $expensesByType)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryResponseCopyWith<$Res>  {
  factory $DashboardSummaryResponseCopyWith(DashboardSummaryResponse value, $Res Function(DashboardSummaryResponse) _then) = _$DashboardSummaryResponseCopyWithImpl;
@useResult
$Res call({
 double totalBilledAllTime, double totalCollectedAllTime, double totalOutstandingAllTime, double collectionRate, double totalExpensesAllTime, double netIncomeAllTime, CustomerOverviewResponse customers, InvoiceOverviewResponse invoices, ExpensesByTypeResponse expensesByType
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
@pragma('vm:prefer-inline') @override $Res call({Object? totalBilledAllTime = null,Object? totalCollectedAllTime = null,Object? totalOutstandingAllTime = null,Object? collectionRate = null,Object? totalExpensesAllTime = null,Object? netIncomeAllTime = null,Object? customers = null,Object? invoices = null,Object? expensesByType = null,}) {
  return _then(_self.copyWith(
totalBilledAllTime: null == totalBilledAllTime ? _self.totalBilledAllTime : totalBilledAllTime // ignore: cast_nullable_to_non_nullable
as double,totalCollectedAllTime: null == totalCollectedAllTime ? _self.totalCollectedAllTime : totalCollectedAllTime // ignore: cast_nullable_to_non_nullable
as double,totalOutstandingAllTime: null == totalOutstandingAllTime ? _self.totalOutstandingAllTime : totalOutstandingAllTime // ignore: cast_nullable_to_non_nullable
as double,collectionRate: null == collectionRate ? _self.collectionRate : collectionRate // ignore: cast_nullable_to_non_nullable
as double,totalExpensesAllTime: null == totalExpensesAllTime ? _self.totalExpensesAllTime : totalExpensesAllTime // ignore: cast_nullable_to_non_nullable
as double,netIncomeAllTime: null == netIncomeAllTime ? _self.netIncomeAllTime : netIncomeAllTime // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalBilledAllTime,  double totalCollectedAllTime,  double totalOutstandingAllTime,  double collectionRate,  double totalExpensesAllTime,  double netIncomeAllTime,  CustomerOverviewResponse customers,  InvoiceOverviewResponse invoices,  ExpensesByTypeResponse expensesByType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummaryResponse() when $default != null:
return $default(_that.totalBilledAllTime,_that.totalCollectedAllTime,_that.totalOutstandingAllTime,_that.collectionRate,_that.totalExpensesAllTime,_that.netIncomeAllTime,_that.customers,_that.invoices,_that.expensesByType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalBilledAllTime,  double totalCollectedAllTime,  double totalOutstandingAllTime,  double collectionRate,  double totalExpensesAllTime,  double netIncomeAllTime,  CustomerOverviewResponse customers,  InvoiceOverviewResponse invoices,  ExpensesByTypeResponse expensesByType)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryResponse():
return $default(_that.totalBilledAllTime,_that.totalCollectedAllTime,_that.totalOutstandingAllTime,_that.collectionRate,_that.totalExpensesAllTime,_that.netIncomeAllTime,_that.customers,_that.invoices,_that.expensesByType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalBilledAllTime,  double totalCollectedAllTime,  double totalOutstandingAllTime,  double collectionRate,  double totalExpensesAllTime,  double netIncomeAllTime,  CustomerOverviewResponse customers,  InvoiceOverviewResponse invoices,  ExpensesByTypeResponse expensesByType)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryResponse() when $default != null:
return $default(_that.totalBilledAllTime,_that.totalCollectedAllTime,_that.totalOutstandingAllTime,_that.collectionRate,_that.totalExpensesAllTime,_that.netIncomeAllTime,_that.customers,_that.invoices,_that.expensesByType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummaryResponse implements DashboardSummaryResponse {
  const _DashboardSummaryResponse({this.totalBilledAllTime = 0.0, this.totalCollectedAllTime = 0.0, this.totalOutstandingAllTime = 0.0, this.collectionRate = 0.0, this.totalExpensesAllTime = 0.0, this.netIncomeAllTime = 0.0, this.customers = const CustomerOverviewResponse(), this.invoices = const InvoiceOverviewResponse(), this.expensesByType = const ExpensesByTypeResponse()});
  factory _DashboardSummaryResponse.fromJson(Map<String, dynamic> json) => _$DashboardSummaryResponseFromJson(json);

@override@JsonKey() final  double totalBilledAllTime;
@override@JsonKey() final  double totalCollectedAllTime;
@override@JsonKey() final  double totalOutstandingAllTime;
@override@JsonKey() final  double collectionRate;
@override@JsonKey() final  double totalExpensesAllTime;
@override@JsonKey() final  double netIncomeAllTime;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummaryResponse&&(identical(other.totalBilledAllTime, totalBilledAllTime) || other.totalBilledAllTime == totalBilledAllTime)&&(identical(other.totalCollectedAllTime, totalCollectedAllTime) || other.totalCollectedAllTime == totalCollectedAllTime)&&(identical(other.totalOutstandingAllTime, totalOutstandingAllTime) || other.totalOutstandingAllTime == totalOutstandingAllTime)&&(identical(other.collectionRate, collectionRate) || other.collectionRate == collectionRate)&&(identical(other.totalExpensesAllTime, totalExpensesAllTime) || other.totalExpensesAllTime == totalExpensesAllTime)&&(identical(other.netIncomeAllTime, netIncomeAllTime) || other.netIncomeAllTime == netIncomeAllTime)&&(identical(other.customers, customers) || other.customers == customers)&&(identical(other.invoices, invoices) || other.invoices == invoices)&&(identical(other.expensesByType, expensesByType) || other.expensesByType == expensesByType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBilledAllTime,totalCollectedAllTime,totalOutstandingAllTime,collectionRate,totalExpensesAllTime,netIncomeAllTime,customers,invoices,expensesByType);

@override
String toString() {
  return 'DashboardSummaryResponse(totalBilledAllTime: $totalBilledAllTime, totalCollectedAllTime: $totalCollectedAllTime, totalOutstandingAllTime: $totalOutstandingAllTime, collectionRate: $collectionRate, totalExpensesAllTime: $totalExpensesAllTime, netIncomeAllTime: $netIncomeAllTime, customers: $customers, invoices: $invoices, expensesByType: $expensesByType)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryResponseCopyWith<$Res> implements $DashboardSummaryResponseCopyWith<$Res> {
  factory _$DashboardSummaryResponseCopyWith(_DashboardSummaryResponse value, $Res Function(_DashboardSummaryResponse) _then) = __$DashboardSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 double totalBilledAllTime, double totalCollectedAllTime, double totalOutstandingAllTime, double collectionRate, double totalExpensesAllTime, double netIncomeAllTime, CustomerOverviewResponse customers, InvoiceOverviewResponse invoices, ExpensesByTypeResponse expensesByType
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
@override @pragma('vm:prefer-inline') $Res call({Object? totalBilledAllTime = null,Object? totalCollectedAllTime = null,Object? totalOutstandingAllTime = null,Object? collectionRate = null,Object? totalExpensesAllTime = null,Object? netIncomeAllTime = null,Object? customers = null,Object? invoices = null,Object? expensesByType = null,}) {
  return _then(_DashboardSummaryResponse(
totalBilledAllTime: null == totalBilledAllTime ? _self.totalBilledAllTime : totalBilledAllTime // ignore: cast_nullable_to_non_nullable
as double,totalCollectedAllTime: null == totalCollectedAllTime ? _self.totalCollectedAllTime : totalCollectedAllTime // ignore: cast_nullable_to_non_nullable
as double,totalOutstandingAllTime: null == totalOutstandingAllTime ? _self.totalOutstandingAllTime : totalOutstandingAllTime // ignore: cast_nullable_to_non_nullable
as double,collectionRate: null == collectionRate ? _self.collectionRate : collectionRate // ignore: cast_nullable_to_non_nullable
as double,totalExpensesAllTime: null == totalExpensesAllTime ? _self.totalExpensesAllTime : totalExpensesAllTime // ignore: cast_nullable_to_non_nullable
as double,netIncomeAllTime: null == netIncomeAllTime ? _self.netIncomeAllTime : netIncomeAllTime // ignore: cast_nullable_to_non_nullable
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
