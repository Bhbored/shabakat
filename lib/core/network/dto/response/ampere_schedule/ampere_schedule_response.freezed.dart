// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ampere_schedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AmpereScheduleResponse {

 String get id; String get name; int get hoursPerDay; double get pricePerAmp; double get residentialPricePerAmp; double get commercialPricePerAmp; double get industrialPricePerAmp; int get customerCount; bool get canBeDeleted; DateTime get createdAt;
/// Create a copy of AmpereScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmpereScheduleResponseCopyWith<AmpereScheduleResponse> get copyWith => _$AmpereScheduleResponseCopyWithImpl<AmpereScheduleResponse>(this as AmpereScheduleResponse, _$identity);

  /// Serializes this AmpereScheduleResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmpereScheduleResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.hoursPerDay, hoursPerDay) || other.hoursPerDay == hoursPerDay)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.residentialPricePerAmp, residentialPricePerAmp) || other.residentialPricePerAmp == residentialPricePerAmp)&&(identical(other.commercialPricePerAmp, commercialPricePerAmp) || other.commercialPricePerAmp == commercialPricePerAmp)&&(identical(other.industrialPricePerAmp, industrialPricePerAmp) || other.industrialPricePerAmp == industrialPricePerAmp)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.canBeDeleted, canBeDeleted) || other.canBeDeleted == canBeDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,hoursPerDay,pricePerAmp,residentialPricePerAmp,commercialPricePerAmp,industrialPricePerAmp,customerCount,canBeDeleted,createdAt);

@override
String toString() {
  return 'AmpereScheduleResponse(id: $id, name: $name, hoursPerDay: $hoursPerDay, pricePerAmp: $pricePerAmp, residentialPricePerAmp: $residentialPricePerAmp, commercialPricePerAmp: $commercialPricePerAmp, industrialPricePerAmp: $industrialPricePerAmp, customerCount: $customerCount, canBeDeleted: $canBeDeleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AmpereScheduleResponseCopyWith<$Res>  {
  factory $AmpereScheduleResponseCopyWith(AmpereScheduleResponse value, $Res Function(AmpereScheduleResponse) _then) = _$AmpereScheduleResponseCopyWithImpl;
@useResult
$Res call({
 String id, String name, int hoursPerDay, double pricePerAmp, double residentialPricePerAmp, double commercialPricePerAmp, double industrialPricePerAmp, int customerCount, bool canBeDeleted, DateTime createdAt
});




}
/// @nodoc
class _$AmpereScheduleResponseCopyWithImpl<$Res>
    implements $AmpereScheduleResponseCopyWith<$Res> {
  _$AmpereScheduleResponseCopyWithImpl(this._self, this._then);

  final AmpereScheduleResponse _self;
  final $Res Function(AmpereScheduleResponse) _then;

/// Create a copy of AmpereScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? hoursPerDay = null,Object? pricePerAmp = null,Object? residentialPricePerAmp = null,Object? commercialPricePerAmp = null,Object? industrialPricePerAmp = null,Object? customerCount = null,Object? canBeDeleted = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hoursPerDay: null == hoursPerDay ? _self.hoursPerDay : hoursPerDay // ignore: cast_nullable_to_non_nullable
as int,pricePerAmp: null == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double,residentialPricePerAmp: null == residentialPricePerAmp ? _self.residentialPricePerAmp : residentialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,commercialPricePerAmp: null == commercialPricePerAmp ? _self.commercialPricePerAmp : commercialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,industrialPricePerAmp: null == industrialPricePerAmp ? _self.industrialPricePerAmp : industrialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,canBeDeleted: null == canBeDeleted ? _self.canBeDeleted : canBeDeleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AmpereScheduleResponse].
extension AmpereScheduleResponsePatterns on AmpereScheduleResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmpereScheduleResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmpereScheduleResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmpereScheduleResponse value)  $default,){
final _that = this;
switch (_that) {
case _AmpereScheduleResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmpereScheduleResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AmpereScheduleResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int hoursPerDay,  double pricePerAmp,  double residentialPricePerAmp,  double commercialPricePerAmp,  double industrialPricePerAmp,  int customerCount,  bool canBeDeleted,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmpereScheduleResponse() when $default != null:
return $default(_that.id,_that.name,_that.hoursPerDay,_that.pricePerAmp,_that.residentialPricePerAmp,_that.commercialPricePerAmp,_that.industrialPricePerAmp,_that.customerCount,_that.canBeDeleted,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int hoursPerDay,  double pricePerAmp,  double residentialPricePerAmp,  double commercialPricePerAmp,  double industrialPricePerAmp,  int customerCount,  bool canBeDeleted,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AmpereScheduleResponse():
return $default(_that.id,_that.name,_that.hoursPerDay,_that.pricePerAmp,_that.residentialPricePerAmp,_that.commercialPricePerAmp,_that.industrialPricePerAmp,_that.customerCount,_that.canBeDeleted,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int hoursPerDay,  double pricePerAmp,  double residentialPricePerAmp,  double commercialPricePerAmp,  double industrialPricePerAmp,  int customerCount,  bool canBeDeleted,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AmpereScheduleResponse() when $default != null:
return $default(_that.id,_that.name,_that.hoursPerDay,_that.pricePerAmp,_that.residentialPricePerAmp,_that.commercialPricePerAmp,_that.industrialPricePerAmp,_that.customerCount,_that.canBeDeleted,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmpereScheduleResponse implements AmpereScheduleResponse {
  const _AmpereScheduleResponse({required this.id, required this.name, required this.hoursPerDay, required this.pricePerAmp, required this.residentialPricePerAmp, required this.commercialPricePerAmp, required this.industrialPricePerAmp, required this.customerCount, required this.canBeDeleted, required this.createdAt});
  factory _AmpereScheduleResponse.fromJson(Map<String, dynamic> json) => _$AmpereScheduleResponseFromJson(json);

@override final  String id;
@override final  String name;
@override final  int hoursPerDay;
@override final  double pricePerAmp;
@override final  double residentialPricePerAmp;
@override final  double commercialPricePerAmp;
@override final  double industrialPricePerAmp;
@override final  int customerCount;
@override final  bool canBeDeleted;
@override final  DateTime createdAt;

/// Create a copy of AmpereScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmpereScheduleResponseCopyWith<_AmpereScheduleResponse> get copyWith => __$AmpereScheduleResponseCopyWithImpl<_AmpereScheduleResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmpereScheduleResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmpereScheduleResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.hoursPerDay, hoursPerDay) || other.hoursPerDay == hoursPerDay)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.residentialPricePerAmp, residentialPricePerAmp) || other.residentialPricePerAmp == residentialPricePerAmp)&&(identical(other.commercialPricePerAmp, commercialPricePerAmp) || other.commercialPricePerAmp == commercialPricePerAmp)&&(identical(other.industrialPricePerAmp, industrialPricePerAmp) || other.industrialPricePerAmp == industrialPricePerAmp)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.canBeDeleted, canBeDeleted) || other.canBeDeleted == canBeDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,hoursPerDay,pricePerAmp,residentialPricePerAmp,commercialPricePerAmp,industrialPricePerAmp,customerCount,canBeDeleted,createdAt);

@override
String toString() {
  return 'AmpereScheduleResponse(id: $id, name: $name, hoursPerDay: $hoursPerDay, pricePerAmp: $pricePerAmp, residentialPricePerAmp: $residentialPricePerAmp, commercialPricePerAmp: $commercialPricePerAmp, industrialPricePerAmp: $industrialPricePerAmp, customerCount: $customerCount, canBeDeleted: $canBeDeleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AmpereScheduleResponseCopyWith<$Res> implements $AmpereScheduleResponseCopyWith<$Res> {
  factory _$AmpereScheduleResponseCopyWith(_AmpereScheduleResponse value, $Res Function(_AmpereScheduleResponse) _then) = __$AmpereScheduleResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int hoursPerDay, double pricePerAmp, double residentialPricePerAmp, double commercialPricePerAmp, double industrialPricePerAmp, int customerCount, bool canBeDeleted, DateTime createdAt
});




}
/// @nodoc
class __$AmpereScheduleResponseCopyWithImpl<$Res>
    implements _$AmpereScheduleResponseCopyWith<$Res> {
  __$AmpereScheduleResponseCopyWithImpl(this._self, this._then);

  final _AmpereScheduleResponse _self;
  final $Res Function(_AmpereScheduleResponse) _then;

/// Create a copy of AmpereScheduleResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? hoursPerDay = null,Object? pricePerAmp = null,Object? residentialPricePerAmp = null,Object? commercialPricePerAmp = null,Object? industrialPricePerAmp = null,Object? customerCount = null,Object? canBeDeleted = null,Object? createdAt = null,}) {
  return _then(_AmpereScheduleResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hoursPerDay: null == hoursPerDay ? _self.hoursPerDay : hoursPerDay // ignore: cast_nullable_to_non_nullable
as int,pricePerAmp: null == pricePerAmp ? _self.pricePerAmp : pricePerAmp // ignore: cast_nullable_to_non_nullable
as double,residentialPricePerAmp: null == residentialPricePerAmp ? _self.residentialPricePerAmp : residentialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,commercialPricePerAmp: null == commercialPricePerAmp ? _self.commercialPricePerAmp : commercialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,industrialPricePerAmp: null == industrialPricePerAmp ? _self.industrialPricePerAmp : industrialPricePerAmp // ignore: cast_nullable_to_non_nullable
as double,customerCount: null == customerCount ? _self.customerCount : customerCount // ignore: cast_nullable_to_non_nullable
as int,canBeDeleted: null == canBeDeleted ? _self.canBeDeleted : canBeDeleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
