import 'package:easy_localization/easy_localization.dart';

enum InvoiceStatus { unpaid, partiallypaid, paid }

extension InvoiceStatusX on InvoiceStatus {
  String get label => switch (this) {
    InvoiceStatus.unpaid => 'dashboard.invoice_overview.unpaid'.tr(),
    InvoiceStatus.partiallypaid =>
      'dashboard.invoice_overview.partially_paid'.tr(),
    InvoiceStatus.paid => 'dashboard.invoice_overview.paid'.tr(),
  };
}
