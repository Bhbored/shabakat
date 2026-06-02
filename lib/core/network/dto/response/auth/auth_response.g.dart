// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      token: json['token'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      role: json['role'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      companyId: json['companyId'] as String,
      companyName: json['companyName'] as String,
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'email': instance.email,
      'fullName': instance.fullName,
      'role': instance.role,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'logoUrl': instance.logoUrl,
    };
