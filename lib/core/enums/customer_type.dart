import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_localization/easy_localization.dart';

@JsonEnum(alwaysCreate: true)
enum CustomerType { residential, commercial, industrial }

extension CustomerTypeX on CustomerType {
  String get label => switch (this) {
    CustomerType.residential => 'settings.tier.residential'.tr(),
    CustomerType.commercial => 'settings.tier.commercial'.tr(),
    CustomerType.industrial => 'settings.tier.industrial'.tr(),
  };
}
