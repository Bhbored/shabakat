// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_create_invoice_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BulkCreateInvoiceRequest {

@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime get dueDate;@JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson) DateTime? get issueDate;
/// Create a copy of BulkCreateInvoiceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulkCreateInvoiceRequestCopyWith<BulkCreateInvoiceRequest> get copyWith => _$BulkCreateInvoiceRequestCopyWithImpl<BulkCreateInvoiceRequest>(this as BulkCreateInvoiceRequest, _$identity);

  /// Serializes this BulkCreateInvoiceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkCreateInvoiceRequest&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dueDate,issueDate);

@override
String toString() {
  return 'BulkCreateInvoiceRequest(dueDate: $dueDate, issueDate: $issueDate)';
}


}

/// @nodoc
abstract mixin class $BulkCreateInvoiceRequestCopyWith<$Res>  {
  factory $BulkCreateInvoiceRequestCopyWith(BulkCreateInvoiceRequest value, $Res Function(BulkCreateInvoiceRequest) _then) = _$BulkCreateInvoiceRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime dueDate,@JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson) DateTime? issueDate
});




}
/// @nodoc
class _$BulkCreateInvoiceRequestCopyWithImpl<$Res>
    implements $BulkCreateInvoiceRequestCopyWith<$Res> {
  _$BulkCreateInvoiceRequestCopyWithImpl(this._self, this._then);

  final BulkCreateInvoiceRequest _self;
  final $Res Function(BulkCreateInvoiceRequest) _then;

/// Create a copy of BulkCreateInvoiceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dueDate = null,Object? issueDate = freezed,}) {
  return _then(_self.copyWith(
dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,issueDate: freezed == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BulkCreateInvoiceRequest].
extension BulkCreateInvoiceRequestPatterns on BulkCreateInvoiceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BulkCreateInvoiceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BulkCreateInvoiceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BulkCreateInvoiceRequest value)  $default,){
final _that = this;
switch (_that) {
case _BulkCreateInvoiceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BulkCreateInvoiceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BulkCreateInvoiceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate, @JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson)  DateTime? issueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BulkCreateInvoiceRequest() when $default != null:
return $default(_that.dueDate,_that.issueDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate, @JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson)  DateTime? issueDate)  $default,) {final _that = this;
switch (_that) {
case _BulkCreateInvoiceRequest():
return $default(_that.dueDate,_that.issueDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime dueDate, @JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson)  DateTime? issueDate)?  $default,) {final _that = this;
switch (_that) {
case _BulkCreateInvoiceRequest() when $default != null:
return $default(_that.dueDate,_that.issueDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BulkCreateInvoiceRequest implements BulkCreateInvoiceRequest {
  const _BulkCreateInvoiceRequest({@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) required this.dueDate, @JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson) this.issueDate});
  factory _BulkCreateInvoiceRequest.fromJson(Map<String, dynamic> json) => _$BulkCreateInvoiceRequestFromJson(json);

@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime dueDate;
@override@JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson) final  DateTime? issueDate;

/// Create a copy of BulkCreateInvoiceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BulkCreateInvoiceRequestCopyWith<_BulkCreateInvoiceRequest> get copyWith => __$BulkCreateInvoiceRequestCopyWithImpl<_BulkCreateInvoiceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BulkCreateInvoiceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BulkCreateInvoiceRequest&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dueDate,issueDate);

@override
String toString() {
  return 'BulkCreateInvoiceRequest(dueDate: $dueDate, issueDate: $issueDate)';
}


}

/// @nodoc
abstract mixin class _$BulkCreateInvoiceRequestCopyWith<$Res> implements $BulkCreateInvoiceRequestCopyWith<$Res> {
  factory _$BulkCreateInvoiceRequestCopyWith(_BulkCreateInvoiceRequest value, $Res Function(_BulkCreateInvoiceRequest) _then) = __$BulkCreateInvoiceRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime dueDate,@JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson) DateTime? issueDate
});




}
/// @nodoc
class __$BulkCreateInvoiceRequestCopyWithImpl<$Res>
    implements _$BulkCreateInvoiceRequestCopyWith<$Res> {
  __$BulkCreateInvoiceRequestCopyWithImpl(this._self, this._then);

  final _BulkCreateInvoiceRequest _self;
  final $Res Function(_BulkCreateInvoiceRequest) _then;

/// Create a copy of BulkCreateInvoiceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dueDate = null,Object? issueDate = freezed,}) {
  return _then(_BulkCreateInvoiceRequest(
dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,issueDate: freezed == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
