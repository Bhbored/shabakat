import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';

String formatAuditMessage(
  String messageKey, [
  Map<String, dynamic> parameters = const {},
]) {
  if (parameters.isEmpty) return messageKey.tr();
  return messageKey.tr(
    namedArgs: {
      for (final entry in parameters.entries)
        entry.key: formatAuditDetailValue(entry.key, entry.value),
    },
  );
}

String formatAuditDetailKey(String key) {
  final translationKey = 'audit.parameters.$key';
  final translated = translationKey.tr();
  if (translated == translationKey) return _humanizeAuditKey(key);
  return translated;
}

String formatAuditDetailValue(String key, dynamic value) {
  if (value == null) return '—';
  if (value is bool) {
    return value ? 'audit.detail_value.yes'.tr() : 'audit.detail_value.no'.tr();
  }
  if (value is String) {
    return _localizeAuditEnumValue(key, value) ?? value;
  }
  if (value is num) return value.toString();
  if (value is List) {
    return value.map((item) => formatAuditDetailValue(key, item)).join(', ');
  }
  return const JsonEncoder.withIndent('  ').convert(value);
}

String? _localizeAuditEnumValue(String key, String value) {
  return switch (key) {
    'plan' => switch (value.toLowerCase()) {
      'ampere' => 'subscribers.plan.ampere'.tr(),
      'kilowatt' => 'subscribers.plan.kilowatt'.tr(),
      'fixedkilowatt' ||
      'fixed_kilowatt' => 'subscribers.plan.fixed_kilowatt'.tr(),
      _ => null,
    },
    'customerType' => switch (value.toLowerCase()) {
      'residential' => 'settings.tier.residential'.tr(),
      'commercial' => 'settings.tier.commercial'.tr(),
      'industrial' => 'settings.tier.industrial'.tr(),
      _ => null,
    },
    'customerStatus' => switch (value.toLowerCase()) {
      'active' => 'dashboard.customers_expenses.active'.tr(),
      'suspended' => 'dashboard.customers_expenses.suspended'.tr(),
      'terminated' => 'dashboard.customers_expenses.terminated'.tr(),
      _ => null,
    },
    'customerRelation' => switch (value.toLowerCase()) {
      'friend' => 'subscribers.relation.friend'.tr(),
      'family' => 'subscribers.relation.family'.tr(),
      'owner' => 'subscribers.relation.owner'.tr(),
      _ => null,
    },
    'paymentMethod' => switch (value.toLowerCase()) {
      'cash' => 'subscribers.payment_method.cash'.tr(),
      'wish' => 'subscribers.payment_method.wish'.tr(),
      _ => null,
    },
    'expenseType' => switch (value.toLowerCase()) {
      'fuel' => 'expenses.types.fuel'.tr(),
      'maintenance' => 'expenses.types.maintenance'.tr(),
      'employees' => 'expenses.types.employees'.tr(),
      'other' => 'expenses.types.other'.tr(),
      _ => null,
    },
    'invoiceStatus' => switch (value.toLowerCase()) {
      'unpaid' => 'dashboard.invoice_overview.unpaid'.tr(),
      'partiallypaid' ||
      'partially_paid' => 'dashboard.invoice_overview.partially_paid'.tr(),
      'paid' => 'dashboard.invoice_overview.paid'.tr(),
      _ => null,
    },
    _ => null,
  };
}

String _humanizeAuditKey(String key) {
  final spaced = key.replaceAllMapped(
    RegExp(r'(?<!^)(?=[A-Z])'),
    (match) => ' ${match.group(0)}',
  );
  return spaced
      .replaceAll('_', ' ')
      .split(' ')
      .where((part) => part.isNotEmpty)
      .map(
        (part) => '${part[0].toUpperCase()}${part.substring(1).toLowerCase()}',
      )
      .join(' ');
}
