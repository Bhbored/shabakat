// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['id'] as String,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  isBanned: json['isBanned'] as bool? ?? false,
  companyName: json['companyName'] as String,
  logoUrl: json['logoUrl'] as String?,
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'isBanned': instance.isBanned,
  'companyName': instance.companyName,
  'logoUrl': instance.logoUrl,
};
