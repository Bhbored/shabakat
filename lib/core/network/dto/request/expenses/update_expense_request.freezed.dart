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

 String? get expenseType; double? get amount;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get expenseDate; String? get label; String? get notes;
/// Create a copy of UpdateExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateExpenseRequestCopyWith<UpdateExpenseRequest> get copyWith => _$UpdateExpenseRequestCopyWithImpl<UpdateExpenseRequest>(this as UpdateExpenseRequest, _$identity);

  /// Serializes this UpdateExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateExpenseRequest&&(identical(other.expenseType, expenseType) || other.expenseType == expenseType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,expenseType,amount,expenseDate,label,notes);

@override
String toString() {
  return 'UpdateExpenseRequest(expenseType: $expenseType, amount: $amount, expenseDate: $expenseDate, label: $label, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $UpdateExpenseRequestCopyWith<$Res>  {
  factory $UpdateExpenseRequestCopyWith(UpdateExpenseRequest value, $Res Function(UpdateExpenseRequest) _then) = _$UpdateExpenseRequestCopyWithImpl;
@useResult
$Res call({
 String? expenseType, double? amount,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? expenseDate, String? label, String? notes
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
@pragma('vm:prefer-inline') @override $Res call({Object? expenseType = freezed,Object? amount = freezed,Object? expenseDate = freezed,Object? label = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
expenseType: freezed == expenseType ? _self.expenseType : expenseType // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? expenseType,  double? amount, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? label,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateExpenseRequest() when $default != null:
return $default(_that.expenseType,_that.amount,_that.expenseDate,_that.label,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? expenseType,  double? amount, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? label,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _UpdateExpenseRequest():
return $default(_that.expenseType,_that.amount,_that.expenseDate,_that.label,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? expenseType,  double? amount, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? expenseDate,  String? label,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _UpdateExpenseRequest() when $default != null:
return $default(_that.expenseType,_that.amount,_that.expenseDate,_that.label,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateExpenseRequest implements UpdateExpenseRequest {
  const _UpdateExpenseRequest({this.expenseType, this.amount, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.expenseDate, this.label, this.notes});
  factory _UpdateExpenseRequest.fromJson(Map<String, dynamic> json) => _$UpdateExpenseRequestFromJson(json);

@override final  String? expenseType;
@override final  double? amount;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? expenseDate;
@override final  String? label;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateExpenseRequest&&(identical(other.expenseType, expenseType) || other.expenseType == expenseType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.label, label) || other.label == label)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,expenseType,amount,expenseDate,label,notes);

@override
String toString() {
  return 'UpdateExpenseRequest(expenseType: $expenseType, amount: $amount, expenseDate: $expenseDate, label: $label, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$UpdateExpenseRequestCopyWith<$Res> implements $UpdateExpenseRequestCopyWith<$Res> {
  factory _$UpdateExpenseRequestCopyWith(_UpdateExpenseRequest value, $Res Function(_UpdateExpenseRequest) _then) = __$UpdateExpenseRequestCopyWithImpl;
@override @useResult
$Res call({
 String? expenseType, double? amount,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? expenseDate, String? label, String? notes
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
@override @pragma('vm:prefer-inline') $Res call({Object? expenseType = freezed,Object? amount = freezed,Object? expenseDate = freezed,Object? label = freezed,Object? notes = freezed,}) {
  return _then(_UpdateExpenseRequest(
expenseType: freezed == expenseType ? _self.expenseType : expenseType // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,expenseDate: freezed == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
