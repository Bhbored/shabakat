// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardFilterRequest {

 int? get year; int? get month;
/// Create a copy of DashboardFilterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardFilterRequestCopyWith<DashboardFilterRequest> get copyWith => _$DashboardFilterRequestCopyWithImpl<DashboardFilterRequest>(this as DashboardFilterRequest, _$identity);

  /// Serializes this DashboardFilterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardFilterRequest&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month);

@override
String toString() {
  return 'DashboardFilterRequest(year: $year, month: $month)';
}


}

/// @nodoc
abstract mixin class $DashboardFilterRequestCopyWith<$Res>  {
  factory $DashboardFilterRequestCopyWith(DashboardFilterRequest value, $Res Function(DashboardFilterRequest) _then) = _$DashboardFilterRequestCopyWithImpl;
@useResult
$Res call({
 int? year, int? month
});




}
/// @nodoc
class _$DashboardFilterRequestCopyWithImpl<$Res>
    implements $DashboardFilterRequestCopyWith<$Res> {
  _$DashboardFilterRequestCopyWithImpl(this._self, this._then);

  final DashboardFilterRequest _self;
  final $Res Function(DashboardFilterRequest) _then;

/// Create a copy of DashboardFilterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = freezed,Object? month = freezed,}) {
  return _then(_self.copyWith(
year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardFilterRequest].
extension DashboardFilterRequestPatterns on DashboardFilterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardFilterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardFilterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardFilterRequest value)  $default,){
final _that = this;
switch (_that) {
case _DashboardFilterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardFilterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardFilterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? year,  int? month)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardFilterRequest() when $default != null:
return $default(_that.year,_that.month);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? year,  int? month)  $default,) {final _that = this;
switch (_that) {
case _DashboardFilterRequest():
return $default(_that.year,_that.month);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? year,  int? month)?  $default,) {final _that = this;
switch (_that) {
case _DashboardFilterRequest() when $default != null:
return $default(_that.year,_that.month);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardFilterRequest extends DashboardFilterRequest {
  const _DashboardFilterRequest({this.year, this.month}): super._();
  factory _DashboardFilterRequest.fromJson(Map<String, dynamic> json) => _$DashboardFilterRequestFromJson(json);

@override final  int? year;
@override final  int? month;

/// Create a copy of DashboardFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardFilterRequestCopyWith<_DashboardFilterRequest> get copyWith => __$DashboardFilterRequestCopyWithImpl<_DashboardFilterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardFilterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardFilterRequest&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month);

@override
String toString() {
  return 'DashboardFilterRequest(year: $year, month: $month)';
}


}

/// @nodoc
abstract mixin class _$DashboardFilterRequestCopyWith<$Res> implements $DashboardFilterRequestCopyWith<$Res> {
  factory _$DashboardFilterRequestCopyWith(_DashboardFilterRequest value, $Res Function(_DashboardFilterRequest) _then) = __$DashboardFilterRequestCopyWithImpl;
@override @useResult
$Res call({
 int? year, int? month
});




}
/// @nodoc
class __$DashboardFilterRequestCopyWithImpl<$Res>
    implements _$DashboardFilterRequestCopyWith<$Res> {
  __$DashboardFilterRequestCopyWithImpl(this._self, this._then);

  final _DashboardFilterRequest _self;
  final $Res Function(_DashboardFilterRequest) _then;

/// Create a copy of DashboardFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = freezed,Object? month = freezed,}) {
  return _then(_DashboardFilterRequest(
year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
