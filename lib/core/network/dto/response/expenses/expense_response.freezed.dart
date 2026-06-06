// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseResponse {

 String get id; double get fuelExpense; double get maintenanceExpenses; double get employeesExpenses; double get otherExpensesTotal; double get totalExpense;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get expenseDate; String? get notes; DateTime get createdAt; DateTime get updatedAt; List<OtherExpenseResponse> get otherExpenses;
/// Create a copy of ExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseResponseCopyWith<ExpenseResponse> get copyWith => _$ExpenseResponseCopyWithImpl<ExpenseResponse>(this as ExpenseResponse, _$identity);

  /// Serializes this ExpenseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.otherExpensesTotal, otherExpensesTotal) || other.otherExpensesTotal == otherExpensesTotal)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.otherExpenses, otherExpenses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fuelExpense,maintenanceExpenses,employeesExpenses,otherExpensesTotal,totalExpense,expenseDate,notes,createdAt,updatedAt,const DeepCollectionEquality().hash(otherExpenses));

@override
String toString() {
  return 'ExpenseResponse(id: $id, fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, otherExpensesTotal: $otherExpensesTotal, totalExpense: $totalExpense, expenseDate: $expenseDate, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, otherExpenses: $otherExpenses)';
}


}

/// @nodoc
abstract mixin class $ExpenseResponseCopyWith<$Res>  {
  factory $ExpenseResponseCopyWith(ExpenseResponse value, $Res Function(ExpenseResponse) _then) = _$ExpenseResponseCopyWithImpl;
@useResult
$Res call({
 String id, double fuelExpense, double maintenanceExpenses, double employeesExpenses, double otherExpensesTotal, double totalExpense,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime expenseDate, String? notes, DateTime createdAt, DateTime updatedAt, List<OtherExpenseResponse> otherExpenses
});




}
/// @nodoc
class _$ExpenseResponseCopyWithImpl<$Res>
    implements $ExpenseResponseCopyWith<$Res> {
  _$ExpenseResponseCopyWithImpl(this._self, this._then);

  final ExpenseResponse _self;
  final $Res Function(ExpenseResponse) _then;

/// Create a copy of ExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fuelExpense = null,Object? maintenanceExpenses = null,Object? employeesExpenses = null,Object? otherExpensesTotal = null,Object? totalExpense = null,Object? expenseDate = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? otherExpenses = null,}) {
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
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,otherExpenses: null == otherExpenses ? _self.otherExpenses : otherExpenses // ignore: cast_nullable_to_non_nullable
as List<OtherExpenseResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseResponse].
extension ExpenseResponsePatterns on ExpenseResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseResponse value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  double otherExpensesTotal,  double totalExpense, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? notes,  DateTime createdAt,  DateTime updatedAt,  List<OtherExpenseResponse> otherExpenses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseResponse() when $default != null:
return $default(_that.id,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.otherExpensesTotal,_that.totalExpense,_that.expenseDate,_that.notes,_that.createdAt,_that.updatedAt,_that.otherExpenses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  double otherExpensesTotal,  double totalExpense, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? notes,  DateTime createdAt,  DateTime updatedAt,  List<OtherExpenseResponse> otherExpenses)  $default,) {final _that = this;
switch (_that) {
case _ExpenseResponse():
return $default(_that.id,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.otherExpensesTotal,_that.totalExpense,_that.expenseDate,_that.notes,_that.createdAt,_that.updatedAt,_that.otherExpenses);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  double otherExpensesTotal,  double totalExpense, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? notes,  DateTime createdAt,  DateTime updatedAt,  List<OtherExpenseResponse> otherExpenses)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseResponse() when $default != null:
return $default(_that.id,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.otherExpensesTotal,_that.totalExpense,_that.expenseDate,_that.notes,_that.createdAt,_that.updatedAt,_that.otherExpenses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseResponse implements ExpenseResponse {
  const _ExpenseResponse({required this.id, required this.fuelExpense, required this.maintenanceExpenses, required this.employeesExpenses, required this.otherExpensesTotal, required this.totalExpense, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.expenseDate, this.notes, required this.createdAt, required this.updatedAt, required final  List<OtherExpenseResponse> otherExpenses}): _otherExpenses = otherExpenses;
  factory _ExpenseResponse.fromJson(Map<String, dynamic> json) => _$ExpenseResponseFromJson(json);

@override final  String id;
@override final  double fuelExpense;
@override final  double maintenanceExpenses;
@override final  double employeesExpenses;
@override final  double otherExpensesTotal;
@override final  double totalExpense;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime expenseDate;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<OtherExpenseResponse> _otherExpenses;
@override List<OtherExpenseResponse> get otherExpenses {
  if (_otherExpenses is EqualUnmodifiableListView) return _otherExpenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_otherExpenses);
}


/// Create a copy of ExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseResponseCopyWith<_ExpenseResponse> get copyWith => __$ExpenseResponseCopyWithImpl<_ExpenseResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.otherExpensesTotal, otherExpensesTotal) || other.otherExpensesTotal == otherExpensesTotal)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._otherExpenses, _otherExpenses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fuelExpense,maintenanceExpenses,employeesExpenses,otherExpensesTotal,totalExpense,expenseDate,notes,createdAt,updatedAt,const DeepCollectionEquality().hash(_otherExpenses));

@override
String toString() {
  return 'ExpenseResponse(id: $id, fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, otherExpensesTotal: $otherExpensesTotal, totalExpense: $totalExpense, expenseDate: $expenseDate, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, otherExpenses: $otherExpenses)';
}


}

/// @nodoc
abstract mixin class _$ExpenseResponseCopyWith<$Res> implements $ExpenseResponseCopyWith<$Res> {
  factory _$ExpenseResponseCopyWith(_ExpenseResponse value, $Res Function(_ExpenseResponse) _then) = __$ExpenseResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, double fuelExpense, double maintenanceExpenses, double employeesExpenses, double otherExpensesTotal, double totalExpense,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime expenseDate, String? notes, DateTime createdAt, DateTime updatedAt, List<OtherExpenseResponse> otherExpenses
});




}
/// @nodoc
class __$ExpenseResponseCopyWithImpl<$Res>
    implements _$ExpenseResponseCopyWith<$Res> {
  __$ExpenseResponseCopyWithImpl(this._self, this._then);

  final _ExpenseResponse _self;
  final $Res Function(_ExpenseResponse) _then;

/// Create a copy of ExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fuelExpense = null,Object? maintenanceExpenses = null,Object? employeesExpenses = null,Object? otherExpensesTotal = null,Object? totalExpense = null,Object? expenseDate = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? otherExpenses = null,}) {
  return _then(_ExpenseResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double,maintenanceExpenses: null == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double,employeesExpenses: null == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double,otherExpensesTotal: null == otherExpensesTotal ? _self.otherExpensesTotal : otherExpensesTotal // ignore: cast_nullable_to_non_nullable
as double,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,otherExpenses: null == otherExpenses ? _self._otherExpenses : otherExpenses // ignore: cast_nullable_to_non_nullable
as List<OtherExpenseResponse>,
  ));
}


}

// dart format on
