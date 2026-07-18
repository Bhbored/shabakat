// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceFilterRequest {

 String? get customerId; InvoiceStatus? get invoiceStatus;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get consumptionStartFrom;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get consumptionStartTo; int get pageNumber; int get pageSize;
/// Create a copy of InvoiceFilterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceFilterRequestCopyWith<InvoiceFilterRequest> get copyWith => _$InvoiceFilterRequestCopyWithImpl<InvoiceFilterRequest>(this as InvoiceFilterRequest, _$identity);

  /// Serializes this InvoiceFilterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceFilterRequest&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus)&&(identical(other.consumptionStartFrom, consumptionStartFrom) || other.consumptionStartFrom == consumptionStartFrom)&&(identical(other.consumptionStartTo, consumptionStartTo) || other.consumptionStartTo == consumptionStartTo)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,invoiceStatus,consumptionStartFrom,consumptionStartTo,pageNumber,pageSize);

@override
String toString() {
  return 'InvoiceFilterRequest(customerId: $customerId, invoiceStatus: $invoiceStatus, consumptionStartFrom: $consumptionStartFrom, consumptionStartTo: $consumptionStartTo, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $InvoiceFilterRequestCopyWith<$Res>  {
  factory $InvoiceFilterRequestCopyWith(InvoiceFilterRequest value, $Res Function(InvoiceFilterRequest) _then) = _$InvoiceFilterRequestCopyWithImpl;
@useResult
$Res call({
 String? customerId, InvoiceStatus? invoiceStatus,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? consumptionStartFrom,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? consumptionStartTo, int pageNumber, int pageSize
});




}
/// @nodoc
class _$InvoiceFilterRequestCopyWithImpl<$Res>
    implements $InvoiceFilterRequestCopyWith<$Res> {
  _$InvoiceFilterRequestCopyWithImpl(this._self, this._then);

  final InvoiceFilterRequest _self;
  final $Res Function(InvoiceFilterRequest) _then;

/// Create a copy of InvoiceFilterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = freezed,Object? invoiceStatus = freezed,Object? consumptionStartFrom = freezed,Object? consumptionStartTo = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,invoiceStatus: freezed == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as InvoiceStatus?,consumptionStartFrom: freezed == consumptionStartFrom ? _self.consumptionStartFrom : consumptionStartFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,consumptionStartTo: freezed == consumptionStartTo ? _self.consumptionStartTo : consumptionStartTo // ignore: cast_nullable_to_non_nullable
as DateTime?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceFilterRequest].
extension InvoiceFilterRequestPatterns on InvoiceFilterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceFilterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceFilterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceFilterRequest value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceFilterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceFilterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceFilterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? customerId,  InvoiceStatus? invoiceStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStartFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStartTo,  int pageNumber,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceFilterRequest() when $default != null:
return $default(_that.customerId,_that.invoiceStatus,_that.consumptionStartFrom,_that.consumptionStartTo,_that.pageNumber,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? customerId,  InvoiceStatus? invoiceStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStartFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStartTo,  int pageNumber,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _InvoiceFilterRequest():
return $default(_that.customerId,_that.invoiceStatus,_that.consumptionStartFrom,_that.consumptionStartTo,_that.pageNumber,_that.pageSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? customerId,  InvoiceStatus? invoiceStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStartFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? consumptionStartTo,  int pageNumber,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceFilterRequest() when $default != null:
return $default(_that.customerId,_that.invoiceStatus,_that.consumptionStartFrom,_that.consumptionStartTo,_that.pageNumber,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceFilterRequest implements InvoiceFilterRequest {
  const _InvoiceFilterRequest({this.customerId, this.invoiceStatus, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.consumptionStartFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.consumptionStartTo, this.pageNumber = 1, this.pageSize = 10});
  factory _InvoiceFilterRequest.fromJson(Map<String, dynamic> json) => _$InvoiceFilterRequestFromJson(json);

@override final  String? customerId;
@override final  InvoiceStatus? invoiceStatus;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? consumptionStartFrom;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? consumptionStartTo;
@override@JsonKey() final  int pageNumber;
@override@JsonKey() final  int pageSize;

/// Create a copy of InvoiceFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceFilterRequestCopyWith<_InvoiceFilterRequest> get copyWith => __$InvoiceFilterRequestCopyWithImpl<_InvoiceFilterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceFilterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceFilterRequest&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.invoiceStatus, invoiceStatus) || other.invoiceStatus == invoiceStatus)&&(identical(other.consumptionStartFrom, consumptionStartFrom) || other.consumptionStartFrom == consumptionStartFrom)&&(identical(other.consumptionStartTo, consumptionStartTo) || other.consumptionStartTo == consumptionStartTo)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,invoiceStatus,consumptionStartFrom,consumptionStartTo,pageNumber,pageSize);

@override
String toString() {
  return 'InvoiceFilterRequest(customerId: $customerId, invoiceStatus: $invoiceStatus, consumptionStartFrom: $consumptionStartFrom, consumptionStartTo: $consumptionStartTo, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$InvoiceFilterRequestCopyWith<$Res> implements $InvoiceFilterRequestCopyWith<$Res> {
  factory _$InvoiceFilterRequestCopyWith(_InvoiceFilterRequest value, $Res Function(_InvoiceFilterRequest) _then) = __$InvoiceFilterRequestCopyWithImpl;
@override @useResult
$Res call({
 String? customerId, InvoiceStatus? invoiceStatus,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? consumptionStartFrom,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? consumptionStartTo, int pageNumber, int pageSize
});




}
/// @nodoc
class __$InvoiceFilterRequestCopyWithImpl<$Res>
    implements _$InvoiceFilterRequestCopyWith<$Res> {
  __$InvoiceFilterRequestCopyWithImpl(this._self, this._then);

  final _InvoiceFilterRequest _self;
  final $Res Function(_InvoiceFilterRequest) _then;

/// Create a copy of InvoiceFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = freezed,Object? invoiceStatus = freezed,Object? consumptionStartFrom = freezed,Object? consumptionStartTo = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_InvoiceFilterRequest(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,invoiceStatus: freezed == invoiceStatus ? _self.invoiceStatus : invoiceStatus // ignore: cast_nullable_to_non_nullable
as InvoiceStatus?,consumptionStartFrom: freezed == consumptionStartFrom ? _self.consumptionStartFrom : consumptionStartFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,consumptionStartTo: freezed == consumptionStartTo ? _self.consumptionStartTo : consumptionStartTo // ignore: cast_nullable_to_non_nullable
as DateTime?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
