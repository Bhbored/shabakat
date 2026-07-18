import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_preferences.freezed.dart';
part 'company_preferences.g.dart';

@freezed
sealed class CompanyPreferences with _$CompanyPreferences {
  const factory CompanyPreferences({
    @Default(0) double pricePerKilowat,
    @Default(0) double pricePerAmp,
    @Default(0) double fixedCharge,
    @Default(11) double tva,
    @Default(0) double residentialPricePerAmp,
    @Default(0) double residentialPricePerKilowat,
    @Default(0) double residentialFixedCharge,
    @Default(11) double residentialTVA,
    @Default(0) double commercialPricePerAmp,
    @Default(0) double commercialPricePerKilowat,
    @Default(0) double commercialFixedCharge,
    @Default(11) double commercialTVA,
    @Default(0) double industrialPricePerAmp,
    @Default(0) double industrialPricePerKilowat,
    @Default(0) double industrialFixedCharge,
    @Default(11) double industrialTVA,
    @Default('en') String language,
    @Default(1) int dueDate,
    @Default(1) int triggerDate,
    String? triggerMessage,
    @Default(false) bool ampereSchedulePricingEnabled,
    @Default(false) bool ampereProrateByDaysEnabled,
  }) = _CompanyPreferences;

  factory CompanyPreferences.fromJson(Map<String, dynamic> json) =>
      _$CompanyPreferencesFromJson(json);
}
