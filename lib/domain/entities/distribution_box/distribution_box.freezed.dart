// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distribution_box.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistributionBox {

 String get id; String get name; String get areaId; String get areaName; String? get locationNote; String? get notes; int get customerCount; DateTime get createdAt;
/// Create a copy of DistributionBox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistributionBoxCopyWith<DistributionBox> get copyWith => _$DistributionBoxCopyWithImpl<DistributionBox>(this as DistributionBox, _$identity);

  /// Serializes this DistributionBox to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistributionBox&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.locationNote, locationNote) || other.locationNote == locationNote)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,areaId,areaName,locationNote,notes,customerCount,createdAt);

@override
String toString() {
  return 'DistributionBox(id: $id, name: $name, areaId: $areaId, areaName: $areaName, locationNote: $locationNote, notes: $notes, customerCount: $customerCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DistributionBoxCopyWith<$Res>  {
  factory $DistributionBoxCopyWith(DistributionBox value, $Res Function(DistributionBox) _then) = _$DistributionBoxCopyWithImpl;
@useResult
$Res call({
 String id, String name, String areaId, String areaName, String? locationNote, String? notes, int customerCount, DateTime createdAt
});




}
/// @nodoc
class _$DistributionBoxCopyWithImpl<$Res>
    implements $DistributionBoxCopyWith<$Res> {
  _$DistributionBoxCopyWithImpl(this._self, this._then);

  final DistributionBox _self;
  final $Res Function(DistributionBox) _then;

/// Create a copy of DistributionBox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? areaId = null,Object? areaName = null,Object? locationNote = freezed,Object? notes = freezed,Object? customerCount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,locationNote: freezed == locationNote ? _self.locationNote : locationNote // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DistributionBox].
extension DistributionBoxPatterns on DistributionBox {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistributionBox value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistributionBox() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistributionBox value)  $default,){
final _that = this;
switch (_that) {
case _DistributionBox():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistributionBox value)?  $default,){
final _that = this;
switch (_that) {
case _DistributionBox() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String areaId,  String areaName,  String? locationNote,  String? notes,  int customerCount,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistributionBox() when $default != null:
return $default(_that.id,_that.name,_that.areaId,_that.areaName,_that.locationNote,_that.notes,_that.customerCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String areaId,  String areaName,  String? locationNote,  String? notes,  int customerCount,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _DistributionBox():
return $default(_that.id,_that.name,_that.areaId,_that.areaName,_that.locationNote,_that.notes,_that.customerCount,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String areaId,  String areaName,  String? locationNote,  String? notes,  int customerCount,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DistributionBox() when $default != null:
return $default(_that.id,_that.name,_that.areaId,_that.areaName,_that.locationNote,_that.notes,_that.customerCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistributionBox implements DistributionBox {
  const _DistributionBox({required this.id, required this.name, required this.areaId, required this.areaName, this.locationNote, this.notes, this.customerCount = 0, required this.createdAt});
  factory _DistributionBox.fromJson(Map<String, dynamic> json) => _$DistributionBoxFromJson(json);

@override final  String id;
@override final  String name;
@override final  String areaId;
@override final  String areaName;
@override final  String? locationNote;
@override final  String? notes;
@override@JsonKey() final  int customerCount;
@override final  DateTime createdAt;

/// Create a copy of DistributionBox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistributionBoxCopyWith<_DistributionBox> get copyWith => __$DistributionBoxCopyWithImpl<_DistributionBox>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistributionBoxToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistributionBox&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.locationNote, locationNote) || other.locationNote == locationNote)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,areaId,areaName,locationNote,notes,customerCount,createdAt);

@override
String toString() {
  return 'DistributionBox(id: $id, name: $name, areaId: $areaId, areaName: $areaName, locationNote: $locationNote, notes: $notes, customerCount: $customerCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DistributionBoxCopyWith<$Res> implements $DistributionBoxCopyWith<$Res> {
  factory _$DistributionBoxCopyWith(_DistributionBox value, $Res Function(_DistributionBox) _then) = __$DistributionBoxCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String areaId, String areaName, String? locationNote, String? notes, int customerCount, DateTime createdAt
});




}
/// @nodoc
class __$DistributionBoxCopyWithImpl<$Res>
    implements _$DistributionBoxCopyWith<$Res> {
  __$DistributionBoxCopyWithImpl(this._self, this._then);

  final _DistributionBox _self;
  final $Res Function(_DistributionBox) _then;

/// Create a copy of DistributionBox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? areaId = null,Object? areaName = null,Object? locationNote = freezed,Object? notes = freezed,Object? customerCount = null,Object? createdAt = null,}) {
  return _then(_DistributionBox(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,locationNote: freezed == locationNote ? _self.locationNote : locationNote // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
