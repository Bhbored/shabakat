// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Area {

 String get id; DateTime get createdAt; DateTime get updatedAt; String get companyId; String get name; int get customerCount;
/// Create a copy of Area
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaCopyWith<Area> get copyWith => _$AreaCopyWithImpl<Area>(this as Area, _$identity);

  /// Serializes this Area to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Area&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,companyId,name,customerCount);

@override
String toString() {
  return 'Area(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, companyId: $companyId, name: $name, customerCount: $customerCount)';
}


}

/// @nodoc
abstract mixin class $AreaCopyWith<$Res>  {
  factory $AreaCopyWith(Area value, $Res Function(Area) _then) = _$AreaCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, String companyId, String name, int customerCount
});




}
/// @nodoc
class _$AreaCopyWithImpl<$Res>
    implements $AreaCopyWith<$Res> {
  _$AreaCopyWithImpl(this._self, this._then);

  final Area _self;
  final $Res Function(Area) _then;

/// Create a copy of Area
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? companyId = null,Object? name = null,Object? customerCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Area].
extension AreaPatterns on Area {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Area value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Area() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Area value)  $default,){
final _that = this;
switch (_that) {
case _Area():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Area value)?  $default,){
final _that = this;
switch (_that) {
case _Area() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  String name,  int customerCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Area() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.name,_that.customerCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  String name,  int customerCount)  $default,) {final _that = this;
switch (_that) {
case _Area():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.name,_that.customerCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  DateTime updatedAt,  String companyId,  String name,  int customerCount)?  $default,) {final _that = this;
switch (_that) {
case _Area() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.companyId,_that.name,_that.customerCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Area implements Area {
  const _Area({required this.id, required this.createdAt, required this.updatedAt, required this.companyId, required this.name, this.customerCount = 0});
  factory _Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

@override final  String id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String companyId;
@override final  String name;
@override@JsonKey() final  int customerCount;

/// Create a copy of Area
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaCopyWith<_Area> get copyWith => __$AreaCopyWithImpl<_Area>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AreaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Area&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,companyId,name,customerCount);

@override
String toString() {
  return 'Area(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, companyId: $companyId, name: $name, customerCount: $customerCount)';
}


}

/// @nodoc
abstract mixin class _$AreaCopyWith<$Res> implements $AreaCopyWith<$Res> {
  factory _$AreaCopyWith(_Area value, $Res Function(_Area) _then) = __$AreaCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, DateTime updatedAt, String companyId, String name, int customerCount
});




}
/// @nodoc
class __$AreaCopyWithImpl<$Res>
    implements _$AreaCopyWith<$Res> {
  __$AreaCopyWithImpl(this._self, this._then);

  final _Area _self;
  final $Res Function(_Area) _then;

/// Create a copy of Area
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? companyId = null,Object? name = null,Object? customerCount = null,}) {
  return _then(_Area(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
