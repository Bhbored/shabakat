// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_expenses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtherExpenses {

 String get id; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt; bool get isDeleted; String get companyId; String get expenseId; double get amount; String get type; String? get description;
/// Create a copy of OtherExpenses
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherExpensesCopyWith<OtherExpenses> get copyWith => _$OtherExpensesCopyWithImpl<OtherExpenses>(this as OtherExpenses, _$identity);

  /// Serializes this OtherExpenses to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherExpenses&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,isDeleted,companyId,expenseId,amount,type,description);

@override
String toString() {
  return 'OtherExpenses(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isDeleted: $isDeleted, companyId: $companyId, expenseId: $expenseId, amount: $amount, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class $OtherExpensesCopyWith<$Res>  {
  factory $OtherExpensesCopyWith(OtherExpenses value, $Res Function(OtherExpenses) _then) = _$OtherExpensesCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, bool isDeleted, String companyId, String expenseId, double amount, String type, String? description
});




}
/// @nodoc
class _$OtherExpensesCopyWithImpl<$Res>
    implements $OtherExpensesCopyWith<$Res> {
  _$OtherExpensesCopyWithImpl(this._self, this._then);

  final OtherExpenses _self;
  final $Res Function(OtherExpenses) _then;

/// Create a copy of OtherExpenses
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? isDeleted = null,Object? companyId = null,Object? expenseId = null,Object? amount = null,Object? type = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OtherExpenses].
extension OtherExpensesPatterns on OtherExpenses {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtherExpenses value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtherExpenses() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtherExpenses value)  $default,){
final _that = this;
switch (_that) {
case _OtherExpenses():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtherExpenses value)?  $default,){
final _that = this;
switch (_that) {
case _OtherExpenses() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String expenseId,  double amount,  String type,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtherExpenses() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.expenseId,_that.amount,_that.type,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String expenseId,  double amount,  String type,  String? description)  $default,) {final _that = this;
switch (_that) {
case _OtherExpenses():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.expenseId,_that.amount,_that.type,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  bool isDeleted,  String companyId,  String expenseId,  double amount,  String type,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _OtherExpenses() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isDeleted,_that.companyId,_that.expenseId,_that.amount,_that.type,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtherExpenses implements OtherExpenses {
  const _OtherExpenses({required this.id, required this.createdAt, required this.updatedAt, this.deletedAt, this.isDeleted = false, required this.companyId, required this.expenseId, required this.amount, required this.type, this.description});
  factory _OtherExpenses.fromJson(Map<String, dynamic> json) => _$OtherExpensesFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;
@override@JsonKey() final  bool isDeleted;
@override final  String companyId;
@override final  String expenseId;
@override final  double amount;
@override final  String type;
@override final  String? description;

/// Create a copy of OtherExpenses
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtherExpensesCopyWith<_OtherExpenses> get copyWith => __$OtherExpensesCopyWithImpl<_OtherExpenses>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtherExpensesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtherExpenses&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,isDeleted,companyId,expenseId,amount,type,description);

@override
String toString() {
  return 'OtherExpenses(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isDeleted: $isDeleted, companyId: $companyId, expenseId: $expenseId, amount: $amount, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class _$OtherExpensesCopyWith<$Res> implements $OtherExpensesCopyWith<$Res> {
  factory _$OtherExpensesCopyWith(_OtherExpenses value, $Res Function(_OtherExpenses) _then) = __$OtherExpensesCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, bool isDeleted, String companyId, String expenseId, double amount, String type, String? description
});




}
/// @nodoc
class __$OtherExpensesCopyWithImpl<$Res>
    implements _$OtherExpensesCopyWith<$Res> {
  __$OtherExpensesCopyWithImpl(this._self, this._then);

  final _OtherExpenses _self;
  final $Res Function(_OtherExpenses) _then;

/// Create a copy of OtherExpenses
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? isDeleted = null,Object? companyId = null,Object? expenseId = null,Object? amount = null,Object? type = null,Object? description = freezed,}) {
  return _then(_OtherExpenses(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
