// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_company_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterCompanyRequest _$RegisterCompanyRequestFromJson(
  Map<String, dynamic> json,
) => _RegisterCompanyRequest(
  companyName: json['companyName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  confirmPassword: json['confirmPassword'] as String,
  phone: json['phone'] as String?,
  logoUrl: json['logoUrl'] as String?,
);

Map<String, dynamic> _$RegisterCompanyRequestToJson(
  _RegisterCompanyRequest instance,
) => <String, dynamic>{
  'companyName': instance.companyName,
  'email': instance.email,
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
  'phone': instance.phone,
  'logoUrl': instance.logoUrl,
};
