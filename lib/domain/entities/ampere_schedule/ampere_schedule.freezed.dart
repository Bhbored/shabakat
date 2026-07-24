// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ampere_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AmpereSchedule {

 String get id; String get name; int get hoursPerDay; double get pricePerAmp; double get residentialPricePerAmp; double get commercialPricePerAmp; double get industrialPricePerAmp; int get customerCount; bool get canBeDeleted; DateTime get createdAt;
/// Create a copy of AmpereSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmpereScheduleCopyWith<AmpereSchedule> get copyWith => _$AmpereScheduleCopyWithImpl<AmpereSchedule>(this as AmpereSchedule, _$identity);

  /// Serializes this AmpereSchedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmpereSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.hoursPerDay, hoursPerDay) || other.hoursPerDay == hoursPerDay)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.residentialPricePerAmp, residentialPricePerAmp) || other.residentialPricePerAmp == residentialPricePerAmp)&&(identical(other.commercialPricePerAmp, commercialPricePerAmp) || other.commercialPricePerAmp == commercialPricePerAmp)&&(identical(other.industrialPricePerAmp, industrialPricePerAmp) || other.industrialPricePerAmp == industrialPricePerAmp)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.canBeDeleted, canBeDeleted) || other.canBeDeleted == canBeDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,hoursPerDay,pricePerAmp,residentialPricePerAmp,commercialPricePerAmp,industrialPricePerAmp,customerCount,canBeDeleted,createdAt);

@override
String toString() {
  return 'AmpereSchedule(id: $id, name: $name, hoursPerDay: $hoursPerDay, pricePerAmp: $pricePerAmp, residentialPricePerAmp: $residentialPricePerAmp, commercialPricePerAmp: $commercialPricePerAmp, industrialPricePerAmp: $industrialPricePerAmp, customerCount: $customerCount, canBeDeleted: $canBeDeleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AmpereScheduleCopyWith<$Res>  {
  factory $AmpereScheduleCopyWith(AmpereSchedule value, $Res Function(AmpereSchedule) _then) = _$AmpereScheduleCopyWithImpl;
@useResult
$Res call({
 String id, String name, int hoursPerDay, double pricePerAmp, double residentialPricePerAmp, double commercialPricePerAmp, double industrialPricePerAmp, int customerCount, bool canBeDeleted, DateTime createdAt
});




}
/// @nodoc
class _$AmpereScheduleCopyWithImpl<$Res>
    implements $AmpereScheduleCopyWith<$Res> {
  _$AmpereScheduleCopyWithImpl(this._self, this._then);

  final AmpereSchedule _self;
  final $Res Function(AmpereSchedule) _then;

/// Create a copy of AmpereSchedule
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


/// Adds pattern-matching-related methods to [AmpereSchedule].
extension AmpereSchedulePatterns on AmpereSchedule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmpereSchedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmpereSchedule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmpereSchedule value)  $default,){
final _that = this;
switch (_that) {
case _AmpereSchedule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmpereSchedule value)?  $default,){
final _that = this;
switch (_that) {
case _AmpereSchedule() when $default != null:
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
case _AmpereSchedule() when $default != null:
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
case _AmpereSchedule():
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
case _AmpereSchedule() when $default != null:
return $default(_that.id,_that.name,_that.hoursPerDay,_that.pricePerAmp,_that.residentialPricePerAmp,_that.commercialPricePerAmp,_that.industrialPricePerAmp,_that.customerCount,_that.canBeDeleted,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmpereSchedule implements AmpereSchedule {
  const _AmpereSchedule({required this.id, required this.name, required this.hoursPerDay, required this.pricePerAmp, this.residentialPricePerAmp = 0, this.commercialPricePerAmp = 0, this.industrialPricePerAmp = 0, this.customerCount = 0, this.canBeDeleted = true, required this.createdAt});
  factory _AmpereSchedule.fromJson(Map<String, dynamic> json) => _$AmpereScheduleFromJson(json);

@override final  String id;
@override final  String name;
@override final  int hoursPerDay;
@override final  double pricePerAmp;
@override@JsonKey() final  double residentialPricePerAmp;
@override@JsonKey() final  double commercialPricePerAmp;
@override@JsonKey() final  double industrialPricePerAmp;
@override@JsonKey() final  int customerCount;
@override@JsonKey() final  bool canBeDeleted;
@override final  DateTime createdAt;

/// Create a copy of AmpereSchedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmpereScheduleCopyWith<_AmpereSchedule> get copyWith => __$AmpereScheduleCopyWithImpl<_AmpereSchedule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmpereScheduleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmpereSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.hoursPerDay, hoursPerDay) || other.hoursPerDay == hoursPerDay)&&(identical(other.pricePerAmp, pricePerAmp) || other.pricePerAmp == pricePerAmp)&&(identical(other.residentialPricePerAmp, residentialPricePerAmp) || other.residentialPricePerAmp == residentialPricePerAmp)&&(identical(other.commercialPricePerAmp, commercialPricePerAmp) || other.commercialPricePerAmp == commercialPricePerAmp)&&(identical(other.industrialPricePerAmp, industrialPricePerAmp) || other.industrialPricePerAmp == industrialPricePerAmp)&&(identical(other.customerCount, customerCount) || other.customerCount == customerCount)&&(identical(other.canBeDeleted, canBeDeleted) || other.canBeDeleted == canBeDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,hoursPerDay,pricePerAmp,residentialPricePerAmp,commercialPricePerAmp,industrialPricePerAmp,customerCount,canBeDeleted,createdAt);

@override
String toString() {
  return 'AmpereSchedule(id: $id, name: $name, hoursPerDay: $hoursPerDay, pricePerAmp: $pricePerAmp, residentialPricePerAmp: $residentialPricePerAmp, commercialPricePerAmp: $commercialPricePerAmp, industrialPricePerAmp: $industrialPricePerAmp, customerCount: $customerCount, canBeDeleted: $canBeDeleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AmpereScheduleCopyWith<$Res> implements $AmpereScheduleCopyWith<$Res> {
  factory _$AmpereScheduleCopyWith(_AmpereSchedule value, $Res Function(_AmpereSchedule) _then) = __$AmpereScheduleCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int hoursPerDay, double pricePerAmp, double residentialPricePerAmp, double commercialPricePerAmp, double industrialPricePerAmp, int customerCount, bool canBeDeleted, DateTime createdAt
});




}
/// @nodoc
class __$AmpereScheduleCopyWithImpl<$Res>
    implements _$AmpereScheduleCopyWith<$Res> {
  __$AmpereScheduleCopyWithImpl(this._self, this._then);

  final _AmpereSchedule _self;
  final $Res Function(_AmpereSchedule) _then;

/// Create a copy of AmpereSchedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? hoursPerDay = null,Object? pricePerAmp = null,Object? residentialPricePerAmp = null,Object? commercialPricePerAmp = null,Object? industrialPricePerAmp = null,Object? customerCount = null,Object? canBeDeleted = null,Object? createdAt = null,}) {
  return _then(_AmpereSchedule(
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
