// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_invoice_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateInvoiceRequest {

@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get consumptionStart;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get consumptionEnd;
/// Create a copy of UpdateInvoiceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateInvoiceRequestCopyWith<UpdateInvoiceRequest> get copyWith => _$UpdateInvoiceRequestCopyWithImpl<UpdateInvoiceRequest>(this as UpdateInvoiceRequest, _$identity);

  /// Serializes this UpdateInvoiceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateInvoiceRequest&&(identical(other.consumptionStart, consumptionStart) || other.consumptionStart == consumptionStart)&&(identical(other.consumptionEnd, consumptionEnd) || other.consumptionEnd == consumptionEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consumptionStart,consumptionEnd);

@override
String toString() {
  return 'UpdateInvoiceRequest(consumptionStart: $consumptionStart, consumptionEnd: $consumptionEnd)';
}


}

/// @nodoc
abstract mixin class $UpdateInvoiceRequestCopyWith<$Res>  {
  factory $UpdateInvoiceRequestCopyWith(UpdateInvoiceRequest value, $Res Function(UpdateInvoiceRequest) _then) = _$UpdateInvoiceRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? consumptionStart,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? consumptionEnd
});




}
/// @nodoc
class _$UpdateInvoiceRequestCopyWithImpl<$Res>
    implements $UpdateInvoiceRequestCopyWith<$Res> {
  _$UpdateInvoiceRequestCopyWithImpl(this._self, this._then);

  final UpdateInvoiceRequest _self;
  final $Res Function(UpdateInvoiceRequest) _then;

/// Create a copy of UpdateInvoiceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consumptionStart = freezed,Object? consumptionEnd = freezed,}) {
  return _then(_self.copyWith(
consumptionStart: freezed == consumptionStart ? _self.consumptionStart : consumptionStart // ignore: cast_nullable_to_non_nullable
as DateTime?,consumptionEnd: freezed == consumptionEnd ? _self.consumptionEnd : consumptionEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateInvoiceRequest].
extension UpdateInvoiceRequestPatterns on UpdateInvoiceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateInvoiceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateInvoiceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateInvoiceRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateInvoiceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateInvoiceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateInvoiceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStart, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateInvoiceRequest() when $default != null:
return $default(_that.consumptionStart,_that.consumptionEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStart, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionEnd)  $default,) {final _that = this;
switch (_that) {
case _UpdateInvoiceRequest():
return $default(_that.consumptionStart,_that.consumptionEnd);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStart, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionEnd)?  $default,) {final _that = this;
switch (_that) {
case _UpdateInvoiceRequest() when $default != null:
return $default(_that.consumptionStart,_that.consumptionEnd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateInvoiceRequest implements UpdateInvoiceRequest {
  const _UpdateInvoiceRequest({@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.consumptionStart, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.consumptionEnd});
  factory _UpdateInvoiceRequest.fromJson(Map<String, dynamic> json) => _$UpdateInvoiceRequestFromJson(json);

@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? consumptionStart;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? consumptionEnd;

/// Create a copy of UpdateInvoiceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateInvoiceRequestCopyWith<_UpdateInvoiceRequest> get copyWith => __$UpdateInvoiceRequestCopyWithImpl<_UpdateInvoiceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateInvoiceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateInvoiceRequest&&(identical(other.consumptionStart, consumptionStart) || other.consumptionStart == consumptionStart)&&(identical(other.consumptionEnd, consumptionEnd) || other.consumptionEnd == consumptionEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,consumptionStart,consumptionEnd);

@override
String toString() {
  return 'UpdateInvoiceRequest(consumptionStart: $consumptionStart, consumptionEnd: $consumptionEnd)';
}


}

/// @nodoc
abstract mixin class _$UpdateInvoiceRequestCopyWith<$Res> implements $UpdateInvoiceRequestCopyWith<$Res> {
  factory _$UpdateInvoiceRequestCopyWith(_UpdateInvoiceRequest value, $Res Function(_UpdateInvoiceRequest) _then) = __$UpdateInvoiceRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? consumptionStart,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? consumptionEnd
});




}
/// @nodoc
class __$UpdateInvoiceRequestCopyWithImpl<$Res>
    implements _$UpdateInvoiceRequestCopyWith<$Res> {
  __$UpdateInvoiceRequestCopyWithImpl(this._self, this._then);

  final _UpdateInvoiceRequest _self;
  final $Res Function(_UpdateInvoiceRequest) _then;

/// Create a copy of UpdateInvoiceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consumptionStart = freezed,Object? consumptionEnd = freezed,}) {
  return _then(_UpdateInvoiceRequest(
consumptionStart: freezed == consumptionStart ? _self.consumptionStart : consumptionStart // ignore: cast_nullable_to_non_nullable
as DateTime?,consumptionEnd: freezed == consumptionEnd ? _self.consumptionEnd : consumptionEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
