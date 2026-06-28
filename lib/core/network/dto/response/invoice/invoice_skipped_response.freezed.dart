// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_skipped_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceSkippedResponse {

 String get customerId; String get customerName; String get reason; DateTime get skippedAt;
/// Create a copy of InvoiceSkippedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceSkippedResponseCopyWith<InvoiceSkippedResponse> get copyWith => _$InvoiceSkippedResponseCopyWithImpl<InvoiceSkippedResponse>(this as InvoiceSkippedResponse, _$identity);

  /// Serializes this InvoiceSkippedResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceSkippedResponse&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.skippedAt, skippedAt) || other.skippedAt == skippedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,customerName,reason,skippedAt);

@override
String toString() {
  return 'InvoiceSkippedResponse(customerId: $customerId, customerName: $customerName, reason: $reason, skippedAt: $skippedAt)';
}


}

/// @nodoc
abstract mixin class $InvoiceSkippedResponseCopyWith<$Res>  {
  factory $InvoiceSkippedResponseCopyWith(InvoiceSkippedResponse value, $Res Function(InvoiceSkippedResponse) _then) = _$InvoiceSkippedResponseCopyWithImpl;
@useResult
$Res call({
 String customerId, String customerName, String reason, DateTime skippedAt
});




}
/// @nodoc
class _$InvoiceSkippedResponseCopyWithImpl<$Res>
    implements $InvoiceSkippedResponseCopyWith<$Res> {
  _$InvoiceSkippedResponseCopyWithImpl(this._self, this._then);

  final InvoiceSkippedResponse _self;
  final $Res Function(InvoiceSkippedResponse) _then;

/// Create a copy of InvoiceSkippedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = null,Object? customerName = null,Object? reason = null,Object? skippedAt = null,}) {
  return _then(_self.copyWith(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,skippedAt: null == skippedAt ? _self.skippedAt : skippedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceSkippedResponse].
extension InvoiceSkippedResponsePatterns on InvoiceSkippedResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceSkippedResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceSkippedResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceSkippedResponse value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceSkippedResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceSkippedResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceSkippedResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String customerId,  String customerName,  String reason,  DateTime skippedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceSkippedResponse() when $default != null:
return $default(_that.customerId,_that.customerName,_that.reason,_that.skippedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String customerId,  String customerName,  String reason,  DateTime skippedAt)  $default,) {final _that = this;
switch (_that) {
case _InvoiceSkippedResponse():
return $default(_that.customerId,_that.customerName,_that.reason,_that.skippedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String customerId,  String customerName,  String reason,  DateTime skippedAt)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceSkippedResponse() when $default != null:
return $default(_that.customerId,_that.customerName,_that.reason,_that.skippedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceSkippedResponse implements InvoiceSkippedResponse {
  const _InvoiceSkippedResponse({required this.customerId, required this.customerName, required this.reason, required this.skippedAt});
  factory _InvoiceSkippedResponse.fromJson(Map<String, dynamic> json) => _$InvoiceSkippedResponseFromJson(json);

@override final  String customerId;
@override final  String customerName;
@override final  String reason;
@override final  DateTime skippedAt;

/// Create a copy of InvoiceSkippedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceSkippedResponseCopyWith<_InvoiceSkippedResponse> get copyWith => __$InvoiceSkippedResponseCopyWithImpl<_InvoiceSkippedResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceSkippedResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceSkippedResponse&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.skippedAt, skippedAt) || other.skippedAt == skippedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,customerName,reason,skippedAt);

@override
String toString() {
  return 'InvoiceSkippedResponse(customerId: $customerId, customerName: $customerName, reason: $reason, skippedAt: $skippedAt)';
}


}

/// @nodoc
abstract mixin class _$InvoiceSkippedResponseCopyWith<$Res> implements $InvoiceSkippedResponseCopyWith<$Res> {
  factory _$InvoiceSkippedResponseCopyWith(_InvoiceSkippedResponse value, $Res Function(_InvoiceSkippedResponse) _then) = __$InvoiceSkippedResponseCopyWithImpl;
@override @useResult
$Res call({
 String customerId, String customerName, String reason, DateTime skippedAt
});




}
/// @nodoc
class __$InvoiceSkippedResponseCopyWithImpl<$Res>
    implements _$InvoiceSkippedResponseCopyWith<$Res> {
  __$InvoiceSkippedResponseCopyWithImpl(this._self, this._then);

  final _InvoiceSkippedResponse _self;
  final $Res Function(_InvoiceSkippedResponse) _then;

/// Create a copy of InvoiceSkippedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = null,Object? customerName = null,Object? reason = null,Object? skippedAt = null,}) {
  return _then(_InvoiceSkippedResponse(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,skippedAt: null == skippedAt ? _self.skippedAt : skippedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
