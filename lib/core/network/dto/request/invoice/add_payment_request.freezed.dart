// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddPaymentRequest {

 double get amount; String get paymentMethod; String? get notes;
/// Create a copy of AddPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPaymentRequestCopyWith<AddPaymentRequest> get copyWith => _$AddPaymentRequestCopyWithImpl<AddPaymentRequest>(this as AddPaymentRequest, _$identity);

  /// Serializes this AddPaymentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPaymentRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,paymentMethod,notes);

@override
String toString() {
  return 'AddPaymentRequest(amount: $amount, paymentMethod: $paymentMethod, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $AddPaymentRequestCopyWith<$Res>  {
  factory $AddPaymentRequestCopyWith(AddPaymentRequest value, $Res Function(AddPaymentRequest) _then) = _$AddPaymentRequestCopyWithImpl;
@useResult
$Res call({
 double amount, String paymentMethod, String? notes
});




}
/// @nodoc
class _$AddPaymentRequestCopyWithImpl<$Res>
    implements $AddPaymentRequestCopyWith<$Res> {
  _$AddPaymentRequestCopyWithImpl(this._self, this._then);

  final AddPaymentRequest _self;
  final $Res Function(AddPaymentRequest) _then;

/// Create a copy of AddPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? paymentMethod = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddPaymentRequest].
extension AddPaymentRequestPatterns on AddPaymentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddPaymentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddPaymentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddPaymentRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddPaymentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddPaymentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddPaymentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String paymentMethod,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddPaymentRequest() when $default != null:
return $default(_that.amount,_that.paymentMethod,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String paymentMethod,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _AddPaymentRequest():
return $default(_that.amount,_that.paymentMethod,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String paymentMethod,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _AddPaymentRequest() when $default != null:
return $default(_that.amount,_that.paymentMethod,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddPaymentRequest implements AddPaymentRequest {
  const _AddPaymentRequest({required this.amount, required this.paymentMethod, this.notes});
  factory _AddPaymentRequest.fromJson(Map<String, dynamic> json) => _$AddPaymentRequestFromJson(json);

@override final  double amount;
@override final  String paymentMethod;
@override final  String? notes;

/// Create a copy of AddPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddPaymentRequestCopyWith<_AddPaymentRequest> get copyWith => __$AddPaymentRequestCopyWithImpl<_AddPaymentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddPaymentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddPaymentRequest&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,paymentMethod,notes);

@override
String toString() {
  return 'AddPaymentRequest(amount: $amount, paymentMethod: $paymentMethod, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$AddPaymentRequestCopyWith<$Res> implements $AddPaymentRequestCopyWith<$Res> {
  factory _$AddPaymentRequestCopyWith(_AddPaymentRequest value, $Res Function(_AddPaymentRequest) _then) = __$AddPaymentRequestCopyWithImpl;
@override @useResult
$Res call({
 double amount, String paymentMethod, String? notes
});




}
/// @nodoc
class __$AddPaymentRequestCopyWithImpl<$Res>
    implements _$AddPaymentRequestCopyWith<$Res> {
  __$AddPaymentRequestCopyWithImpl(this._self, this._then);

  final _AddPaymentRequest _self;
  final $Res Function(_AddPaymentRequest) _then;

/// Create a copy of AddPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? paymentMethod = null,Object? notes = freezed,}) {
  return _then(_AddPaymentRequest(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
