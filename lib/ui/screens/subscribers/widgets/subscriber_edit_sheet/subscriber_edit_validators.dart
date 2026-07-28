import 'package:easy_localization/easy_localization.dart';

class SubscriberEditValidators {
  SubscriberEditValidators._();

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'subscribers.validation.name_required'.tr();
    }
    if (value.trim().length > 200) {
      return 'subscribers.validation.max_characters'.tr(args: ['200']);
    }
    return null;
  }

  static String? phone(String? value) => optionalMax(value, 30);

  static String? address(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'subscribers.validation.address_required'.tr();
    }
    if (value.trim().length > 500) {
      return 'subscribers.validation.max_characters'.tr(args: ['500']);
    }
    return null;
  }

  static String? planValue(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'subscribers.validation.plan_value_required'.tr();
    }
    final parsed = int.tryParse(value.trim());
    if (parsed == null) return 'settings.validation.invalid_number'.tr();
    if (parsed < 1 || parsed > 100) {
      return 'subscribers.validation.plan_value_range'.tr();
    }
    return null;
  }

  static String? initialMeterReading(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final parsed = double.tryParse(value.trim());
    if (parsed == null) {
      return 'subscribers.validation.invalid_number'.tr();
    }
    if (parsed < 0 || parsed > 9999999) {
      return 'subscribers.validation.initial_meter_reading_range'.tr();
    }
    return null;
  }

  static String? optionalMax(String? value, int maxLength) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.trim().length > maxLength) {
      return 'subscribers.validation.max_characters'.tr(args: ['$maxLength']);
    }
    return null;
  }
}
