// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AreaResponse {

 String get id; String get name; int get customerCount; DateTime get createdAt;
/// Create a copy of AreaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaResponseCopyWith<AreaResponse> get copyWith => _$AreaResponseCopyWithImpl<AreaResponse>(this as AreaResponse, _$identity);

  /// Serializes this AreaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AreaResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,customerCount,createdAt);

@override
String toString() {
  return 'AreaResponse(id: $id, name: $name, customerCount: $customerCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AreaResponseCopyWith<$Res>  {
  factory $AreaResponseCopyWith(AreaResponse value, $Res Function(AreaResponse) _then) = _$AreaResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, int customerCount, DateTime createdAt
});




}
/// @nodoc
class _$AreaResponseCopyWithImpl<$Res>
    implements $AreaResponseCopyWith<$Res> {
  _$AreaResponseCopyWithImpl(this._self, this._then);

  final AreaResponse _self;
  final $Res Function(AreaResponse) _then;

/// Create a copy of AreaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? customerCount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AreaResponse].
extension AreaResponsePatterns on AreaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AreaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AreaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AreaResponse value)  $default,){
final _that = this;
switch (_that) {
case _AreaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AreaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AreaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int customerCount,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AreaResponse() when $default != null:
return $default(_that.id,_that.name,_that.customerCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int customerCount,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AreaResponse():
return $default(_that.id,_that.name,_that.customerCount,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int customerCount,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AreaResponse() when $default != null:
return $default(_that.id,_that.name,_that.customerCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AreaResponse implements AreaResponse {
  const _AreaResponse({required this.id, required this.name, required this.customerCount, required this.createdAt});
  factory _AreaResponse.fromJson(Map<String, dynamic> json) => _$AreaResponseFromJson(json);

@override final  String id;
@override final  String name;
@override final  int customerCount;
@override final  DateTime createdAt;

/// Create a copy of AreaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaResponseCopyWith<_AreaResponse> get copyWith => __$AreaResponseCopyWithImpl<_AreaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AreaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AreaResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,customerCount,createdAt);

@override
String toString() {
  return 'AreaResponse(id: $id, name: $name, customerCount: $customerCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AreaResponseCopyWith<$Res> implements $AreaResponseCopyWith<$Res> {
  factory _$AreaResponseCopyWith(_AreaResponse value, $Res Function(_AreaResponse) _then) = __$AreaResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int customerCount, DateTime createdAt
});




}
/// @nodoc
class __$AreaResponseCopyWithImpl<$Res>
    implements _$AreaResponseCopyWith<$Res> {
  __$AreaResponseCopyWithImpl(this._self, this._then);

  final _AreaResponse _self;
  final $Res Function(_AreaResponse) _then;

/// Create a copy of AreaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? customerCount = null,Object? createdAt = null,}) {
  return _then(_AreaResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
