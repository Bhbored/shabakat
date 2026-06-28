import 'package:easy_localization/easy_localization.dart';

enum PlanType { ampere, kilowatt, fixedKilowatt }

extension PlanTypeX on PlanType {
  String get label => switch (this) {
    PlanType.ampere => 'subscribers.plan.ampere'.tr(),
    PlanType.kilowatt => 'subscribers.plan.kilowatt'.tr(),
    PlanType.fixedKilowatt => 'subscribers.plan.fixed_kilowatt'.tr(),
  };
}

extension StringToPlanType on String {
  PlanType toPlanType() => switch (toLowerCase()) {
    'kilowatt' => PlanType.kilowatt,
    'fixedkilowatt' => PlanType.fixedKilowatt,
    _ => PlanType.ampere,
  };
}
