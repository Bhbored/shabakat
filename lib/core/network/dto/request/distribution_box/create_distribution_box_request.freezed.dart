// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_distribution_box_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateDistributionBoxRequest {

 String get name; String get areaId; String? get locationNote; String? get notes;
/// Create a copy of CreateDistributionBoxRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDistributionBoxRequestCopyWith<CreateDistributionBoxRequest> get copyWith => _$CreateDistributionBoxRequestCopyWithImpl<CreateDistributionBoxRequest>(this as CreateDistributionBoxRequest, _$identity);

  /// Serializes this CreateDistributionBoxRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDistributionBoxRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.locationNote, locationNote) || other.locationNote == locationNote)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,areaId,locationNote,notes);

@override
String toString() {
  return 'CreateDistributionBoxRequest(name: $name, areaId: $areaId, locationNote: $locationNote, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateDistributionBoxRequestCopyWith<$Res>  {
  factory $CreateDistributionBoxRequestCopyWith(CreateDistributionBoxRequest value, $Res Function(CreateDistributionBoxRequest) _then) = _$CreateDistributionBoxRequestCopyWithImpl;
@useResult
$Res call({
 String name, String areaId, String? locationNote, String? notes
});




}
/// @nodoc
class _$CreateDistributionBoxRequestCopyWithImpl<$Res>
    implements $CreateDistributionBoxRequestCopyWith<$Res> {
  _$CreateDistributionBoxRequestCopyWithImpl(this._self, this._then);

  final CreateDistributionBoxRequest _self;
  final $Res Function(CreateDistributionBoxRequest) _then;

/// Create a copy of CreateDistributionBoxRequest
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


/// Adds pattern-matching-related methods to [CreateDistributionBoxRequest].
extension CreateDistributionBoxRequestPatterns on CreateDistributionBoxRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDistributionBoxRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDistributionBoxRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDistributionBoxRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateDistributionBoxRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDistributionBoxRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDistributionBoxRequest() when $default != null:
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
case _CreateDistributionBoxRequest() when $default != null:
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
case _CreateDistributionBoxRequest():
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
case _CreateDistributionBoxRequest() when $default != null:
return $default(_that.name,_that.areaId,_that.locationNote,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDistributionBoxRequest implements CreateDistributionBoxRequest {
  const _CreateDistributionBoxRequest({required this.name, required this.areaId, this.locationNote, this.notes});
  factory _CreateDistributionBoxRequest.fromJson(Map<String, dynamic> json) => _$CreateDistributionBoxRequestFromJson(json);

@override final  String name;
@override final  String areaId;
@override final  String? locationNote;
@override final  String? notes;

/// Create a copy of CreateDistributionBoxRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDistributionBoxRequestCopyWith<_CreateDistributionBoxRequest> get copyWith => __$CreateDistributionBoxRequestCopyWithImpl<_CreateDistributionBoxRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDistributionBoxRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDistributionBoxRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.locationNote, locationNote) || other.locationNote == locationNote)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,areaId,locationNote,notes);

@override
String toString() {
  return 'CreateDistributionBoxRequest(name: $name, areaId: $areaId, locationNote: $locationNote, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateDistributionBoxRequestCopyWith<$Res> implements $CreateDistributionBoxRequestCopyWith<$Res> {
  factory _$CreateDistributionBoxRequestCopyWith(_CreateDistributionBoxRequest value, $Res Function(_CreateDistributionBoxRequest) _then) = __$CreateDistributionBoxRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String areaId, String? locationNote, String? notes
});




}
/// @nodoc
class __$CreateDistributionBoxRequestCopyWithImpl<$Res>
    implements _$CreateDistributionBoxRequestCopyWith<$Res> {
  __$CreateDistributionBoxRequestCopyWithImpl(this._self, this._then);

  final _CreateDistributionBoxRequest _self;
  final $Res Function(_CreateDistributionBoxRequest) _then;

/// Create a copy of CreateDistributionBoxRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? areaId = null,Object? locationNote = freezed,Object? notes = freezed,}) {
  return _then(_CreateDistributionBoxRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,locationNote: freezed == locationNote ? _self.locationNote : locationNote // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
