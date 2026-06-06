import 'package:shabakat/core/network/dto/response/company/get_preferences_response.dart';
import 'package:shabakat/core/network/dto/response/company_preferences/company_preferences_response.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';

extension CompanyPreferencesResponseMapper on CompanyPreferencesResponse {
  CompanyPreferences toEntity() => CompanyPreferences(
    id: id,
    createdAt: updatedAt,
    updatedAt: updatedAt,
    companyId: '',
    pricePerKilowat: pricePerKilowat,
    pricePerAmp: pricePerAmp,
    fixedCharge: fixedCharge,
    tva: tva,
    language: language,
    triggerDate: triggerDate,
    triggerMessage: triggerMessage,
  );
}

extension GetPreferencesResponseMapper on GetPreferencesResponse {
  CompanyPreferences toEntity() => CompanyPreferences(
    id: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    companyId: '',
    pricePerKilowat: pricePerKilowat,
    pricePerAmp: pricePerAmp,
    fixedCharge: fixedCharge,
    tva: tva,
    language: language,
    triggerDate: triggerDate,
    triggerMessage: triggerMessage,
  );
}
