// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_employee_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateEmployeeRequest _$CreateEmployeeRequestFromJson(
  Map<String, dynamic> json,
) => _CreateEmployeeRequest(
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$CreateEmployeeRequestToJson(
  _CreateEmployeeRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'email': instance.email,
  'password': instance.password,
};
