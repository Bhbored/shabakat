// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_other_expense_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateOtherExpenseRequest {

 double? get amount; String? get type; String? get description;
/// Create a copy of UpdateOtherExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateOtherExpenseRequestCopyWith<UpdateOtherExpenseRequest> get copyWith => _$UpdateOtherExpenseRequestCopyWithImpl<UpdateOtherExpenseRequest>(this as UpdateOtherExpenseRequest, _$identity);

  /// Serializes this UpdateOtherExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOtherExpenseRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,type,description);

@override
String toString() {
  return 'UpdateOtherExpenseRequest(amount: $amount, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class $UpdateOtherExpenseRequestCopyWith<$Res>  {
  factory $UpdateOtherExpenseRequestCopyWith(UpdateOtherExpenseRequest value, $Res Function(UpdateOtherExpenseRequest) _then) = _$UpdateOtherExpenseRequestCopyWithImpl;
@useResult
$Res call({
 double? amount, String? type, String? description
});




}
/// @nodoc
class _$UpdateOtherExpenseRequestCopyWithImpl<$Res>
    implements $UpdateOtherExpenseRequestCopyWith<$Res> {
  _$UpdateOtherExpenseRequestCopyWithImpl(this._self, this._then);

  final UpdateOtherExpenseRequest _self;
  final $Res Function(UpdateOtherExpenseRequest) _then;

/// Create a copy of UpdateOtherExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = freezed,Object? type = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateOtherExpenseRequest].
extension UpdateOtherExpenseRequestPatterns on UpdateOtherExpenseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateOtherExpenseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateOtherExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateOtherExpenseRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateOtherExpenseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateOtherExpenseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateOtherExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? amount,  String? type,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateOtherExpenseRequest() when $default != null:
return $default(_that.amount,_that.type,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? amount,  String? type,  String? description)  $default,) {final _that = this;
switch (_that) {
case _UpdateOtherExpenseRequest():
return $default(_that.amount,_that.type,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? amount,  String? type,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _UpdateOtherExpenseRequest() when $default != null:
return $default(_that.amount,_that.type,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateOtherExpenseRequest implements UpdateOtherExpenseRequest {
  const _UpdateOtherExpenseRequest({this.amount, this.type, this.description});
  factory _UpdateOtherExpenseRequest.fromJson(Map<String, dynamic> json) => _$UpdateOtherExpenseRequestFromJson(json);

@override final  double? amount;
@override final  String? type;
@override final  String? description;

/// Create a copy of UpdateOtherExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateOtherExpenseRequestCopyWith<_UpdateOtherExpenseRequest> get copyWith => __$UpdateOtherExpenseRequestCopyWithImpl<_UpdateOtherExpenseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateOtherExpenseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateOtherExpenseRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,type,description);

@override
String toString() {
  return 'UpdateOtherExpenseRequest(amount: $amount, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class _$UpdateOtherExpenseRequestCopyWith<$Res> implements $UpdateOtherExpenseRequestCopyWith<$Res> {
  factory _$UpdateOtherExpenseRequestCopyWith(_UpdateOtherExpenseRequest value, $Res Function(_UpdateOtherExpenseRequest) _then) = __$UpdateOtherExpenseRequestCopyWithImpl;
@override @useResult
$Res call({
 double? amount, String? type, String? description
});




}
/// @nodoc
class __$UpdateOtherExpenseRequestCopyWithImpl<$Res>
    implements _$UpdateOtherExpenseRequestCopyWith<$Res> {
  __$UpdateOtherExpenseRequestCopyWithImpl(this._self, this._then);

  final _UpdateOtherExpenseRequest _self;
  final $Res Function(_UpdateOtherExpenseRequest) _then;

/// Create a copy of UpdateOtherExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = freezed,Object? type = freezed,Object? description = freezed,}) {
  return _then(_UpdateOtherExpenseRequest(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
