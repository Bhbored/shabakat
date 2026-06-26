// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_reading_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeterReadingResponse {

 String get id; double get readingValue; double? get consumption; DateTime get createdAt;
/// Create a copy of MeterReadingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeterReadingResponseCopyWith<MeterReadingResponse> get copyWith => _$MeterReadingResponseCopyWithImpl<MeterReadingResponse>(this as MeterReadingResponse, _$identity);

  /// Serializes this MeterReadingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeterReadingResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.readingValue, readingValue) || other.readingValue == readingValue)&&(identical(other.consumption, consumption) || other.consumption == consumption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,readingValue,consumption,createdAt);

@override
String toString() {
  return 'MeterReadingResponse(id: $id, readingValue: $readingValue, consumption: $consumption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MeterReadingResponseCopyWith<$Res>  {
  factory $MeterReadingResponseCopyWith(MeterReadingResponse value, $Res Function(MeterReadingResponse) _then) = _$MeterReadingResponseCopyWithImpl;
@useResult
$Res call({
 String id, double readingValue, double? consumption, DateTime createdAt
});




}
/// @nodoc
class _$MeterReadingResponseCopyWithImpl<$Res>
    implements $MeterReadingResponseCopyWith<$Res> {
  _$MeterReadingResponseCopyWithImpl(this._self, this._then);

  final MeterReadingResponse _self;
  final $Res Function(MeterReadingResponse) _then;

/// Create a copy of MeterReadingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? readingValue = null,Object? consumption = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,readingValue: null == readingValue ? _self.readingValue : readingValue // ignore: cast_nullable_to_non_nullable
as double,consumption: freezed == consumption ? _self.consumption : consumption // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MeterReadingResponse].
extension MeterReadingResponsePatterns on MeterReadingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeterReadingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeterReadingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeterReadingResponse value)  $default,){
final _that = this;
switch (_that) {
case _MeterReadingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeterReadingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MeterReadingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double readingValue,  double? consumption,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeterReadingResponse() when $default != null:
return $default(_that.id,_that.readingValue,_that.consumption,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double readingValue,  double? consumption,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MeterReadingResponse():
return $default(_that.id,_that.readingValue,_that.consumption,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double readingValue,  double? consumption,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MeterReadingResponse() when $default != null:
return $default(_that.id,_that.readingValue,_that.consumption,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MeterReadingResponse implements MeterReadingResponse {
  const _MeterReadingResponse({required this.id, required this.readingValue, this.consumption, required this.createdAt});
  factory _MeterReadingResponse.fromJson(Map<String, dynamic> json) => _$MeterReadingResponseFromJson(json);

@override final  String id;
@override final  double readingValue;
@override final  double? consumption;
@override final  DateTime createdAt;

/// Create a copy of MeterReadingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeterReadingResponseCopyWith<_MeterReadingResponse> get copyWith => __$MeterReadingResponseCopyWithImpl<_MeterReadingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeterReadingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeterReadingResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.readingValue, readingValue) || other.readingValue == readingValue)&&(identical(other.consumption, consumption) || other.consumption == consumption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,readingValue,consumption,createdAt);

@override
String toString() {
  return 'MeterReadingResponse(id: $id, readingValue: $readingValue, consumption: $consumption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MeterReadingResponseCopyWith<$Res> implements $MeterReadingResponseCopyWith<$Res> {
  factory _$MeterReadingResponseCopyWith(_MeterReadingResponse value, $Res Function(_MeterReadingResponse) _then) = __$MeterReadingResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, double readingValue, double? consumption, DateTime createdAt
});




}
/// @nodoc
class __$MeterReadingResponseCopyWithImpl<$Res>
    implements _$MeterReadingResponseCopyWith<$Res> {
  __$MeterReadingResponseCopyWithImpl(this._self, this._then);

  final _MeterReadingResponse _self;
  final $Res Function(_MeterReadingResponse) _then;

/// Create a copy of MeterReadingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? readingValue = null,Object? consumption = freezed,Object? createdAt = null,}) {
  return _then(_MeterReadingResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,readingValue: null == readingValue ? _self.readingValue : readingValue // ignore: cast_nullable_to_non_nullable
as double,consumption: freezed == consumption ? _self.consumption : consumption // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
