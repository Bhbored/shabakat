// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_pricing_override_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerPricingOverrideDto {

 double? get price; double? get fixedCharge; double? get tva;
/// Create a copy of CustomerPricingOverrideDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerPricingOverrideDtoCopyWith<CustomerPricingOverrideDto> get copyWith => _$CustomerPricingOverrideDtoCopyWithImpl<CustomerPricingOverrideDto>(this as CustomerPricingOverrideDto, _$identity);

  /// Serializes this CustomerPricingOverrideDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerPricingOverrideDto&&(identical(other.price, price) || other.price == price)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,fixedCharge,tva);

@override
String toString() {
  return 'CustomerPricingOverrideDto(price: $price, fixedCharge: $fixedCharge, tva: $tva)';
}


}

/// @nodoc
abstract mixin class $CustomerPricingOverrideDtoCopyWith<$Res>  {
  factory $CustomerPricingOverrideDtoCopyWith(CustomerPricingOverrideDto value, $Res Function(CustomerPricingOverrideDto) _then) = _$CustomerPricingOverrideDtoCopyWithImpl;
@useResult
$Res call({
 double? price, double? fixedCharge, double? tva
});




}
/// @nodoc
class _$CustomerPricingOverrideDtoCopyWithImpl<$Res>
    implements $CustomerPricingOverrideDtoCopyWith<$Res> {
  _$CustomerPricingOverrideDtoCopyWithImpl(this._self, this._then);

  final CustomerPricingOverrideDto _self;
  final $Res Function(CustomerPricingOverrideDto) _then;

/// Create a copy of CustomerPricingOverrideDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = freezed,Object? fixedCharge = freezed,Object? tva = freezed,}) {
  return _then(_self.copyWith(
price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,fixedCharge: freezed == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double?,tva: freezed == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerPricingOverrideDto].
extension CustomerPricingOverrideDtoPatterns on CustomerPricingOverrideDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerPricingOverrideDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerPricingOverrideDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerPricingOverrideDto value)  $default,){
final _that = this;
switch (_that) {
case _CustomerPricingOverrideDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerPricingOverrideDto value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerPricingOverrideDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? price,  double? fixedCharge,  double? tva)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerPricingOverrideDto() when $default != null:
return $default(_that.price,_that.fixedCharge,_that.tva);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? price,  double? fixedCharge,  double? tva)  $default,) {final _that = this;
switch (_that) {
case _CustomerPricingOverrideDto():
return $default(_that.price,_that.fixedCharge,_that.tva);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? price,  double? fixedCharge,  double? tva)?  $default,) {final _that = this;
switch (_that) {
case _CustomerPricingOverrideDto() when $default != null:
return $default(_that.price,_that.fixedCharge,_that.tva);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerPricingOverrideDto implements CustomerPricingOverrideDto {
  const _CustomerPricingOverrideDto({this.price, this.fixedCharge, this.tva});
  factory _CustomerPricingOverrideDto.fromJson(Map<String, dynamic> json) => _$CustomerPricingOverrideDtoFromJson(json);

@override final  double? price;
@override final  double? fixedCharge;
@override final  double? tva;

/// Create a copy of CustomerPricingOverrideDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerPricingOverrideDtoCopyWith<_CustomerPricingOverrideDto> get copyWith => __$CustomerPricingOverrideDtoCopyWithImpl<_CustomerPricingOverrideDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerPricingOverrideDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerPricingOverrideDto&&(identical(other.price, price) || other.price == price)&&(identical(other.fixedCharge, fixedCharge) || other.fixedCharge == fixedCharge)&&(identical(other.tva, tva) || other.tva == tva));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,fixedCharge,tva);

@override
String toString() {
  return 'CustomerPricingOverrideDto(price: $price, fixedCharge: $fixedCharge, tva: $tva)';
}


}

/// @nodoc
abstract mixin class _$CustomerPricingOverrideDtoCopyWith<$Res> implements $CustomerPricingOverrideDtoCopyWith<$Res> {
  factory _$CustomerPricingOverrideDtoCopyWith(_CustomerPricingOverrideDto value, $Res Function(_CustomerPricingOverrideDto) _then) = __$CustomerPricingOverrideDtoCopyWithImpl;
@override @useResult
$Res call({
 double? price, double? fixedCharge, double? tva
});




}
/// @nodoc
class __$CustomerPricingOverrideDtoCopyWithImpl<$Res>
    implements _$CustomerPricingOverrideDtoCopyWith<$Res> {
  __$CustomerPricingOverrideDtoCopyWithImpl(this._self, this._then);

  final _CustomerPricingOverrideDto _self;
  final $Res Function(_CustomerPricingOverrideDto) _then;

/// Create a copy of CustomerPricingOverrideDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = freezed,Object? fixedCharge = freezed,Object? tva = freezed,}) {
  return _then(_CustomerPricingOverrideDto(
price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,fixedCharge: freezed == fixedCharge ? _self.fixedCharge : fixedCharge // ignore: cast_nullable_to_non_nullable
as double?,tva: freezed == tva ? _self.tva : tva // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
