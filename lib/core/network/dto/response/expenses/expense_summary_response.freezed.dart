// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseSummaryResponse {

 String get id; double get fuelExpense; double get maintenanceExpenses; double get employeesExpenses; double get otherExpensesTotal; double get totalExpense;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get expenseDate; String? get notes; DateTime get createdAt;
/// Create a copy of ExpenseSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseSummaryResponseCopyWith<ExpenseSummaryResponse> get copyWith => _$ExpenseSummaryResponseCopyWithImpl<ExpenseSummaryResponse>(this as ExpenseSummaryResponse, _$identity);

  /// Serializes this ExpenseSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseSummaryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.otherExpensesTotal, otherExpensesTotal) || other.otherExpensesTotal == otherExpensesTotal)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fuelExpense,maintenanceExpenses,employeesExpenses,otherExpensesTotal,totalExpense,expenseDate,notes,createdAt);

@override
String toString() {
  return 'ExpenseSummaryResponse(id: $id, fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, otherExpensesTotal: $otherExpensesTotal, totalExpense: $totalExpense, expenseDate: $expenseDate, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ExpenseSummaryResponseCopyWith<$Res>  {
  factory $ExpenseSummaryResponseCopyWith(ExpenseSummaryResponse value, $Res Function(ExpenseSummaryResponse) _then) = _$ExpenseSummaryResponseCopyWithImpl;
@useResult
$Res call({
 String id, double fuelExpense, double maintenanceExpenses, double employeesExpenses, double otherExpensesTotal, double totalExpense,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime expenseDate, String? notes, DateTime createdAt
});




}
/// @nodoc
class _$ExpenseSummaryResponseCopyWithImpl<$Res>
    implements $ExpenseSummaryResponseCopyWith<$Res> {
  _$ExpenseSummaryResponseCopyWithImpl(this._self, this._then);

  final ExpenseSummaryResponse _self;
  final $Res Function(ExpenseSummaryResponse) _then;

/// Create a copy of ExpenseSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fuelExpense = null,Object? maintenanceExpenses = null,Object? employeesExpenses = null,Object? otherExpensesTotal = null,Object? totalExpense = null,Object? expenseDate = null,Object? notes = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double,maintenanceExpenses: null == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double,employeesExpenses: null == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double,otherExpensesTotal: null == otherExpensesTotal ? _self.otherExpensesTotal : otherExpensesTotal // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseSummaryResponse].
extension ExpenseSummaryResponsePatterns on ExpenseSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  double otherExpensesTotal,  double totalExpense, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? notes,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseSummaryResponse() when $default != null:
return $default(_that.id,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.otherExpensesTotal,_that.totalExpense,_that.expenseDate,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  double otherExpensesTotal,  double totalExpense, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? notes,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ExpenseSummaryResponse():
return $default(_that.id,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.otherExpensesTotal,_that.totalExpense,_that.expenseDate,_that.notes,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  double otherExpensesTotal,  double totalExpense, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? notes,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseSummaryResponse() when $default != null:
return $default(_that.id,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.otherExpensesTotal,_that.totalExpense,_that.expenseDate,_that.notes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseSummaryResponse implements ExpenseSummaryResponse {
  const _ExpenseSummaryResponse({required this.id, required this.fuelExpense, required this.maintenanceExpenses, required this.employeesExpenses, required this.otherExpensesTotal, required this.totalExpense, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.expenseDate, this.notes, required this.createdAt});
  factory _ExpenseSummaryResponse.fromJson(Map<String, dynamic> json) => _$ExpenseSummaryResponseFromJson(json);

@override final  String id;
@override final  double fuelExpense;
@override final  double maintenanceExpenses;
@override final  double employeesExpenses;
@override final  double otherExpensesTotal;
@override final  double totalExpense;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime expenseDate;
@override final  String? notes;
@override final  DateTime createdAt;

/// Create a copy of ExpenseSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseSummaryResponseCopyWith<_ExpenseSummaryResponse> get copyWith => __$ExpenseSummaryResponseCopyWithImpl<_ExpenseSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseSummaryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.otherExpensesTotal, otherExpensesTotal) || other.otherExpensesTotal == otherExpensesTotal)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fuelExpense,maintenanceExpenses,employeesExpenses,otherExpensesTotal,totalExpense,expenseDate,notes,createdAt);

@override
String toString() {
  return 'ExpenseSummaryResponse(id: $id, fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, otherExpensesTotal: $otherExpensesTotal, totalExpense: $totalExpense, expenseDate: $expenseDate, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ExpenseSummaryResponseCopyWith<$Res> implements $ExpenseSummaryResponseCopyWith<$Res> {
  factory _$ExpenseSummaryResponseCopyWith(_ExpenseSummaryResponse value, $Res Function(_ExpenseSummaryResponse) _then) = __$ExpenseSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, double fuelExpense, double maintenanceExpenses, double employeesExpenses, double otherExpensesTotal, double totalExpense,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime expenseDate, String? notes, DateTime createdAt
});




}
/// @nodoc
class __$ExpenseSummaryResponseCopyWithImpl<$Res>
    implements _$ExpenseSummaryResponseCopyWith<$Res> {
  __$ExpenseSummaryResponseCopyWithImpl(this._self, this._then);

  final _ExpenseSummaryResponse _self;
  final $Res Function(_ExpenseSummaryResponse) _then;

/// Create a copy of ExpenseSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fuelExpense = null,Object? maintenanceExpenses = null,Object? employeesExpenses = null,Object? otherExpensesTotal = null,Object? totalExpense = null,Object? expenseDate = null,Object? notes = freezed,Object? createdAt = null,}) {
  return _then(_ExpenseSummaryResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double,maintenanceExpenses: null == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double,employeesExpenses: null == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double,otherExpensesTotal: null == otherExpensesTotal ? _self.otherExpensesTotal : otherExpensesTotal // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
