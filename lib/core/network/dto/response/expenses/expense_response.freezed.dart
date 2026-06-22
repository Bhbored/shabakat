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

 String get id; String get expenseType; double get amount;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get expenseDate; String? get label; String? get notes; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseResponseCopyWith<ExpenseResponse> get copyWith => _$ExpenseResponseCopyWithImpl<ExpenseResponse>(this as ExpenseResponse, _$identity);

  /// Serializes this ExpenseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseType, expenseType) || other.expenseType == expenseType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseType,amount,expenseDate,label,notes,createdAt,updatedAt);

@override
String toString() {
  return 'ExpenseResponse(id: $id, expenseType: $expenseType, amount: $amount, expenseDate: $expenseDate, label: $label, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ExpenseResponseCopyWith<$Res>  {
  factory $ExpenseResponseCopyWith(ExpenseResponse value, $Res Function(ExpenseResponse) _then) = _$ExpenseResponseCopyWithImpl;
@useResult
$Res call({
 String id, String expenseType, double amount,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime expenseDate, String? label, String? notes, DateTime createdAt, DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expenseType = null,Object? amount = null,Object? expenseDate = null,Object? label = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseType: null == expenseType ? _self.expenseType : expenseType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String expenseType,  double amount, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? label,  String? notes,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseResponse() when $default != null:
return $default(_that.id,_that.expenseType,_that.amount,_that.expenseDate,_that.label,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String expenseType,  double amount, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? label,  String? notes,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ExpenseResponse():
return $default(_that.id,_that.expenseType,_that.amount,_that.expenseDate,_that.label,_that.notes,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String expenseType,  double amount, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime expenseDate,  String? label,  String? notes,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseResponse() when $default != null:
return $default(_that.id,_that.expenseType,_that.amount,_that.expenseDate,_that.label,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseResponse implements ExpenseResponse {
  const _ExpenseResponse({required this.id, required this.expenseType, required this.amount, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.expenseDate, this.label, this.notes, required this.createdAt, required this.updatedAt});
  factory _ExpenseResponse.fromJson(Map<String, dynamic> json) => _$ExpenseResponseFromJson(json);

@override final  String id;
@override final  String expenseType;
@override final  double amount;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime expenseDate;
@override final  String? label;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseType, expenseType) || other.expenseType == expenseType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseType,amount,expenseDate,label,notes,createdAt,updatedAt);

@override
String toString() {
  return 'ExpenseResponse(id: $id, expenseType: $expenseType, amount: $amount, expenseDate: $expenseDate, label: $label, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ExpenseResponseCopyWith<$Res> implements $ExpenseResponseCopyWith<$Res> {
  factory _$ExpenseResponseCopyWith(_ExpenseResponse value, $Res Function(_ExpenseResponse) _then) = __$ExpenseResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String expenseType, double amount,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime expenseDate, String? label, String? notes, DateTime createdAt, DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseType = null,Object? amount = null,Object? expenseDate = null,Object? label = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ExpenseResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseType: null == expenseType ? _self.expenseType : expenseType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
