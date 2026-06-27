// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_overview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceOverviewResponse {

 int get unpaidCount; double get unpaidTotal; int get partiallyPaidCount; double get partiallyPaidTotal; int get paidCount; double get paidTotal;
/// Create a copy of InvoiceOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceOverviewResponseCopyWith<InvoiceOverviewResponse> get copyWith => _$InvoiceOverviewResponseCopyWithImpl<InvoiceOverviewResponse>(this as InvoiceOverviewResponse, _$identity);

  /// Serializes this InvoiceOverviewResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceOverviewResponse&&(identical(other.unpaidCount, unpaidCount) || other.unpaidCount == unpaidCount)&&(identical(other.unpaidTotal, unpaidTotal) || other.unpaidTotal == unpaidTotal)&&(identical(other.partiallyPaidCount, partiallyPaidCount) || other.partiallyPaidCount == partiallyPaidCount)&&(identical(other.partiallyPaidTotal, partiallyPaidTotal) || other.partiallyPaidTotal == partiallyPaidTotal)&&(identical(other.paidCount, paidCount) || other.paidCount == paidCount)&&(identical(other.paidTotal, paidTotal) || other.paidTotal == paidTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unpaidCount,unpaidTotal,partiallyPaidCount,partiallyPaidTotal,paidCount,paidTotal);

@override
String toString() {
  return 'InvoiceOverviewResponse(unpaidCount: $unpaidCount, unpaidTotal: $unpaidTotal, partiallyPaidCount: $partiallyPaidCount, partiallyPaidTotal: $partiallyPaidTotal, paidCount: $paidCount, paidTotal: $paidTotal)';
}


}

/// @nodoc
abstract mixin class $InvoiceOverviewResponseCopyWith<$Res>  {
  factory $InvoiceOverviewResponseCopyWith(InvoiceOverviewResponse value, $Res Function(InvoiceOverviewResponse) _then) = _$InvoiceOverviewResponseCopyWithImpl;
@useResult
$Res call({
 int unpaidCount, double unpaidTotal, int partiallyPaidCount, double partiallyPaidTotal, int paidCount, double paidTotal
});




}
/// @nodoc
class _$InvoiceOverviewResponseCopyWithImpl<$Res>
    implements $InvoiceOverviewResponseCopyWith<$Res> {
  _$InvoiceOverviewResponseCopyWithImpl(this._self, this._then);

  final InvoiceOverviewResponse _self;
  final $Res Function(InvoiceOverviewResponse) _then;

/// Create a copy of InvoiceOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unpaidCount = null,Object? unpaidTotal = null,Object? partiallyPaidCount = null,Object? partiallyPaidTotal = null,Object? paidCount = null,Object? paidTotal = null,}) {
  return _then(_self.copyWith(
unpaidCount: null == unpaidCount ? _self.unpaidCount : unpaidCount // ignore: cast_nullable_to_non_nullable
as int,unpaidTotal: null == unpaidTotal ? _self.unpaidTotal : unpaidTotal // ignore: cast_nullable_to_non_nullable
as double,partiallyPaidCount: null == partiallyPaidCount ? _self.partiallyPaidCount : partiallyPaidCount // ignore: cast_nullable_to_non_nullable
as int,partiallyPaidTotal: null == partiallyPaidTotal ? _self.partiallyPaidTotal : partiallyPaidTotal // ignore: cast_nullable_to_non_nullable
as double,paidCount: null == paidCount ? _self.paidCount : paidCount // ignore: cast_nullable_to_non_nullable
as int,paidTotal: null == paidTotal ? _self.paidTotal : paidTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceOverviewResponse].
extension InvoiceOverviewResponsePatterns on InvoiceOverviewResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceOverviewResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceOverviewResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceOverviewResponse value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceOverviewResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceOverviewResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceOverviewResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int unpaidCount,  double unpaidTotal,  int partiallyPaidCount,  double partiallyPaidTotal,  int paidCount,  double paidTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceOverviewResponse() when $default != null:
return $default(_that.unpaidCount,_that.unpaidTotal,_that.partiallyPaidCount,_that.partiallyPaidTotal,_that.paidCount,_that.paidTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int unpaidCount,  double unpaidTotal,  int partiallyPaidCount,  double partiallyPaidTotal,  int paidCount,  double paidTotal)  $default,) {final _that = this;
switch (_that) {
case _InvoiceOverviewResponse():
return $default(_that.unpaidCount,_that.unpaidTotal,_that.partiallyPaidCount,_that.partiallyPaidTotal,_that.paidCount,_that.paidTotal);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int unpaidCount,  double unpaidTotal,  int partiallyPaidCount,  double partiallyPaidTotal,  int paidCount,  double paidTotal)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceOverviewResponse() when $default != null:
return $default(_that.unpaidCount,_that.unpaidTotal,_that.partiallyPaidCount,_that.partiallyPaidTotal,_that.paidCount,_that.paidTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceOverviewResponse implements InvoiceOverviewResponse {
  const _InvoiceOverviewResponse({this.unpaidCount = 0, this.unpaidTotal = 0.0, this.partiallyPaidCount = 0, this.partiallyPaidTotal = 0.0, this.paidCount = 0, this.paidTotal = 0.0});
  factory _InvoiceOverviewResponse.fromJson(Map<String, dynamic> json) => _$InvoiceOverviewResponseFromJson(json);

@override@JsonKey() final  int unpaidCount;
@override@JsonKey() final  double unpaidTotal;
@override@JsonKey() final  int partiallyPaidCount;
@override@JsonKey() final  double partiallyPaidTotal;
@override@JsonKey() final  int paidCount;
@override@JsonKey() final  double paidTotal;

/// Create a copy of InvoiceOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceOverviewResponseCopyWith<_InvoiceOverviewResponse> get copyWith => __$InvoiceOverviewResponseCopyWithImpl<_InvoiceOverviewResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceOverviewResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceOverviewResponse&&(identical(other.unpaidCount, unpaidCount) || other.unpaidCount == unpaidCount)&&(identical(other.unpaidTotal, unpaidTotal) || other.unpaidTotal == unpaidTotal)&&(identical(other.partiallyPaidCount, partiallyPaidCount) || other.partiallyPaidCount == partiallyPaidCount)&&(identical(other.partiallyPaidTotal, partiallyPaidTotal) || other.partiallyPaidTotal == partiallyPaidTotal)&&(identical(other.paidCount, paidCount) || other.paidCount == paidCount)&&(identical(other.paidTotal, paidTotal) || other.paidTotal == paidTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unpaidCount,unpaidTotal,partiallyPaidCount,partiallyPaidTotal,paidCount,paidTotal);

@override
String toString() {
  return 'InvoiceOverviewResponse(unpaidCount: $unpaidCount, unpaidTotal: $unpaidTotal, partiallyPaidCount: $partiallyPaidCount, partiallyPaidTotal: $partiallyPaidTotal, paidCount: $paidCount, paidTotal: $paidTotal)';
}


}

/// @nodoc
abstract mixin class _$InvoiceOverviewResponseCopyWith<$Res> implements $InvoiceOverviewResponseCopyWith<$Res> {
  factory _$InvoiceOverviewResponseCopyWith(_InvoiceOverviewResponse value, $Res Function(_InvoiceOverviewResponse) _then) = __$InvoiceOverviewResponseCopyWithImpl;
@override @useResult
$Res call({
 int unpaidCount, double unpaidTotal, int partiallyPaidCount, double partiallyPaidTotal, int paidCount, double paidTotal
});




}
/// @nodoc
class __$InvoiceOverviewResponseCopyWithImpl<$Res>
    implements _$InvoiceOverviewResponseCopyWith<$Res> {
  __$InvoiceOverviewResponseCopyWithImpl(this._self, this._then);

  final _InvoiceOverviewResponse _self;
  final $Res Function(_InvoiceOverviewResponse) _then;

/// Create a copy of InvoiceOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unpaidCount = null,Object? unpaidTotal = null,Object? partiallyPaidCount = null,Object? partiallyPaidTotal = null,Object? paidCount = null,Object? paidTotal = null,}) {
  return _then(_InvoiceOverviewResponse(
unpaidCount: null == unpaidCount ? _self.unpaidCount : unpaidCount // ignore: cast_nullable_to_non_nullable
as int,unpaidTotal: null == unpaidTotal ? _self.unpaidTotal : unpaidTotal // ignore: cast_nullable_to_non_nullable
as double,partiallyPaidCount: null == partiallyPaidCount ? _self.partiallyPaidCount : partiallyPaidCount // ignore: cast_nullable_to_non_nullable
as int,partiallyPaidTotal: null == partiallyPaidTotal ? _self.partiallyPaidTotal : partiallyPaidTotal // ignore: cast_nullable_to_non_nullable
as double,paidCount: null == paidCount ? _self.paidCount : paidCount // ignore: cast_nullable_to_non_nullable
as int,paidTotal: null == paidTotal ? _self.paidTotal : paidTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
