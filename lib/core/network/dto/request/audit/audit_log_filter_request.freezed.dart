// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLogFilterRequest {

 AuditAction? get action; AuditLogStatus? get status;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get createdFrom;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get createdTo; int get pageNumber; int get pageSize;
/// Create a copy of AuditLogFilterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogFilterRequestCopyWith<AuditLogFilterRequest> get copyWith => _$AuditLogFilterRequestCopyWithImpl<AuditLogFilterRequest>(this as AuditLogFilterRequest, _$identity);

  /// Serializes this AuditLogFilterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLogFilterRequest&&(identical(other.action, action) || other.action == action)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdFrom, createdFrom) || other.createdFrom == createdFrom)&&(identical(other.createdTo, createdTo) || other.createdTo == createdTo)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,status,createdFrom,createdTo,pageNumber,pageSize);

@override
String toString() {
  return 'AuditLogFilterRequest(action: $action, status: $status, createdFrom: $createdFrom, createdTo: $createdTo, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $AuditLogFilterRequestCopyWith<$Res>  {
  factory $AuditLogFilterRequestCopyWith(AuditLogFilterRequest value, $Res Function(AuditLogFilterRequest) _then) = _$AuditLogFilterRequestCopyWithImpl;
@useResult
$Res call({
 AuditAction? action, AuditLogStatus? status,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? createdFrom,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? createdTo, int pageNumber, int pageSize
});




}
/// @nodoc
class _$AuditLogFilterRequestCopyWithImpl<$Res>
    implements $AuditLogFilterRequestCopyWith<$Res> {
  _$AuditLogFilterRequestCopyWithImpl(this._self, this._then);

  final AuditLogFilterRequest _self;
  final $Res Function(AuditLogFilterRequest) _then;

/// Create a copy of AuditLogFilterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = freezed,Object? status = freezed,Object? createdFrom = freezed,Object? createdTo = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuditAction?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuditLogStatus?,createdFrom: freezed == createdFrom ? _self.createdFrom : createdFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,createdTo: freezed == createdTo ? _self.createdTo : createdTo // ignore: cast_nullable_to_non_nullable
as DateTime?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLogFilterRequest].
extension AuditLogFilterRequestPatterns on AuditLogFilterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLogFilterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLogFilterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLogFilterRequest value)  $default,){
final _that = this;
switch (_that) {
case _AuditLogFilterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLogFilterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLogFilterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuditAction? action,  AuditLogStatus? status, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? createdFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? createdTo,  int pageNumber,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLogFilterRequest() when $default != null:
return $default(_that.action,_that.status,_that.createdFrom,_that.createdTo,_that.pageNumber,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuditAction? action,  AuditLogStatus? status, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? createdFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? createdTo,  int pageNumber,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _AuditLogFilterRequest():
return $default(_that.action,_that.status,_that.createdFrom,_that.createdTo,_that.pageNumber,_that.pageSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuditAction? action,  AuditLogStatus? status, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? createdFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? createdTo,  int pageNumber,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _AuditLogFilterRequest() when $default != null:
return $default(_that.action,_that.status,_that.createdFrom,_that.createdTo,_that.pageNumber,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLogFilterRequest implements AuditLogFilterRequest {
  const _AuditLogFilterRequest({this.action, this.status, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.createdFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.createdTo, this.pageNumber = 1, this.pageSize = 10});
  factory _AuditLogFilterRequest.fromJson(Map<String, dynamic> json) => _$AuditLogFilterRequestFromJson(json);

@override final  AuditAction? action;
@override final  AuditLogStatus? status;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? createdFrom;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? createdTo;
@override@JsonKey() final  int pageNumber;
@override@JsonKey() final  int pageSize;

/// Create a copy of AuditLogFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogFilterRequestCopyWith<_AuditLogFilterRequest> get copyWith => __$AuditLogFilterRequestCopyWithImpl<_AuditLogFilterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogFilterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLogFilterRequest&&(identical(other.action, action) || other.action == action)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdFrom, createdFrom) || other.createdFrom == createdFrom)&&(identical(other.createdTo, createdTo) || other.createdTo == createdTo)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,status,createdFrom,createdTo,pageNumber,pageSize);

@override
String toString() {
  return 'AuditLogFilterRequest(action: $action, status: $status, createdFrom: $createdFrom, createdTo: $createdTo, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$AuditLogFilterRequestCopyWith<$Res> implements $AuditLogFilterRequestCopyWith<$Res> {
  factory _$AuditLogFilterRequestCopyWith(_AuditLogFilterRequest value, $Res Function(_AuditLogFilterRequest) _then) = __$AuditLogFilterRequestCopyWithImpl;
@override @useResult
$Res call({
 AuditAction? action, AuditLogStatus? status,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? createdFrom,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? createdTo, int pageNumber, int pageSize
});




}
/// @nodoc
class __$AuditLogFilterRequestCopyWithImpl<$Res>
    implements _$AuditLogFilterRequestCopyWith<$Res> {
  __$AuditLogFilterRequestCopyWithImpl(this._self, this._then);

  final _AuditLogFilterRequest _self;
  final $Res Function(_AuditLogFilterRequest) _then;

/// Create a copy of AuditLogFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = freezed,Object? status = freezed,Object? createdFrom = freezed,Object? createdTo = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_AuditLogFilterRequest(
action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuditAction?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuditLogStatus?,createdFrom: freezed == createdFrom ? _self.createdFrom : createdFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,createdTo: freezed == createdTo ? _self.createdTo : createdTo // ignore: cast_nullable_to_non_nullable
as DateTime?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
