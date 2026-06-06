// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_expense_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateExpenseRequest {

 double get fuelExpense; double get maintenanceExpenses; double get employeesExpenses;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get expenseDate; String? get notes;
/// Create a copy of CreateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateExpenseRequestCopyWith<CreateExpenseRequest> get copyWith => _$CreateExpenseRequestCopyWithImpl<CreateExpenseRequest>(this as CreateExpenseRequest, _$identity);

  /// Serializes this CreateExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateExpenseRequest&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fuelExpense,maintenanceExpenses,employeesExpenses,expenseDate,notes);

@override
String toString() {
  return 'CreateExpenseRequest(fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, expenseDate: $expenseDate, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateExpenseRequestCopyWith<$Res>  {
  factory $CreateExpenseRequestCopyWith(CreateExpenseRequest value, $Res Function(CreateExpenseRequest) _then) = _$CreateExpenseRequestCopyWithImpl;
@useResult
$Res call({
 double fuelExpense, double maintenanceExpenses, double employeesExpenses,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? expenseDate, String? notes
});




}
/// @nodoc
class _$CreateExpenseRequestCopyWithImpl<$Res>
    implements $CreateExpenseRequestCopyWith<$Res> {
  _$CreateExpenseRequestCopyWithImpl(this._self, this._then);

  final CreateExpenseRequest _self;
  final $Res Function(CreateExpenseRequest) _then;

/// Create a copy of CreateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fuelExpense = null,Object? maintenanceExpenses = null,Object? employeesExpenses = null,Object? expenseDate = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double,maintenanceExpenses: null == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double,employeesExpenses: null == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateExpenseRequest].
extension CreateExpenseRequestPatterns on CreateExpenseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateExpenseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateExpenseRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateExpenseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateExpenseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double fuelExpense,  double maintenanceExpenses,  double employeesExpenses, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateExpenseRequest() when $default != null:
return $default(_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.expenseDate,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double fuelExpense,  double maintenanceExpenses,  double employeesExpenses, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CreateExpenseRequest():
return $default(_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.expenseDate,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double fuelExpense,  double maintenanceExpenses,  double employeesExpenses, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CreateExpenseRequest() when $default != null:
return $default(_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.expenseDate,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateExpenseRequest implements CreateExpenseRequest {
  const _CreateExpenseRequest({required this.fuelExpense, required this.maintenanceExpenses, required this.employeesExpenses, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.expenseDate, this.notes});
  factory _CreateExpenseRequest.fromJson(Map<String, dynamic> json) => _$CreateExpenseRequestFromJson(json);

@override final  double fuelExpense;
@override final  double maintenanceExpenses;
@override final  double employeesExpenses;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? expenseDate;
@override final  String? notes;

/// Create a copy of CreateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateExpenseRequestCopyWith<_CreateExpenseRequest> get copyWith => __$CreateExpenseRequestCopyWithImpl<_CreateExpenseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateExpenseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateExpenseRequest&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fuelExpense,maintenanceExpenses,employeesExpenses,expenseDate,notes);

@override
String toString() {
  return 'CreateExpenseRequest(fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, expenseDate: $expenseDate, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateExpenseRequestCopyWith<$Res> implements $CreateExpenseRequestCopyWith<$Res> {
  factory _$CreateExpenseRequestCopyWith(_CreateExpenseRequest value, $Res Function(_CreateExpenseRequest) _then) = __$CreateExpenseRequestCopyWithImpl;
@override @useResult
$Res call({
 double fuelExpense, double maintenanceExpenses, double employeesExpenses,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? expenseDate, String? notes
});




}
/// @nodoc
class __$CreateExpenseRequestCopyWithImpl<$Res>
    implements _$CreateExpenseRequestCopyWith<$Res> {
  __$CreateExpenseRequestCopyWithImpl(this._self, this._then);

  final _CreateExpenseRequest _self;
  final $Res Function(_CreateExpenseRequest) _then;

/// Create a copy of CreateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fuelExpense = null,Object? maintenanceExpenses = null,Object? employeesExpenses = null,Object? expenseDate = freezed,Object? notes = freezed,}) {
  return _then(_CreateExpenseRequest(
fuelExpense: null == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double,maintenanceExpenses: null == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double,employeesExpenses: null == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
