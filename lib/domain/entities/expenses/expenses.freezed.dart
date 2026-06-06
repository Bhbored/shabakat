// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Expenses {

 String get id; DateTime get createdAt; DateTime get updatedAt; String get companyId; double get fuelExpense; double get maintenanceExpenses; double get employeesExpenses; DateTime get expenseDate; String? get notes; List<OtherExpenses>? get otherExpenses;
/// Create a copy of Expenses
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesCopyWith<Expenses> get copyWith => _$ExpensesCopyWithImpl<Expenses>(this as Expenses, _$identity);

  /// Serializes this Expenses to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expenses&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.otherExpenses, otherExpenses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,companyId,fuelExpense,maintenanceExpenses,employeesExpenses,expenseDate,notes,const DeepCollectionEquality().hash(otherExpenses));

@override
String toString() {
  return 'Expenses(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, companyId: $companyId, fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, expenseDate: $expenseDate, notes: $notes, otherExpenses: $otherExpenses)';
}


}

/// @nodoc
abstract mixin class $ExpensesCopyWith<$Res>  {
  factory $ExpensesCopyWith(Expenses value, $Res Function(Expenses) _then) = _$ExpensesCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, String companyId, double fuelExpense, double maintenanceExpenses, double employeesExpenses, DateTime expenseDate, String? notes, List<OtherExpenses>? otherExpenses
});




}
/// @nodoc
class _$ExpensesCopyWithImpl<$Res>
    implements $ExpensesCopyWith<$Res> {
  _$ExpensesCopyWithImpl(this._self, this._then);

  final Expenses _self;
  final $Res Function(Expenses) _then;

/// Create a copy of Expenses
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? companyId = null,Object? fuelExpense = null,Object? maintenanceExpenses = null,Object? employeesExpenses = null,Object? expenseDate = null,Object? notes = freezed,Object? otherExpenses = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double,maintenanceExpenses: null == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double,employeesExpenses: null == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,otherExpenses: freezed == otherExpenses ? _self.otherExpenses : otherExpenses // ignore: cast_nullable_to_non_nullable
as List<OtherExpenses>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Expenses].
extension ExpensesPatterns on Expenses {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Expenses value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Expenses() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Expenses value)  $default,){
final _that = this;
switch (_that) {
case _Expenses():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Expenses value)?  $default,){
final _that = this;
switch (_that) {
case _Expenses() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  DateTime expenseDate,  String? notes,  List<OtherExpenses>? otherExpenses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Expenses() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.expenseDate,_that.notes,_that.otherExpenses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  DateTime expenseDate,  String? notes,  List<OtherExpenses>? otherExpenses)  $default,) {final _that = this;
switch (_that) {
case _Expenses():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.expenseDate,_that.notes,_that.otherExpenses);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  double fuelExpense,  double maintenanceExpenses,  double employeesExpenses,  DateTime expenseDate,  String? notes,  List<OtherExpenses>? otherExpenses)?  $default,) {final _that = this;
switch (_that) {
case _Expenses() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.expenseDate,_that.notes,_that.otherExpenses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Expenses implements Expenses {
  const _Expenses({required this.id, required this.createdAt, required this.updatedAt, required this.companyId, required this.fuelExpense, required this.maintenanceExpenses, required this.employeesExpenses, required this.expenseDate, this.notes, final  List<OtherExpenses>? otherExpenses}): _otherExpenses = otherExpenses;
  factory _Expenses.fromJson(Map<String, dynamic> json) => _$ExpensesFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String companyId;
@override final  double fuelExpense;
@override final  double maintenanceExpenses;
@override final  double employeesExpenses;
@override final  DateTime expenseDate;
@override final  String? notes;
 final  List<OtherExpenses>? _otherExpenses;
@override List<OtherExpenses>? get otherExpenses {
  final value = _otherExpenses;
  if (value == null) return null;
  if (_otherExpenses is EqualUnmodifiableListView) return _otherExpenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Expenses
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensesCopyWith<_Expenses> get copyWith => __$ExpensesCopyWithImpl<_Expenses>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpensesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Expenses&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._otherExpenses, _otherExpenses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,companyId,fuelExpense,maintenanceExpenses,employeesExpenses,expenseDate,notes,const DeepCollectionEquality().hash(_otherExpenses));

@override
String toString() {
  return 'Expenses(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, companyId: $companyId, fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, expenseDate: $expenseDate, notes: $notes, otherExpenses: $otherExpenses)';
}


}

/// @nodoc
abstract mixin class _$ExpensesCopyWith<$Res> implements $ExpensesCopyWith<$Res> {
  factory _$ExpensesCopyWith(_Expenses value, $Res Function(_Expenses) _then) = __$ExpensesCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, String companyId, double fuelExpense, double maintenanceExpenses, double employeesExpenses, DateTime expenseDate, String? notes, List<OtherExpenses>? otherExpenses
});




}
/// @nodoc
class __$ExpensesCopyWithImpl<$Res>
    implements _$ExpensesCopyWith<$Res> {
  __$ExpensesCopyWithImpl(this._self, this._then);

  final _Expenses _self;
  final $Res Function(_Expenses) _then;

/// Create a copy of Expenses
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? companyId = null,Object? fuelExpense = null,Object? maintenanceExpenses = null,Object? employeesExpenses = null,Object? expenseDate = null,Object? notes = freezed,Object? otherExpenses = freezed,}) {
  return _then(_Expenses(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double,maintenanceExpenses: null == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double,employeesExpenses: null == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,otherExpenses: freezed == otherExpenses ? _self._otherExpenses : otherExpenses // ignore: cast_nullable_to_non_nullable
as List<OtherExpenses>?,
  ));
}


}

// dart format on
