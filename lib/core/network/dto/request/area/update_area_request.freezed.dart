// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_area_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateAreaRequest {

 String get name;
/// Create a copy of UpdateAreaRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAreaRequestCopyWith<UpdateAreaRequest> get copyWith => _$UpdateAreaRequestCopyWithImpl<UpdateAreaRequest>(this as UpdateAreaRequest, _$identity);

  /// Serializes this UpdateAreaRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAreaRequest&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'UpdateAreaRequest(name: $name)';
}


}

/// @nodoc
abstract mixin class $UpdateAreaRequestCopyWith<$Res>  {
  factory $UpdateAreaRequestCopyWith(UpdateAreaRequest value, $Res Function(UpdateAreaRequest) _then) = _$UpdateAreaRequestCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$UpdateAreaRequestCopyWithImpl<$Res>
    implements $UpdateAreaRequestCopyWith<$Res> {
  _$UpdateAreaRequestCopyWithImpl(this._self, this._then);

  final UpdateAreaRequest _self;
  final $Res Function(UpdateAreaRequest) _then;

/// Create a copy of UpdateAreaRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAreaRequest].
extension UpdateAreaRequestPatterns on UpdateAreaRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAreaRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAreaRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAreaRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAreaRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAreaRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAreaRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAreaRequest() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _UpdateAreaRequest():
return $default(_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAreaRequest() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateAreaRequest implements UpdateAreaRequest {
  const _UpdateAreaRequest({required this.name});
  factory _UpdateAreaRequest.fromJson(Map<String, dynamic> json) => _$UpdateAreaRequestFromJson(json);

@override final  String name;

/// Create a copy of UpdateAreaRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAreaRequestCopyWith<_UpdateAreaRequest> get copyWith => __$UpdateAreaRequestCopyWithImpl<_UpdateAreaRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAreaRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAreaRequest&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'UpdateAreaRequest(name: $name)';
}


}

/// @nodoc
abstract mixin class _$UpdateAreaRequestCopyWith<$Res> implements $UpdateAreaRequestCopyWith<$Res> {
  factory _$UpdateAreaRequestCopyWith(_UpdateAreaRequest value, $Res Function(_UpdateAreaRequest) _then) = __$UpdateAreaRequestCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$UpdateAreaRequestCopyWithImpl<$Res>
    implements _$UpdateAreaRequestCopyWith<$Res> {
  __$UpdateAreaRequestCopyWithImpl(this._self, this._then);

  final _UpdateAreaRequest _self;
  final $Res Function(_UpdateAreaRequest) _then;

/// Create a copy of UpdateAreaRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_UpdateAreaRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
