// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyPreferences _$CompanyPreferencesFromJson(Map<String, dynamic> json) =>
    _CompanyPreferences(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
      companyId: json['companyId'] as String,
      pricePerKilowat: (json['pricePerKilowat'] as num).toDouble(),
      pricePerAmp: (json['pricePerAmp'] as num).toDouble(),
      fixedCharge: (json['fixedCharge'] as num).toDouble(),
      tva: (json['tva'] as num).toDouble(),
      language: json['language'] as String? ?? 'en',
      triggerDate: (json['triggerDate'] as num?)?.toInt() ?? 1,
      triggerMessage: json['triggerMessage'] as String?,
    );

Map<String, dynamic> _$CompanyPreferencesToJson(_CompanyPreferences instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'companyId': instance.companyId,
      'pricePerKilowat': instance.pricePerKilowat,
      'pricePerAmp': instance.pricePerAmp,
      'fixedCharge': instance.fixedCharge,
      'tva': instance.tva,
      'language': instance.language,
      'triggerDate': instance.triggerDate,
      'triggerMessage': instance.triggerMessage,
    };
