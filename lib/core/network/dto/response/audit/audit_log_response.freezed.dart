// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLogResponse {

 String get id; String get action; String get status; String get summary; String? get entityType; String? get entityId; String? get details; String? get userEmail; DateTime get createdAt;
/// Create a copy of AuditLogResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogResponseCopyWith<AuditLogResponse> get copyWith => _$AuditLogResponseCopyWithImpl<AuditLogResponse>(this as AuditLogResponse, _$identity);

  /// Serializes this AuditLogResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLogResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.details, details) || other.details == details)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,status,summary,entityType,entityId,details,userEmail,createdAt);

@override
String toString() {
  return 'AuditLogResponse(id: $id, action: $action, status: $status, summary: $summary, entityType: $entityType, entityId: $entityId, details: $details, userEmail: $userEmail, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AuditLogResponseCopyWith<$Res>  {
  factory $AuditLogResponseCopyWith(AuditLogResponse value, $Res Function(AuditLogResponse) _then) = _$AuditLogResponseCopyWithImpl;
@useResult
$Res call({
 String id, String action, String status, String summary, String? entityType, String? entityId, String? details, String? userEmail, DateTime createdAt
});




}
/// @nodoc
class _$AuditLogResponseCopyWithImpl<$Res>
    implements $AuditLogResponseCopyWith<$Res> {
  _$AuditLogResponseCopyWithImpl(this._self, this._then);

  final AuditLogResponse _self;
  final $Res Function(AuditLogResponse) _then;

/// Create a copy of AuditLogResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? action = null,Object? status = null,Object? summary = null,Object? entityType = freezed,Object? entityId = freezed,Object? details = freezed,Object? userEmail = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,entityType: freezed == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String?,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLogResponse].
extension AuditLogResponsePatterns on AuditLogResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLogResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLogResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLogResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuditLogResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLogResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLogResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String action,  String status,  String summary,  String? entityType,  String? entityId,  String? details,  String? userEmail,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLogResponse() when $default != null:
return $default(_that.id,_that.action,_that.status,_that.summary,_that.entityType,_that.entityId,_that.details,_that.userEmail,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String action,  String status,  String summary,  String? entityType,  String? entityId,  String? details,  String? userEmail,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AuditLogResponse():
return $default(_that.id,_that.action,_that.status,_that.summary,_that.entityType,_that.entityId,_that.details,_that.userEmail,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String action,  String status,  String summary,  String? entityType,  String? entityId,  String? details,  String? userEmail,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AuditLogResponse() when $default != null:
return $default(_that.id,_that.action,_that.status,_that.summary,_that.entityType,_that.entityId,_that.details,_that.userEmail,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLogResponse implements AuditLogResponse {
  const _AuditLogResponse({required this.id, required this.action, required this.status, required this.summary, this.entityType, this.entityId, this.details, this.userEmail, required this.createdAt});
  factory _AuditLogResponse.fromJson(Map<String, dynamic> json) => _$AuditLogResponseFromJson(json);

@override final  String id;
@override final  String action;
@override final  String status;
@override final  String summary;
@override final  String? entityType;
@override final  String? entityId;
@override final  String? details;
@override final  String? userEmail;
@override final  DateTime createdAt;

/// Create a copy of AuditLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogResponseCopyWith<_AuditLogResponse> get copyWith => __$AuditLogResponseCopyWithImpl<_AuditLogResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLogResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.details, details) || other.details == details)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,status,summary,entityType,entityId,details,userEmail,createdAt);

@override
String toString() {
  return 'AuditLogResponse(id: $id, action: $action, status: $status, summary: $summary, entityType: $entityType, entityId: $entityId, details: $details, userEmail: $userEmail, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AuditLogResponseCopyWith<$Res> implements $AuditLogResponseCopyWith<$Res> {
  factory _$AuditLogResponseCopyWith(_AuditLogResponse value, $Res Function(_AuditLogResponse) _then) = __$AuditLogResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String action, String status, String summary, String? entityType, String? entityId, String? details, String? userEmail, DateTime createdAt
});




}
/// @nodoc
class __$AuditLogResponseCopyWithImpl<$Res>
    implements _$AuditLogResponseCopyWith<$Res> {
  __$AuditLogResponseCopyWithImpl(this._self, this._then);

  final _AuditLogResponse _self;
  final $Res Function(_AuditLogResponse) _then;

/// Create a copy of AuditLogResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? action = null,Object? status = null,Object? summary = null,Object? entityType = freezed,Object? entityId = freezed,Object? details = freezed,Object? userEmail = freezed,Object? createdAt = null,}) {
  return _then(_AuditLogResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,entityType: freezed == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String?,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
