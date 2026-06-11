import 'package:shabakat/core/network/dto/response/company/get_preferences_response.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';

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
