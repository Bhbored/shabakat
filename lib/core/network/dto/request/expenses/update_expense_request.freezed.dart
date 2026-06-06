// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_expense_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateExpenseRequest {

 double? get fuelExpense; double? get maintenanceExpenses; double? get employeesExpenses;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get expenseDate; String? get notes;
/// Create a copy of UpdateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateExpenseRequestCopyWith<UpdateExpenseRequest> get copyWith => _$UpdateExpenseRequestCopyWithImpl<UpdateExpenseRequest>(this as UpdateExpenseRequest, _$identity);

  /// Serializes this UpdateExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateExpenseRequest&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fuelExpense,maintenanceExpenses,employeesExpenses,expenseDate,notes);

@override
String toString() {
  return 'UpdateExpenseRequest(fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, expenseDate: $expenseDate, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $UpdateExpenseRequestCopyWith<$Res>  {
  factory $UpdateExpenseRequestCopyWith(UpdateExpenseRequest value, $Res Function(UpdateExpenseRequest) _then) = _$UpdateExpenseRequestCopyWithImpl;
@useResult
$Res call({
 double? fuelExpense, double? maintenanceExpenses, double? employeesExpenses,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? expenseDate, String? notes
});




}
/// @nodoc
class _$UpdateExpenseRequestCopyWithImpl<$Res>
    implements $UpdateExpenseRequestCopyWith<$Res> {
  _$UpdateExpenseRequestCopyWithImpl(this._self, this._then);

  final UpdateExpenseRequest _self;
  final $Res Function(UpdateExpenseRequest) _then;

/// Create a copy of UpdateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fuelExpense = freezed,Object? maintenanceExpenses = freezed,Object? employeesExpenses = freezed,Object? expenseDate = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
fuelExpense: freezed == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double?,maintenanceExpenses: freezed == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double?,employeesExpenses: freezed == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double?,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateExpenseRequest].
extension UpdateExpenseRequestPatterns on UpdateExpenseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateExpenseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateExpenseRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateExpenseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateExpenseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? fuelExpense,  double? maintenanceExpenses,  double? employeesExpenses, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? fuelExpense,  double? maintenanceExpenses,  double? employeesExpenses, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _UpdateExpenseRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? fuelExpense,  double? maintenanceExpenses,  double? employeesExpenses, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _UpdateExpenseRequest() when $default != null:
return $default(_that.fuelExpense,_that.maintenanceExpenses,_that.employeesExpenses,_that.expenseDate,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateExpenseRequest implements UpdateExpenseRequest {
  const _UpdateExpenseRequest({this.fuelExpense, this.maintenanceExpenses, this.employeesExpenses, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.expenseDate, this.notes});
  factory _UpdateExpenseRequest.fromJson(Map<String, dynamic> json) => _$UpdateExpenseRequestFromJson(json);

@override final  double? fuelExpense;
@override final  double? maintenanceExpenses;
@override final  double? employeesExpenses;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? expenseDate;
@override final  String? notes;

/// Create a copy of UpdateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateExpenseRequestCopyWith<_UpdateExpenseRequest> get copyWith => __$UpdateExpenseRequestCopyWithImpl<_UpdateExpenseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateExpenseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateExpenseRequest&&(identical(other.fuelExpense, fuelExpense) || other.fuelExpense == fuelExpense)&&(identical(other.maintenanceExpenses, maintenanceExpenses) || other.maintenanceExpenses == maintenanceExpenses)&&(identical(other.employeesExpenses, employeesExpenses) || other.employeesExpenses == employeesExpenses)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fuelExpense,maintenanceExpenses,employeesExpenses,expenseDate,notes);

@override
String toString() {
  return 'UpdateExpenseRequest(fuelExpense: $fuelExpense, maintenanceExpenses: $maintenanceExpenses, employeesExpenses: $employeesExpenses, expenseDate: $expenseDate, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$UpdateExpenseRequestCopyWith<$Res> implements $UpdateExpenseRequestCopyWith<$Res> {
  factory _$UpdateExpenseRequestCopyWith(_UpdateExpenseRequest value, $Res Function(_UpdateExpenseRequest) _then) = __$UpdateExpenseRequestCopyWithImpl;
@override @useResult
$Res call({
 double? fuelExpense, double? maintenanceExpenses, double? employeesExpenses,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? expenseDate, String? notes
});




}
/// @nodoc
class __$UpdateExpenseRequestCopyWithImpl<$Res>
    implements _$UpdateExpenseRequestCopyWith<$Res> {
  __$UpdateExpenseRequestCopyWithImpl(this._self, this._then);

  final _UpdateExpenseRequest _self;
  final $Res Function(_UpdateExpenseRequest) _then;

/// Create a copy of UpdateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fuelExpense = freezed,Object? maintenanceExpenses = freezed,Object? employeesExpenses = freezed,Object? expenseDate = freezed,Object? notes = freezed,}) {
  return _then(_UpdateExpenseRequest(
fuelExpense: freezed == fuelExpense ? _self.fuelExpense : fuelExpense // ignore: cast_nullable_to_non_nullable
as double?,maintenanceExpenses: freezed == maintenanceExpenses ? _self.maintenanceExpenses : maintenanceExpenses // ignore: cast_nullable_to_non_nullable
as double?,employeesExpenses: freezed == employeesExpenses ? _self.employeesExpenses : employeesExpenses // ignore: cast_nullable_to_non_nullable
as double?,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
