// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distribution_box_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistributionBoxResponse {

 String get id; String get name; String get areaId; String get areaName; String? get locationNote; String? get notes; int get customerCount; DateTime get createdAt;
/// Create a copy of DistributionBoxResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistributionBoxResponseCopyWith<DistributionBoxResponse> get copyWith => _$DistributionBoxResponseCopyWithImpl<DistributionBoxResponse>(this as DistributionBoxResponse, _$identity);

  /// Serializes this DistributionBoxResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistributionBoxResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.locationNote, locationNote) || other.locationNote == locationNote)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,areaId,areaName,locationNote,notes,customerCount,createdAt);

@override
String toString() {
  return 'DistributionBoxResponse(id: $id, name: $name, areaId: $areaId, areaName: $areaName, locationNote: $locationNote, notes: $notes, customerCount: $customerCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DistributionBoxResponseCopyWith<$Res>  {
  factory $DistributionBoxResponseCopyWith(DistributionBoxResponse value, $Res Function(DistributionBoxResponse) _then) = _$DistributionBoxResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, String areaId, String areaName, String? locationNote, String? notes, int customerCount, DateTime createdAt
});




}
/// @nodoc
class _$DistributionBoxResponseCopyWithImpl<$Res>
    implements $DistributionBoxResponseCopyWith<$Res> {
  _$DistributionBoxResponseCopyWithImpl(this._self, this._then);

  final DistributionBoxResponse _self;
  final $Res Function(DistributionBoxResponse) _then;

/// Create a copy of DistributionBoxResponse
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


/// Adds pattern-matching-related methods to [DistributionBoxResponse].
extension DistributionBoxResponsePatterns on DistributionBoxResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistributionBoxResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistributionBoxResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistributionBoxResponse value)  $default,){
final _that = this;
switch (_that) {
case _DistributionBoxResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistributionBoxResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DistributionBoxResponse() when $default != null:
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
case _DistributionBoxResponse() when $default != null:
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
case _DistributionBoxResponse():
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
case _DistributionBoxResponse() when $default != null:
return $default(_that.id,_that.name,_that.areaId,_that.areaName,_that.locationNote,_that.notes,_that.customerCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistributionBoxResponse implements DistributionBoxResponse {
  const _DistributionBoxResponse({required this.id, required this.name, required this.areaId, required this.areaName, this.locationNote, this.notes, required this.customerCount, required this.createdAt});
  factory _DistributionBoxResponse.fromJson(Map<String, dynamic> json) => _$DistributionBoxResponseFromJson(json);

@override final  String id;
@override final  String name;
@override final  String areaId;
@override final  String areaName;
@override final  String? locationNote;
@override final  String? notes;
@override final  int customerCount;
@override final  DateTime createdAt;

/// Create a copy of DistributionBoxResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistributionBoxResponseCopyWith<_DistributionBoxResponse> get copyWith => __$DistributionBoxResponseCopyWithImpl<_DistributionBoxResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistributionBoxResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistributionBoxResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.locationNote, locationNote) || other.locationNote == locationNote)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,areaId,areaName,locationNote,notes,customerCount,createdAt);

@override
String toString() {
  return 'DistributionBoxResponse(id: $id, name: $name, areaId: $areaId, areaName: $areaName, locationNote: $locationNote, notes: $notes, customerCount: $customerCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DistributionBoxResponseCopyWith<$Res> implements $DistributionBoxResponseCopyWith<$Res> {
  factory _$DistributionBoxResponseCopyWith(_DistributionBoxResponse value, $Res Function(_DistributionBoxResponse) _then) = __$DistributionBoxResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String areaId, String areaName, String? locationNote, String? notes, int customerCount, DateTime createdAt
});




}
/// @nodoc
class __$DistributionBoxResponseCopyWithImpl<$Res>
    implements _$DistributionBoxResponseCopyWith<$Res> {
  __$DistributionBoxResponseCopyWithImpl(this._self, this._then);

  final _DistributionBoxResponse _self;
  final $Res Function(_DistributionBoxResponse) _then;

/// Create a copy of DistributionBoxResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? areaId = null,Object? areaName = null,Object? locationNote = freezed,Object? notes = freezed,Object? customerCount = null,Object? createdAt = null,}) {
  return _then(_DistributionBoxResponse(
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
