// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_expense_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtherExpenseResponse {

 String get id; String get expenseId; double get amount; String get type; String? get description; DateTime get createdAt;
/// Create a copy of OtherExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherExpenseResponseCopyWith<OtherExpenseResponse> get copyWith => _$OtherExpenseResponseCopyWithImpl<OtherExpenseResponse>(this as OtherExpenseResponse, _$identity);

  /// Serializes this OtherExpenseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherExpenseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseId,amount,type,description,createdAt);

@override
String toString() {
  return 'OtherExpenseResponse(id: $id, expenseId: $expenseId, amount: $amount, type: $type, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OtherExpenseResponseCopyWith<$Res>  {
  factory $OtherExpenseResponseCopyWith(OtherExpenseResponse value, $Res Function(OtherExpenseResponse) _then) = _$OtherExpenseResponseCopyWithImpl;
@useResult
$Res call({
 String id, String expenseId, double amount, String type, String? description, DateTime createdAt
});




}
/// @nodoc
class _$OtherExpenseResponseCopyWithImpl<$Res>
    implements $OtherExpenseResponseCopyWith<$Res> {
  _$OtherExpenseResponseCopyWithImpl(this._self, this._then);

  final OtherExpenseResponse _self;
  final $Res Function(OtherExpenseResponse) _then;

/// Create a copy of OtherExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? expenseId = null,Object? amount = null,Object? type = null,Object? description = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OtherExpenseResponse].
extension OtherExpenseResponsePatterns on OtherExpenseResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtherExpenseResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtherExpenseResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtherExpenseResponse value)  $default,){
final _that = this;
switch (_that) {
case _OtherExpenseResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtherExpenseResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OtherExpenseResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String expenseId,  double amount,  String type,  String? description,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtherExpenseResponse() when $default != null:
return $default(_that.id,_that.expenseId,_that.amount,_that.type,_that.description,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String expenseId,  double amount,  String type,  String? description,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _OtherExpenseResponse():
return $default(_that.id,_that.expenseId,_that.amount,_that.type,_that.description,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String expenseId,  double amount,  String type,  String? description,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _OtherExpenseResponse() when $default != null:
return $default(_that.id,_that.expenseId,_that.amount,_that.type,_that.description,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtherExpenseResponse implements OtherExpenseResponse {
  const _OtherExpenseResponse({required this.id, required this.expenseId, required this.amount, required this.type, this.description, required this.createdAt});
  factory _OtherExpenseResponse.fromJson(Map<String, dynamic> json) => _$OtherExpenseResponseFromJson(json);

@override final  String id;
@override final  String expenseId;
@override final  double amount;
@override final  String type;
@override final  String? description;
@override final  DateTime createdAt;

/// Create a copy of OtherExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtherExpenseResponseCopyWith<_OtherExpenseResponse> get copyWith => __$OtherExpenseResponseCopyWithImpl<_OtherExpenseResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtherExpenseResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtherExpenseResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.expenseId, expenseId) || other.expenseId == expenseId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,expenseId,amount,type,description,createdAt);

@override
String toString() {
  return 'OtherExpenseResponse(id: $id, expenseId: $expenseId, amount: $amount, type: $type, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OtherExpenseResponseCopyWith<$Res> implements $OtherExpenseResponseCopyWith<$Res> {
  factory _$OtherExpenseResponseCopyWith(_OtherExpenseResponse value, $Res Function(_OtherExpenseResponse) _then) = __$OtherExpenseResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String expenseId, double amount, String type, String? description, DateTime createdAt
});




}
/// @nodoc
class __$OtherExpenseResponseCopyWithImpl<$Res>
    implements _$OtherExpenseResponseCopyWith<$Res> {
  __$OtherExpenseResponseCopyWithImpl(this._self, this._then);

  final _OtherExpenseResponse _self;
  final $Res Function(_OtherExpenseResponse) _then;

/// Create a copy of OtherExpenseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? expenseId = null,Object? amount = null,Object? type = null,Object? description = freezed,Object? createdAt = null,}) {
  return _then(_OtherExpenseResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expenseId: null == expenseId ? _self.expenseId : expenseId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
