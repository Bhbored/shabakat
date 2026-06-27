// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_overview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerOverviewResponse {

 int get total; int get active; int get suspended; int get terminated; int get ampereCount; int get kilowattCount;
/// Create a copy of CustomerOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerOverviewResponseCopyWith<CustomerOverviewResponse> get copyWith => _$CustomerOverviewResponseCopyWithImpl<CustomerOverviewResponse>(this as CustomerOverviewResponse, _$identity);

  /// Serializes this CustomerOverviewResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerOverviewResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active)&&(identical(other.suspended, suspended) || other.suspended == suspended)&&(identical(other.terminated, terminated) || other.terminated == terminated)&&(identical(other.ampereCount, ampereCount) || other.ampereCount == ampereCount)&&(identical(other.kilowattCount, kilowattCount) || other.kilowattCount == kilowattCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,active,suspended,terminated,ampereCount,kilowattCount);

@override
String toString() {
  return 'CustomerOverviewResponse(total: $total, active: $active, suspended: $suspended, terminated: $terminated, ampereCount: $ampereCount, kilowattCount: $kilowattCount)';
}


}

/// @nodoc
abstract mixin class $CustomerOverviewResponseCopyWith<$Res>  {
  factory $CustomerOverviewResponseCopyWith(CustomerOverviewResponse value, $Res Function(CustomerOverviewResponse) _then) = _$CustomerOverviewResponseCopyWithImpl;
@useResult
$Res call({
 int total, int active, int suspended, int terminated, int ampereCount, int kilowattCount
});




}
/// @nodoc
class _$CustomerOverviewResponseCopyWithImpl<$Res>
    implements $CustomerOverviewResponseCopyWith<$Res> {
  _$CustomerOverviewResponseCopyWithImpl(this._self, this._then);

  final CustomerOverviewResponse _self;
  final $Res Function(CustomerOverviewResponse) _then;

/// Create a copy of CustomerOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? active = null,Object? suspended = null,Object? terminated = null,Object? ampereCount = null,Object? kilowattCount = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,suspended: null == suspended ? _self.suspended : suspended // ignore: cast_nullable_to_non_nullable
as int,terminated: null == terminated ? _self.terminated : terminated // ignore: cast_nullable_to_non_nullable
as int,ampereCount: null == ampereCount ? _self.ampereCount : ampereCount // ignore: cast_nullable_to_non_nullable
as int,kilowattCount: null == kilowattCount ? _self.kilowattCount : kilowattCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerOverviewResponse].
extension CustomerOverviewResponsePatterns on CustomerOverviewResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerOverviewResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerOverviewResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerOverviewResponse value)  $default,){
final _that = this;
switch (_that) {
case _CustomerOverviewResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerOverviewResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerOverviewResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int active,  int suspended,  int terminated,  int ampereCount,  int kilowattCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerOverviewResponse() when $default != null:
return $default(_that.total,_that.active,_that.suspended,_that.terminated,_that.ampereCount,_that.kilowattCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int active,  int suspended,  int terminated,  int ampereCount,  int kilowattCount)  $default,) {final _that = this;
switch (_that) {
case _CustomerOverviewResponse():
return $default(_that.total,_that.active,_that.suspended,_that.terminated,_that.ampereCount,_that.kilowattCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int active,  int suspended,  int terminated,  int ampereCount,  int kilowattCount)?  $default,) {final _that = this;
switch (_that) {
case _CustomerOverviewResponse() when $default != null:
return $default(_that.total,_that.active,_that.suspended,_that.terminated,_that.ampereCount,_that.kilowattCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerOverviewResponse implements CustomerOverviewResponse {
  const _CustomerOverviewResponse({this.total = 0, this.active = 0, this.suspended = 0, this.terminated = 0, this.ampereCount = 0, this.kilowattCount = 0});
  factory _CustomerOverviewResponse.fromJson(Map<String, dynamic> json) => _$CustomerOverviewResponseFromJson(json);

@override@JsonKey() final  int total;
@override@JsonKey() final  int active;
@override@JsonKey() final  int suspended;
@override@JsonKey() final  int terminated;
@override@JsonKey() final  int ampereCount;
@override@JsonKey() final  int kilowattCount;

/// Create a copy of CustomerOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerOverviewResponseCopyWith<_CustomerOverviewResponse> get copyWith => __$CustomerOverviewResponseCopyWithImpl<_CustomerOverviewResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerOverviewResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerOverviewResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active)&&(identical(other.suspended, suspended) || other.suspended == suspended)&&(identical(other.terminated, terminated) || other.terminated == terminated)&&(identical(other.ampereCount, ampereCount) || other.ampereCount == ampereCount)&&(identical(other.kilowattCount, kilowattCount) || other.kilowattCount == kilowattCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,active,suspended,terminated,ampereCount,kilowattCount);

@override
String toString() {
  return 'CustomerOverviewResponse(total: $total, active: $active, suspended: $suspended, terminated: $terminated, ampereCount: $ampereCount, kilowattCount: $kilowattCount)';
}


}

/// @nodoc
abstract mixin class _$CustomerOverviewResponseCopyWith<$Res> implements $CustomerOverviewResponseCopyWith<$Res> {
  factory _$CustomerOverviewResponseCopyWith(_CustomerOverviewResponse value, $Res Function(_CustomerOverviewResponse) _then) = __$CustomerOverviewResponseCopyWithImpl;
@override @useResult
$Res call({
 int total, int active, int suspended, int terminated, int ampereCount, int kilowattCount
});




}
/// @nodoc
class __$CustomerOverviewResponseCopyWithImpl<$Res>
    implements _$CustomerOverviewResponseCopyWith<$Res> {
  __$CustomerOverviewResponseCopyWithImpl(this._self, this._then);

  final _CustomerOverviewResponse _self;
  final $Res Function(_CustomerOverviewResponse) _then;

/// Create a copy of CustomerOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? active = null,Object? suspended = null,Object? terminated = null,Object? ampereCount = null,Object? kilowattCount = null,}) {
  return _then(_CustomerOverviewResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,suspended: null == suspended ? _self.suspended : suspended // ignore: cast_nullable_to_non_nullable
as int,terminated: null == terminated ? _self.terminated : terminated // ignore: cast_nullable_to_non_nullable
as int,ampereCount: null == ampereCount ? _self.ampereCount : ampereCount // ignore: cast_nullable_to_non_nullable
as int,kilowattCount: null == kilowattCount ? _self.kilowattCount : kilowattCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
