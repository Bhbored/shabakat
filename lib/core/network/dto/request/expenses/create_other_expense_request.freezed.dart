// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_other_expense_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateOtherExpenseRequest {

 double get amount; String get type; String? get description;
/// Create a copy of CreateOtherExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOtherExpenseRequestCopyWith<CreateOtherExpenseRequest> get copyWith => _$CreateOtherExpenseRequestCopyWithImpl<CreateOtherExpenseRequest>(this as CreateOtherExpenseRequest, _$identity);

  /// Serializes this CreateOtherExpenseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOtherExpenseRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,type,description);

@override
String toString() {
  return 'CreateOtherExpenseRequest(amount: $amount, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateOtherExpenseRequestCopyWith<$Res>  {
  factory $CreateOtherExpenseRequestCopyWith(CreateOtherExpenseRequest value, $Res Function(CreateOtherExpenseRequest) _then) = _$CreateOtherExpenseRequestCopyWithImpl;
@useResult
$Res call({
 double amount, String type, String? description
});




}
/// @nodoc
class _$CreateOtherExpenseRequestCopyWithImpl<$Res>
    implements $CreateOtherExpenseRequestCopyWith<$Res> {
  _$CreateOtherExpenseRequestCopyWithImpl(this._self, this._then);

  final CreateOtherExpenseRequest _self;
  final $Res Function(CreateOtherExpenseRequest) _then;

/// Create a copy of CreateOtherExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? type = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateOtherExpenseRequest].
extension CreateOtherExpenseRequestPatterns on CreateOtherExpenseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateOtherExpenseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateOtherExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateOtherExpenseRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateOtherExpenseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateOtherExpenseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateOtherExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String type,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateOtherExpenseRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String type,  String? description)  $default,) {final _that = this;
switch (_that) {
case _CreateOtherExpenseRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String type,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _CreateOtherExpenseRequest() when $default != null:
return $default(_that.amount,_that.type,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateOtherExpenseRequest implements CreateOtherExpenseRequest {
  const _CreateOtherExpenseRequest({required this.amount, required this.type, this.description});
  factory _CreateOtherExpenseRequest.fromJson(Map<String, dynamic> json) => _$CreateOtherExpenseRequestFromJson(json);

@override final  double amount;
@override final  String type;
@override final  String? description;

/// Create a copy of CreateOtherExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateOtherExpenseRequestCopyWith<_CreateOtherExpenseRequest> get copyWith => __$CreateOtherExpenseRequestCopyWithImpl<_CreateOtherExpenseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateOtherExpenseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateOtherExpenseRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,type,description);

@override
String toString() {
  return 'CreateOtherExpenseRequest(amount: $amount, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateOtherExpenseRequestCopyWith<$Res> implements $CreateOtherExpenseRequestCopyWith<$Res> {
  factory _$CreateOtherExpenseRequestCopyWith(_CreateOtherExpenseRequest value, $Res Function(_CreateOtherExpenseRequest) _then) = __$CreateOtherExpenseRequestCopyWithImpl;
@override @useResult
$Res call({
 double amount, String type, String? description
});




}
/// @nodoc
class __$CreateOtherExpenseRequestCopyWithImpl<$Res>
    implements _$CreateOtherExpenseRequestCopyWith<$Res> {
  __$CreateOtherExpenseRequestCopyWithImpl(this._self, this._then);

  final _CreateOtherExpenseRequest _self;
  final $Res Function(_CreateOtherExpenseRequest) _then;

/// Create a copy of CreateOtherExpenseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? type = null,Object? description = freezed,}) {
  return _then(_CreateOtherExpenseRequest(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
