// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_distribution_box_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateDistributionBoxRequest {

 String get name; String get areaId; String? get locationNote; String? get notes;
/// Create a copy of UpdateDistributionBoxRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDistributionBoxRequestCopyWith<UpdateDistributionBoxRequest> get copyWith => _$UpdateDistributionBoxRequestCopyWithImpl<UpdateDistributionBoxRequest>(this as UpdateDistributionBoxRequest, _$identity);

  /// Serializes this UpdateDistributionBoxRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDistributionBoxRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.locationNote, locationNote) || other.locationNote == locationNote)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,areaId,locationNote,notes);

@override
String toString() {
  return 'UpdateDistributionBoxRequest(name: $name, areaId: $areaId, locationNote: $locationNote, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $UpdateDistributionBoxRequestCopyWith<$Res>  {
  factory $UpdateDistributionBoxRequestCopyWith(UpdateDistributionBoxRequest value, $Res Function(UpdateDistributionBoxRequest) _then) = _$UpdateDistributionBoxRequestCopyWithImpl;
@useResult
$Res call({
 String name, String areaId, String? locationNote, String? notes
});




}
/// @nodoc
class _$UpdateDistributionBoxRequestCopyWithImpl<$Res>
    implements $UpdateDistributionBoxRequestCopyWith<$Res> {
  _$UpdateDistributionBoxRequestCopyWithImpl(this._self, this._then);

  final UpdateDistributionBoxRequest _self;
  final $Res Function(UpdateDistributionBoxRequest) _then;

/// Create a copy of UpdateDistributionBoxRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? areaId = null,Object? locationNote = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,locationNote: freezed == locationNote ? _self.locationNote : locationNote // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateDistributionBoxRequest].
extension UpdateDistributionBoxRequestPatterns on UpdateDistributionBoxRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateDistributionBoxRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateDistributionBoxRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateDistributionBoxRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateDistributionBoxRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateDistributionBoxRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateDistributionBoxRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String areaId,  String? locationNote,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateDistributionBoxRequest() when $default != null:
return $default(_that.name,_that.areaId,_that.locationNote,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String areaId,  String? locationNote,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _UpdateDistributionBoxRequest():
return $default(_that.name,_that.areaId,_that.locationNote,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String areaId,  String? locationNote,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _UpdateDistributionBoxRequest() when $default != null:
return $default(_that.name,_that.areaId,_that.locationNote,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateDistributionBoxRequest implements UpdateDistributionBoxRequest {
  const _UpdateDistributionBoxRequest({required this.name, required this.areaId, this.locationNote, this.notes});
  factory _UpdateDistributionBoxRequest.fromJson(Map<String, dynamic> json) => _$UpdateDistributionBoxRequestFromJson(json);

@override final  String name;
@override final  String areaId;
@override final  String? locationNote;
@override final  String? notes;

/// Create a copy of UpdateDistributionBoxRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDistributionBoxRequestCopyWith<_UpdateDistributionBoxRequest> get copyWith => __$UpdateDistributionBoxRequestCopyWithImpl<_UpdateDistributionBoxRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateDistributionBoxRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDistributionBoxRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.locationNote, locationNote) || other.locationNote == locationNote)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,areaId,locationNote,notes);

@override
String toString() {
  return 'UpdateDistributionBoxRequest(name: $name, areaId: $areaId, locationNote: $locationNote, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$UpdateDistributionBoxRequestCopyWith<$Res> implements $UpdateDistributionBoxRequestCopyWith<$Res> {
  factory _$UpdateDistributionBoxRequestCopyWith(_UpdateDistributionBoxRequest value, $Res Function(_UpdateDistributionBoxRequest) _then) = __$UpdateDistributionBoxRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String areaId, String? locationNote, String? notes
});




}
/// @nodoc
class __$UpdateDistributionBoxRequestCopyWithImpl<$Res>
    implements _$UpdateDistributionBoxRequestCopyWith<$Res> {
  __$UpdateDistributionBoxRequestCopyWithImpl(this._self, this._then);

  final _UpdateDistributionBoxRequest _self;
  final $Res Function(_UpdateDistributionBoxRequest) _then;

/// Create a copy of UpdateDistributionBoxRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? areaId = null,Object? locationNote = freezed,Object? notes = freezed,}) {
  return _then(_UpdateDistributionBoxRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,locationNote: freezed == locationNote ? _self.locationNote : locationNote // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
