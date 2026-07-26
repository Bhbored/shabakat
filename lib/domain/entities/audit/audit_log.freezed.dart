// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLog {

 String get id; AuditAction get action; AuditLogStatus get status; String get messageKey; Map<String, dynamic> get parameters; AuditEntityType? get entityType; String? get entityId; String? get userEmail; String? get errorMessage; DateTime get createdAt;
/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogCopyWith<AuditLog> get copyWith => _$AuditLogCopyWithImpl<AuditLog>(this as AuditLog, _$identity);

  /// Serializes this AuditLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.status, status) || other.status == status)&&(identical(other.messageKey, messageKey) || other.messageKey == messageKey)&&const DeepCollectionEquality().equals(other.parameters, parameters)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,status,messageKey,const DeepCollectionEquality().hash(parameters),entityType,entityId,userEmail,errorMessage,createdAt);

@override
String toString() {
  return 'AuditLog(id: $id, action: $action, status: $status, messageKey: $messageKey, parameters: $parameters, entityType: $entityType, entityId: $entityId, userEmail: $userEmail, errorMessage: $errorMessage, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AuditLogCopyWith<$Res>  {
  factory $AuditLogCopyWith(AuditLog value, $Res Function(AuditLog) _then) = _$AuditLogCopyWithImpl;
@useResult
$Res call({
 String id, AuditAction action, AuditLogStatus status, String messageKey, Map<String, dynamic> parameters, AuditEntityType? entityType, String? entityId, String? userEmail, String? errorMessage, DateTime createdAt
});




}
/// @nodoc
class _$AuditLogCopyWithImpl<$Res>
    implements $AuditLogCopyWith<$Res> {
  _$AuditLogCopyWithImpl(this._self, this._then);

  final AuditLog _self;
  final $Res Function(AuditLog) _then;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? action = null,Object? status = null,Object? messageKey = null,Object? parameters = null,Object? entityType = freezed,Object? entityId = freezed,Object? userEmail = freezed,Object? errorMessage = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuditAction,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuditLogStatus,messageKey: null == messageKey ? _self.messageKey : messageKey // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self.parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,entityType: freezed == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as AuditEntityType?,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLog].
extension AuditLogPatterns on AuditLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLog value)  $default,){
final _that = this;
switch (_that) {
case _AuditLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLog value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  AuditAction action,  AuditLogStatus status,  String messageKey,  Map<String, dynamic> parameters,  AuditEntityType? entityType,  String? entityId,  String? userEmail,  String? errorMessage,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that.id,_that.action,_that.status,_that.messageKey,_that.parameters,_that.entityType,_that.entityId,_that.userEmail,_that.errorMessage,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  AuditAction action,  AuditLogStatus status,  String messageKey,  Map<String, dynamic> parameters,  AuditEntityType? entityType,  String? entityId,  String? userEmail,  String? errorMessage,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AuditLog():
return $default(_that.id,_that.action,_that.status,_that.messageKey,_that.parameters,_that.entityType,_that.entityId,_that.userEmail,_that.errorMessage,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  AuditAction action,  AuditLogStatus status,  String messageKey,  Map<String, dynamic> parameters,  AuditEntityType? entityType,  String? entityId,  String? userEmail,  String? errorMessage,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that.id,_that.action,_that.status,_that.messageKey,_that.parameters,_that.entityType,_that.entityId,_that.userEmail,_that.errorMessage,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLog implements AuditLog {
  const _AuditLog({required this.id, required this.action, required this.status, required this.messageKey, final  Map<String, dynamic> parameters = const {}, this.entityType, this.entityId, this.userEmail, this.errorMessage, required this.createdAt}): _parameters = parameters;
  factory _AuditLog.fromJson(Map<String, dynamic> json) => _$AuditLogFromJson(json);

@override final  String id;
@override final  AuditAction action;
@override final  AuditLogStatus status;
@override final  String messageKey;
 final  Map<String, dynamic> _parameters;
@override@JsonKey() Map<String, dynamic> get parameters {
  if (_parameters is EqualUnmodifiableMapView) return _parameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_parameters);
}

@override final  AuditEntityType? entityType;
@override final  String? entityId;
@override final  String? userEmail;
@override final  String? errorMessage;
@override final  DateTime createdAt;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogCopyWith<_AuditLog> get copyWith => __$AuditLogCopyWithImpl<_AuditLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.action, action) || other.action == action)&&(identical(other.status, status) || other.status == status)&&(identical(other.messageKey, messageKey) || other.messageKey == messageKey)&&const DeepCollectionEquality().equals(other._parameters, _parameters)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,action,status,messageKey,const DeepCollectionEquality().hash(_parameters),entityType,entityId,userEmail,errorMessage,createdAt);

@override
String toString() {
  return 'AuditLog(id: $id, action: $action, status: $status, messageKey: $messageKey, parameters: $parameters, entityType: $entityType, entityId: $entityId, userEmail: $userEmail, errorMessage: $errorMessage, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AuditLogCopyWith<$Res> implements $AuditLogCopyWith<$Res> {
  factory _$AuditLogCopyWith(_AuditLog value, $Res Function(_AuditLog) _then) = __$AuditLogCopyWithImpl;
@override @useResult
$Res call({
 String id, AuditAction action, AuditLogStatus status, String messageKey, Map<String, dynamic> parameters, AuditEntityType? entityType, String? entityId, String? userEmail, String? errorMessage, DateTime createdAt
});




}
/// @nodoc
class __$AuditLogCopyWithImpl<$Res>
    implements _$AuditLogCopyWith<$Res> {
  __$AuditLogCopyWithImpl(this._self, this._then);

  final _AuditLog _self;
  final $Res Function(_AuditLog) _then;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? action = null,Object? status = null,Object? messageKey = null,Object? parameters = null,Object? entityType = freezed,Object? entityId = freezed,Object? userEmail = freezed,Object? errorMessage = freezed,Object? createdAt = null,}) {
  return _then(_AuditLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AuditAction,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuditLogStatus,messageKey: null == messageKey ? _self.messageKey : messageKey // ignore: cast_nullable_to_non_nullable
as String,parameters: null == parameters ? _self._parameters : parameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,entityType: freezed == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as AuditEntityType?,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
