// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_ampere_schedule_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateAmpereScheduleRequest {

 String get name; int get hoursPerDay; double? get pricePerAmp; double? get residentialPricePerAmp; double? get commercialPricePerAmp; double? get industrialPricePerAmp;
/// Create a copy of UpdateAmpereScheduleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAmpereScheduleRequestCopyWith<UpdateAmpereScheduleRequest> get copyWith => _$UpdateAmpereScheduleRequestCopyWithImpl<UpdateAmpereScheduleRequest>(this as UpdateAmpereScheduleRequest, _$identity);

  /// Serializes this UpdateAmpereScheduleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAmpereScheduleRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.hoursPerDay, hoursPerDay) || other.hoursPerDay == hoursPerDay)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.residentialPricePerAmp, residentialPricePerAmp) || other.residentialPricePerAmp == residentialPricePerAmp)&&(identical(other.commercialPricePerAmp, commercialPricePerAmp) || other.commercialPricePerAmp == commercialPricePerAmp)&&(identical(other.industrialPricePerAmp, industrialPricePerAmp) || other.industrialPricePerAmp == industrialPricePerAmp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,hoursPerDay,pricePerAmp,residentialPricePerAmp,commercialPricePerAmp,industrialPricePerAmp);

@override
String toString() {
  return 'UpdateAmpereScheduleRequest(name: $name, hoursPerDay: $hoursPerDay, pricePerAmp: $pricePerAmp, residentialPricePerAmp: $residentialPricePerAmp, commercialPricePerAmp: $commercialPricePerAmp, industrialPricePerAmp: $industrialPricePerAmp)';
}


}

/// @nodoc
abstract mixin class $UpdateAmpereScheduleRequestCopyWith<$Res>  {
  factory $UpdateAmpereScheduleRequestCopyWith(UpdateAmpereScheduleRequest value, $Res Function(UpdateAmpereScheduleRequest) _then) = _$UpdateAmpereScheduleRequestCopyWithImpl;
@useResult
$Res call({
 String name, int hoursPerDay, double? pricePerAmp, double? residentialPricePerAmp, double? commercialPricePerAmp, double? industrialPricePerAmp
});




}
/// @nodoc
class _$UpdateAmpereScheduleRequestCopyWithImpl<$Res>
    implements $UpdateAmpereScheduleRequestCopyWith<$Res> {
  _$UpdateAmpereScheduleRequestCopyWithImpl(this._self, this._then);

  final UpdateAmpereScheduleRequest _self;
  final $Res Function(UpdateAmpereScheduleRequest) _then;

/// Create a copy of UpdateAmpereScheduleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? hoursPerDay = null,Object? pricePerAmp = freezed,Object? residentialPricePerAmp = freezed,Object? commercialPricePerAmp = freezed,Object? industrialPricePerAmp = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hoursPerDay: null == hoursPerDay ? _self.hoursPerDay : hoursPerDay // ignore: cast_nullable_to_non_nullable
as int,pricePerAmp: freezed == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double?,residentialPricePerAmp: freezed == residentialPricePerAmp ? _self.residentialPricePerAmp : residentialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double?,commercialPricePerAmp: freezed == commercialPricePerAmp ? _self.commercialPricePerAmp : commercialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double?,industrialPricePerAmp: freezed == industrialPricePerAmp ? _self.industrialPricePerAmp : industrialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAmpereScheduleRequest].
extension UpdateAmpereScheduleRequestPatterns on UpdateAmpereScheduleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAmpereScheduleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAmpereScheduleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAmpereScheduleRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAmpereScheduleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAmpereScheduleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAmpereScheduleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int hoursPerDay,  double? pricePerAmp,  double? residentialPricePerAmp,  double? commercialPricePerAmp,  double? industrialPricePerAmp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAmpereScheduleRequest() when $default != null:
return $default(_that.name,_that.hoursPerDay,_that.pricePerAmp,_that.residentialPricePerAmp,_that.commercialPricePerAmp,_that.industrialPricePerAmp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int hoursPerDay,  double? pricePerAmp,  double? residentialPricePerAmp,  double? commercialPricePerAmp,  double? industrialPricePerAmp)  $default,) {final _that = this;
switch (_that) {
case _UpdateAmpereScheduleRequest():
return $default(_that.name,_that.hoursPerDay,_that.pricePerAmp,_that.residentialPricePerAmp,_that.commercialPricePerAmp,_that.industrialPricePerAmp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int hoursPerDay,  double? pricePerAmp,  double? residentialPricePerAmp,  double? commercialPricePerAmp,  double? industrialPricePerAmp)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAmpereScheduleRequest() when $default != null:
return $default(_that.name,_that.hoursPerDay,_that.pricePerAmp,_that.residentialPricePerAmp,_that.commercialPricePerAmp,_that.industrialPricePerAmp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateAmpereScheduleRequest implements UpdateAmpereScheduleRequest {
  const _UpdateAmpereScheduleRequest({required this.name, required this.hoursPerDay, this.pricePerAmp, this.residentialPricePerAmp, this.commercialPricePerAmp, this.industrialPricePerAmp});
  factory _UpdateAmpereScheduleRequest.fromJson(Map<String, dynamic> json) => _$UpdateAmpereScheduleRequestFromJson(json);

@override final  String name;
@override final  int hoursPerDay;
@override final  double? pricePerAmp;
@override final  double? residentialPricePerAmp;
@override final  double? commercialPricePerAmp;
@override final  double? industrialPricePerAmp;

/// Create a copy of UpdateAmpereScheduleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAmpereScheduleRequestCopyWith<_UpdateAmpereScheduleRequest> get copyWith => __$UpdateAmpereScheduleRequestCopyWithImpl<_UpdateAmpereScheduleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAmpereScheduleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAmpereScheduleRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.hoursPerDay, hoursPerDay) || other.hoursPerDay == hoursPerDay)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.residentialPricePerAmp, residentialPricePerAmp) || other.residentialPricePerAmp == residentialPricePerAmp)&&(identical(other.commercialPricePerAmp, commercialPricePerAmp) || other.commercialPricePerAmp == commercialPricePerAmp)&&(identical(other.industrialPricePerAmp, industrialPricePerAmp) || other.industrialPricePerAmp == industrialPricePerAmp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,hoursPerDay,pricePerAmp,residentialPricePerAmp,commercialPricePerAmp,industrialPricePerAmp);

@override
String toString() {
  return 'UpdateAmpereScheduleRequest(name: $name, hoursPerDay: $hoursPerDay, pricePerAmp: $pricePerAmp, residentialPricePerAmp: $residentialPricePerAmp, commercialPricePerAmp: $commercialPricePerAmp, industrialPricePerAmp: $industrialPricePerAmp)';
}


}

/// @nodoc
abstract mixin class _$UpdateAmpereScheduleRequestCopyWith<$Res> implements $UpdateAmpereScheduleRequestCopyWith<$Res> {
  factory _$UpdateAmpereScheduleRequestCopyWith(_UpdateAmpereScheduleRequest value, $Res Function(_UpdateAmpereScheduleRequest) _then) = __$UpdateAmpereScheduleRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, int hoursPerDay, double? pricePerAmp, double? residentialPricePerAmp, double? commercialPricePerAmp, double? industrialPricePerAmp
});




}
/// @nodoc
class __$UpdateAmpereScheduleRequestCopyWithImpl<$Res>
    implements _$UpdateAmpereScheduleRequestCopyWith<$Res> {
  __$UpdateAmpereScheduleRequestCopyWithImpl(this._self, this._then);

  final _UpdateAmpereScheduleRequest _self;
  final $Res Function(_UpdateAmpereScheduleRequest) _then;

/// Create a copy of UpdateAmpereScheduleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? hoursPerDay = null,Object? pricePerAmp = freezed,Object? residentialPricePerAmp = freezed,Object? commercialPricePerAmp = freezed,Object? industrialPricePerAmp = freezed,}) {
  return _then(_UpdateAmpereScheduleRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hoursPerDay: null == hoursPerDay ? _self.hoursPerDay : hoursPerDay // ignore: cast_nullable_to_non_nullable
as int,pricePerAmp: freezed == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double?,residentialPricePerAmp: freezed == residentialPricePerAmp ? _self.residentialPricePerAmp : residentialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double?,commercialPricePerAmp: freezed == commercialPricePerAmp ? _self.commercialPricePerAmp : commercialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double?,industrialPricePerAmp: freezed == industrialPricePerAmp ? _self.industrialPricePerAmp : industrialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
