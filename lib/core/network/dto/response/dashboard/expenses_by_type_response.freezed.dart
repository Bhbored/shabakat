// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_by_type_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpensesByTypeResponse {

 double get fuel; double get maintenance; double get employees; double get other;
/// Create a copy of ExpensesByTypeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesByTypeResponseCopyWith<ExpensesByTypeResponse> get copyWith => _$ExpensesByTypeResponseCopyWithImpl<ExpensesByTypeResponse>(this as ExpensesByTypeResponse, _$identity);

  /// Serializes this ExpensesByTypeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesByTypeResponse&&(identical(other.fuel, fuel) || other.fuel == fuel)&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.employees, employees) || other.employees == employees)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fuel,maintenance,employees,other);

@override
String toString() {
  return 'ExpensesByTypeResponse(fuel: $fuel, maintenance: $maintenance, employees: $employees, other: $other)';
}


}

/// @nodoc
abstract mixin class $ExpensesByTypeResponseCopyWith<$Res>  {
  factory $ExpensesByTypeResponseCopyWith(ExpensesByTypeResponse value, $Res Function(ExpensesByTypeResponse) _then) = _$ExpensesByTypeResponseCopyWithImpl;
@useResult
$Res call({
 double fuel, double maintenance, double employees, double other
});




}
/// @nodoc
class _$ExpensesByTypeResponseCopyWithImpl<$Res>
    implements $ExpensesByTypeResponseCopyWith<$Res> {
  _$ExpensesByTypeResponseCopyWithImpl(this._self, this._then);

  final ExpensesByTypeResponse _self;
  final $Res Function(ExpensesByTypeResponse) _then;

/// Create a copy of ExpensesByTypeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fuel = null,Object? maintenance = null,Object? employees = null,Object? other = null,}) {
  return _then(_self.copyWith(
fuel: null == fuel ? _self.fuel : fuel // ignore: cast_nullable_to_non_nullable
as double,maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as double,employees: null == employees ? _self.employees : employees // ignore: cast_nullable_to_non_nullable
as double,other: null == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpensesByTypeResponse].
extension ExpensesByTypeResponsePatterns on ExpensesByTypeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpensesByTypeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpensesByTypeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpensesByTypeResponse value)  $default,){
final _that = this;
switch (_that) {
case _ExpensesByTypeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpensesByTypeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ExpensesByTypeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double fuel,  double maintenance,  double employees,  double other)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpensesByTypeResponse() when $default != null:
return $default(_that.fuel,_that.maintenance,_that.employees,_that.other);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double fuel,  double maintenance,  double employees,  double other)  $default,) {final _that = this;
switch (_that) {
case _ExpensesByTypeResponse():
return $default(_that.fuel,_that.maintenance,_that.employees,_that.other);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double fuel,  double maintenance,  double employees,  double other)?  $default,) {final _that = this;
switch (_that) {
case _ExpensesByTypeResponse() when $default != null:
return $default(_that.fuel,_that.maintenance,_that.employees,_that.other);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpensesByTypeResponse implements ExpensesByTypeResponse {
  const _ExpensesByTypeResponse({this.fuel = 0.0, this.maintenance = 0.0, this.employees = 0.0, this.other = 0.0});
  factory _ExpensesByTypeResponse.fromJson(Map<String, dynamic> json) => _$ExpensesByTypeResponseFromJson(json);

@override@JsonKey() final  double fuel;
@override@JsonKey() final  double maintenance;
@override@JsonKey() final  double employees;
@override@JsonKey() final  double other;

/// Create a copy of ExpensesByTypeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpensesByTypeResponseCopyWith<_ExpensesByTypeResponse> get copyWith => __$ExpensesByTypeResponseCopyWithImpl<_ExpensesByTypeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpensesByTypeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpensesByTypeResponse&&(identical(other.fuel, fuel) || other.fuel == fuel)&&(identical(other.maintenance, maintenance) || other.maintenance == maintenance)&&(identical(other.employees, employees) || other.employees == employees)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fuel,maintenance,employees,other);

@override
String toString() {
  return 'ExpensesByTypeResponse(fuel: $fuel, maintenance: $maintenance, employees: $employees, other: $other)';
}


}

/// @nodoc
abstract mixin class _$ExpensesByTypeResponseCopyWith<$Res> implements $ExpensesByTypeResponseCopyWith<$Res> {
  factory _$ExpensesByTypeResponseCopyWith(_ExpensesByTypeResponse value, $Res Function(_ExpensesByTypeResponse) _then) = __$ExpensesByTypeResponseCopyWithImpl;
@override @useResult
$Res call({
 double fuel, double maintenance, double employees, double other
});




}
/// @nodoc
class __$ExpensesByTypeResponseCopyWithImpl<$Res>
    implements _$ExpensesByTypeResponseCopyWith<$Res> {
  __$ExpensesByTypeResponseCopyWithImpl(this._self, this._then);

  final _ExpensesByTypeResponse _self;
  final $Res Function(_ExpensesByTypeResponse) _then;

/// Create a copy of ExpensesByTypeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fuel = null,Object? maintenance = null,Object? employees = null,Object? other = null,}) {
  return _then(_ExpensesByTypeResponse(
fuel: null == fuel ? _self.fuel : fuel // ignore: cast_nullable_to_non_nullable
as double,maintenance: null == maintenance ? _self.maintenance : maintenance // ignore: cast_nullable_to_non_nullable
as double,employees: null == employees ? _self.employees : employees // ignore: cast_nullable_to_non_nullable
as double,other: null == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
