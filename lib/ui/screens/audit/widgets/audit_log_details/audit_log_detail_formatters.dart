import 'dart:convert';

String formatAuditDetailKey(String key) {
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

String formatAuditDetailValue(dynamic value) {
  if (value == null) return '—';
  if (value is bool) return value ? 'Yes' : 'No';
  if (value is num || value is String) return value.toString();
  if (value is List) {
    return value.map(formatAuditDetailValue).join(', ');
  }
  return const JsonEncoder.withIndent('  ').convert(value);
}
