// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_meter_reading_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateMeterReadingRequest {

 double get readingValue;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get readingDate;
/// Create a copy of CreateMeterReadingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMeterReadingRequestCopyWith<CreateMeterReadingRequest> get copyWith => _$CreateMeterReadingRequestCopyWithImpl<CreateMeterReadingRequest>(this as CreateMeterReadingRequest, _$identity);

  /// Serializes this CreateMeterReadingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMeterReadingRequest&&(identical(other.readingValue, readingValue) || other.readingValue == readingValue)&&(identical(other.readingDate, readingDate) || other.readingDate == readingDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readingValue,readingDate);

@override
String toString() {
  return 'CreateMeterReadingRequest(readingValue: $readingValue, readingDate: $readingDate)';
}


}

/// @nodoc
abstract mixin class $CreateMeterReadingRequestCopyWith<$Res>  {
  factory $CreateMeterReadingRequestCopyWith(CreateMeterReadingRequest value, $Res Function(CreateMeterReadingRequest) _then) = _$CreateMeterReadingRequestCopyWithImpl;
@useResult
$Res call({
 double readingValue,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? readingDate
});




}
/// @nodoc
class _$CreateMeterReadingRequestCopyWithImpl<$Res>
    implements $CreateMeterReadingRequestCopyWith<$Res> {
  _$CreateMeterReadingRequestCopyWithImpl(this._self, this._then);

  final CreateMeterReadingRequest _self;
  final $Res Function(CreateMeterReadingRequest) _then;

/// Create a copy of CreateMeterReadingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? readingValue = null,Object? readingDate = freezed,}) {
  return _then(_self.copyWith(
readingValue: null == readingValue ? _self.readingValue : readingValue // ignore: cast_nullable_to_non_nullable
as double,readingDate: freezed == readingDate ? _self.readingDate : readingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateMeterReadingRequest].
extension CreateMeterReadingRequestPatterns on CreateMeterReadingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMeterReadingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMeterReadingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMeterReadingRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateMeterReadingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMeterReadingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMeterReadingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double readingValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? readingDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMeterReadingRequest() when $default != null:
return $default(_that.readingValue,_that.readingDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double readingValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? readingDate)  $default,) {final _that = this;
switch (_that) {
case _CreateMeterReadingRequest():
return $default(_that.readingValue,_that.readingDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double readingValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? readingDate)?  $default,) {final _that = this;
switch (_that) {
case _CreateMeterReadingRequest() when $default != null:
return $default(_that.readingValue,_that.readingDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateMeterReadingRequest implements CreateMeterReadingRequest {
  const _CreateMeterReadingRequest({required this.readingValue, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.readingDate});
  factory _CreateMeterReadingRequest.fromJson(Map<String, dynamic> json) => _$CreateMeterReadingRequestFromJson(json);

@override final  double readingValue;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? readingDate;

/// Create a copy of CreateMeterReadingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMeterReadingRequestCopyWith<_CreateMeterReadingRequest> get copyWith => __$CreateMeterReadingRequestCopyWithImpl<_CreateMeterReadingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateMeterReadingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMeterReadingRequest&&(identical(other.readingValue, readingValue) || other.readingValue == readingValue)&&(identical(other.readingDate, readingDate) || other.readingDate == readingDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readingValue,readingDate);

@override
String toString() {
  return 'CreateMeterReadingRequest(readingValue: $readingValue, readingDate: $readingDate)';
}


}

/// @nodoc
abstract mixin class _$CreateMeterReadingRequestCopyWith<$Res> implements $CreateMeterReadingRequestCopyWith<$Res> {
  factory _$CreateMeterReadingRequestCopyWith(_CreateMeterReadingRequest value, $Res Function(_CreateMeterReadingRequest) _then) = __$CreateMeterReadingRequestCopyWithImpl;
@override @useResult
$Res call({
 double readingValue,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? readingDate
});




}
/// @nodoc
class __$CreateMeterReadingRequestCopyWithImpl<$Res>
    implements _$CreateMeterReadingRequestCopyWith<$Res> {
  __$CreateMeterReadingRequestCopyWithImpl(this._self, this._then);

  final _CreateMeterReadingRequest _self;
  final $Res Function(_CreateMeterReadingRequest) _then;

/// Create a copy of CreateMeterReadingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? readingValue = null,Object? readingDate = freezed,}) {
  return _then(_CreateMeterReadingRequest(
readingValue: null == readingValue ? _self.readingValue : readingValue // ignore: cast_nullable_to_non_nullable
as double,readingDate: freezed == readingDate ? _self.readingDate : readingDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
