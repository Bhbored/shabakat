// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeterReading {

 String get id; double get readingValue; double? get consumption; DateTime get createdAt;
/// Create a copy of MeterReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeterReadingCopyWith<MeterReading> get copyWith => _$MeterReadingCopyWithImpl<MeterReading>(this as MeterReading, _$identity);

  /// Serializes this MeterReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeterReading&&(identical(other.id, id) || other.id == id)&&(identical(other.readingValue, readingValue) || other.readingValue == readingValue)&&(identical(other.consumption, consumption) || other.consumption == consumption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,readingValue,consumption,createdAt);

@override
String toString() {
  return 'MeterReading(id: $id, readingValue: $readingValue, consumption: $consumption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MeterReadingCopyWith<$Res>  {
  factory $MeterReadingCopyWith(MeterReading value, $Res Function(MeterReading) _then) = _$MeterReadingCopyWithImpl;
@useResult
$Res call({
 String id, double readingValue, double? consumption, DateTime createdAt
});




}
/// @nodoc
class _$MeterReadingCopyWithImpl<$Res>
    implements $MeterReadingCopyWith<$Res> {
  _$MeterReadingCopyWithImpl(this._self, this._then);

  final MeterReading _self;
  final $Res Function(MeterReading) _then;

/// Create a copy of MeterReading
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


/// Adds pattern-matching-related methods to [MeterReading].
extension MeterReadingPatterns on MeterReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeterReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeterReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeterReading value)  $default,){
final _that = this;
switch (_that) {
case _MeterReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeterReading value)?  $default,){
final _that = this;
switch (_that) {
case _MeterReading() when $default != null:
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
case _MeterReading() when $default != null:
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
case _MeterReading():
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
case _MeterReading() when $default != null:
return $default(_that.id,_that.readingValue,_that.consumption,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MeterReading implements MeterReading {
  const _MeterReading({required this.id, required this.readingValue, this.consumption, required this.createdAt});
  factory _MeterReading.fromJson(Map<String, dynamic> json) => _$MeterReadingFromJson(json);

@override final  String id;
@override final  double readingValue;
@override final  double? consumption;
@override final  DateTime createdAt;

/// Create a copy of MeterReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeterReadingCopyWith<_MeterReading> get copyWith => __$MeterReadingCopyWithImpl<_MeterReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeterReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeterReading&&(identical(other.id, id) || other.id == id)&&(identical(other.readingValue, readingValue) || other.readingValue == readingValue)&&(identical(other.consumption, consumption) || other.consumption == consumption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,readingValue,consumption,createdAt);

@override
String toString() {
  return 'MeterReading(id: $id, readingValue: $readingValue, consumption: $consumption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MeterReadingCopyWith<$Res> implements $MeterReadingCopyWith<$Res> {
  factory _$MeterReadingCopyWith(_MeterReading value, $Res Function(_MeterReading) _then) = __$MeterReadingCopyWithImpl;
@override @useResult
$Res call({
 String id, double readingValue, double? consumption, DateTime createdAt
});




}
/// @nodoc
class __$MeterReadingCopyWithImpl<$Res>
    implements _$MeterReadingCopyWith<$Res> {
  __$MeterReadingCopyWithImpl(this._self, this._then);

  final _MeterReading _self;
  final $Res Function(_MeterReading) _then;

/// Create a copy of MeterReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? readingValue = null,Object? consumption = freezed,Object? createdAt = null,}) {
  return _then(_MeterReading(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,readingValue: null == readingValue ? _self.readingValue : readingValue // ignore: cast_nullable_to_non_nullable
as double,consumption: freezed == consumption ? _self.consumption : consumption // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
