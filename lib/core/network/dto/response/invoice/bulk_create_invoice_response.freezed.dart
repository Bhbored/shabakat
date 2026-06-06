// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bulk_create_invoice_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BulkCreateInvoiceResponse {

 int get created; int get skipped; String get message;
/// Create a copy of BulkCreateInvoiceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulkCreateInvoiceResponseCopyWith<BulkCreateInvoiceResponse> get copyWith => _$BulkCreateInvoiceResponseCopyWithImpl<BulkCreateInvoiceResponse>(this as BulkCreateInvoiceResponse, _$identity);

  /// Serializes this BulkCreateInvoiceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkCreateInvoiceResponse&&(identical(other.created, created) || other.created == created)&&(identical(other.skipped, skipped) || other.skipped == skipped)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,created,skipped,message);

@override
String toString() {
  return 'BulkCreateInvoiceResponse(created: $created, skipped: $skipped, message: $message)';
}


}

/// @nodoc
abstract mixin class $BulkCreateInvoiceResponseCopyWith<$Res>  {
  factory $BulkCreateInvoiceResponseCopyWith(BulkCreateInvoiceResponse value, $Res Function(BulkCreateInvoiceResponse) _then) = _$BulkCreateInvoiceResponseCopyWithImpl;
@useResult
$Res call({
 int created, int skipped, String message
});




}
/// @nodoc
class _$BulkCreateInvoiceResponseCopyWithImpl<$Res>
    implements $BulkCreateInvoiceResponseCopyWith<$Res> {
  _$BulkCreateInvoiceResponseCopyWithImpl(this._self, this._then);

  final BulkCreateInvoiceResponse _self;
  final $Res Function(BulkCreateInvoiceResponse) _then;

/// Create a copy of BulkCreateInvoiceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? created = null,Object? skipped = null,Object? message = null,}) {
  return _then(_self.copyWith(
created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BulkCreateInvoiceResponse].
extension BulkCreateInvoiceResponsePatterns on BulkCreateInvoiceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BulkCreateInvoiceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BulkCreateInvoiceResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BulkCreateInvoiceResponse value)  $default,){
final _that = this;
switch (_that) {
case _BulkCreateInvoiceResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BulkCreateInvoiceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BulkCreateInvoiceResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int created,  int skipped,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BulkCreateInvoiceResponse() when $default != null:
return $default(_that.created,_that.skipped,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int created,  int skipped,  String message)  $default,) {final _that = this;
switch (_that) {
case _BulkCreateInvoiceResponse():
return $default(_that.created,_that.skipped,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int created,  int skipped,  String message)?  $default,) {final _that = this;
switch (_that) {
case _BulkCreateInvoiceResponse() when $default != null:
return $default(_that.created,_that.skipped,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BulkCreateInvoiceResponse implements BulkCreateInvoiceResponse {
  const _BulkCreateInvoiceResponse({required this.created, required this.skipped, required this.message});
  factory _BulkCreateInvoiceResponse.fromJson(Map<String, dynamic> json) => _$BulkCreateInvoiceResponseFromJson(json);

@override final  int created;
@override final  int skipped;
@override final  String message;

/// Create a copy of BulkCreateInvoiceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BulkCreateInvoiceResponseCopyWith<_BulkCreateInvoiceResponse> get copyWith => __$BulkCreateInvoiceResponseCopyWithImpl<_BulkCreateInvoiceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BulkCreateInvoiceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BulkCreateInvoiceResponse&&(identical(other.created, created) || other.created == created)&&(identical(other.skipped, skipped) || other.skipped == skipped)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,created,skipped,message);

@override
String toString() {
  return 'BulkCreateInvoiceResponse(created: $created, skipped: $skipped, message: $message)';
}


}

/// @nodoc
abstract mixin class _$BulkCreateInvoiceResponseCopyWith<$Res> implements $BulkCreateInvoiceResponseCopyWith<$Res> {
  factory _$BulkCreateInvoiceResponseCopyWith(_BulkCreateInvoiceResponse value, $Res Function(_BulkCreateInvoiceResponse) _then) = __$BulkCreateInvoiceResponseCopyWithImpl;
@override @useResult
$Res call({
 int created, int skipped, String message
});




}
/// @nodoc
class __$BulkCreateInvoiceResponseCopyWithImpl<$Res>
    implements _$BulkCreateInvoiceResponseCopyWith<$Res> {
  __$BulkCreateInvoiceResponseCopyWithImpl(this._self, this._then);

  final _BulkCreateInvoiceResponse _self;
  final $Res Function(_BulkCreateInvoiceResponse) _then;

/// Create a copy of BulkCreateInvoiceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? created = null,Object? skipped = null,Object? message = null,}) {
  return _then(_BulkCreateInvoiceResponse(
created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
