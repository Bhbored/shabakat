import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_preferences.freezed.dart';
part 'company_preferences.g.dart';

@freezed
sealed class CompanyPreferences with _$CompanyPreferences {
  const factory CompanyPreferences({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    @Default(false) bool isDeleted,
    required String companyId,
    required double pricePerKilowat,
    required double pricePerAmp,
    required double fixedCharge,
    required double tva,
    @Default('en') String language,
    @Default(1) int triggerDate,
    String? triggerMessage,
  }) = _CompanyPreferences;

  factory CompanyPreferences.fromJson(Map<String, dynamic> json) =>
      _$CompanyPreferencesFromJson(json);
}
