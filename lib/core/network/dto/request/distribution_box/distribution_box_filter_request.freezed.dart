// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distribution_box_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistributionBoxFilterRequest {

 String? get areaId; int get pageNumber; int get pageSize;
/// Create a copy of DistributionBoxFilterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistributionBoxFilterRequestCopyWith<DistributionBoxFilterRequest> get copyWith => _$DistributionBoxFilterRequestCopyWithImpl<DistributionBoxFilterRequest>(this as DistributionBoxFilterRequest, _$identity);

  /// Serializes this DistributionBoxFilterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistributionBoxFilterRequest&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,areaId,pageNumber,pageSize);

@override
String toString() {
  return 'DistributionBoxFilterRequest(areaId: $areaId, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $DistributionBoxFilterRequestCopyWith<$Res>  {
  factory $DistributionBoxFilterRequestCopyWith(DistributionBoxFilterRequest value, $Res Function(DistributionBoxFilterRequest) _then) = _$DistributionBoxFilterRequestCopyWithImpl;
@useResult
$Res call({
 String? areaId, int pageNumber, int pageSize
});




}
/// @nodoc
class _$DistributionBoxFilterRequestCopyWithImpl<$Res>
    implements $DistributionBoxFilterRequestCopyWith<$Res> {
  _$DistributionBoxFilterRequestCopyWithImpl(this._self, this._then);

  final DistributionBoxFilterRequest _self;
  final $Res Function(DistributionBoxFilterRequest) _then;

/// Create a copy of DistributionBoxFilterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? areaId = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DistributionBoxFilterRequest].
extension DistributionBoxFilterRequestPatterns on DistributionBoxFilterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistributionBoxFilterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistributionBoxFilterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistributionBoxFilterRequest value)  $default,){
final _that = this;
switch (_that) {
case _DistributionBoxFilterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistributionBoxFilterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DistributionBoxFilterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? areaId,  int pageNumber,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistributionBoxFilterRequest() when $default != null:
return $default(_that.areaId,_that.pageNumber,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? areaId,  int pageNumber,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _DistributionBoxFilterRequest():
return $default(_that.areaId,_that.pageNumber,_that.pageSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? areaId,  int pageNumber,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _DistributionBoxFilterRequest() when $default != null:
return $default(_that.areaId,_that.pageNumber,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistributionBoxFilterRequest implements DistributionBoxFilterRequest {
  const _DistributionBoxFilterRequest({this.areaId, this.pageNumber = 1, this.pageSize = 10});
  factory _DistributionBoxFilterRequest.fromJson(Map<String, dynamic> json) => _$DistributionBoxFilterRequestFromJson(json);

@override final  String? areaId;
@override@JsonKey() final  int pageNumber;
@override@JsonKey() final  int pageSize;

/// Create a copy of DistributionBoxFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistributionBoxFilterRequestCopyWith<_DistributionBoxFilterRequest> get copyWith => __$DistributionBoxFilterRequestCopyWithImpl<_DistributionBoxFilterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistributionBoxFilterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistributionBoxFilterRequest&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,areaId,pageNumber,pageSize);

@override
String toString() {
  return 'DistributionBoxFilterRequest(areaId: $areaId, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$DistributionBoxFilterRequestCopyWith<$Res> implements $DistributionBoxFilterRequestCopyWith<$Res> {
  factory _$DistributionBoxFilterRequestCopyWith(_DistributionBoxFilterRequest value, $Res Function(_DistributionBoxFilterRequest) _then) = __$DistributionBoxFilterRequestCopyWithImpl;
@override @useResult
$Res call({
 String? areaId, int pageNumber, int pageSize
});




}
/// @nodoc
class __$DistributionBoxFilterRequestCopyWithImpl<$Res>
    implements _$DistributionBoxFilterRequestCopyWith<$Res> {
  __$DistributionBoxFilterRequestCopyWithImpl(this._self, this._then);

  final _DistributionBoxFilterRequest _self;
  final $Res Function(_DistributionBoxFilterRequest) _then;

/// Create a copy of DistributionBoxFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? areaId = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_DistributionBoxFilterRequest(
areaId: freezed == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
