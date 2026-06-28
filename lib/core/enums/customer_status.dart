import 'package:easy_localization/easy_localization.dart';

enum CustomerStatus { active, suspended, terminated }

extension CustomerStatusX on CustomerStatus {
  String get label => switch (this) {
    CustomerStatus.active => 'dashboard.customers_expenses.active'.tr(),
    CustomerStatus.suspended => 'dashboard.customers_expenses.suspended'.tr(),
    CustomerStatus.terminated => 'dashboard.customers_expenses.terminated'.tr(),
  };
}
