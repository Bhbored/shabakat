import 'package:shabakat/core/network/dto/request/company/update_preferences_request.dart';
import 'package:shabakat/core/network/dto/response/company/get_preferences_response.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';

extension GetPreferencesResponseMapper on GetPreferencesResponse {
  CompanyPreferences toEntity() => CompanyPreferences(
    pricePerKilowat: pricePerKilowat,
    pricePerAmp: pricePerAmp,
    fixedCharge: fixedCharge,
    tva: tva,
    residentialPricePerAmp: residentialPricePerAmp,
    residentialPricePerKilowat: residentialPricePerKilowat,
    residentialFixedCharge: residentialFixedCharge,
    residentialTVA: residentialTVA,
    commercialPricePerAmp: commercialPricePerAmp,
    commercialPricePerKilowat: commercialPricePerKilowat,
    commercialFixedCharge: commercialFixedCharge,
    commercialTVA: commercialTVA,
    industrialPricePerAmp: industrialPricePerAmp,
    industrialPricePerKilowat: industrialPricePerKilowat,
    industrialFixedCharge: industrialFixedCharge,
    industrialTVA: industrialTVA,
    language: language,
    dueDate: dueDate,
    triggerDate: triggerDate,
    triggerMessage: triggerMessage,
    ampereSchedulePricingEnabled: ampereSchedulePricingEnabled,
    ampereProrateByDaysEnabled: ampereProrateByDaysEnabled,
  );
}

extension CompanyPreferencesMapper on CompanyPreferences {
  UpdatePreferencesRequest toUpdateRequest() => UpdatePreferencesRequest(
    pricePerKilowat: pricePerKilowat,
    pricePerAmp: pricePerAmp,
    fixedCharge: fixedCharge,
    tva: tva,
    residentialPricePerAmp: residentialPricePerAmp,
    residentialPricePerKilowat: residentialPricePerKilowat,
    residentialFixedCharge: residentialFixedCharge,
    residentialTVA: residentialTVA,
    commercialPricePerAmp: commercialPricePerAmp,
    commercialPricePerKilowat: commercialPricePerKilowat,
    commercialFixedCharge: commercialFixedCharge,
    commercialTVA: commercialTVA,
    industrialPricePerAmp: industrialPricePerAmp,
    industrialPricePerKilowat: industrialPricePerKilowat,
    industrialFixedCharge: industrialFixedCharge,
    industrialTVA: industrialTVA,
    language: language,
    dueDate: dueDate,
    triggerDate: triggerDate,
    triggerMessage: triggerMessage,
    ampereSchedulePricingEnabled: ampereSchedulePricingEnabled,
    ampereProrateByDaysEnabled: ampereProrateByDaysEnabled,
  );
}
