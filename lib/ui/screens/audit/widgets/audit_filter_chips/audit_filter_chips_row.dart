import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/network/dto/request/audit/audit_log_filter_request.dart';
import 'package:shabakat/data/providers/audit/audit_log_filter_provider.dart';

import 'audit_filter_chip.dart';

class AuditFilterChipsRow extends ConsumerWidget {
  const AuditFilterChipsRow({super.key});

  DateTime _toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  DateTime? _effectiveDateTo(AuditLogFilterRequest filter) {
    if (filter.createdTo != null) return _toDateOnly(filter.createdTo!);
    if (filter.createdFrom != null) return _toDateOnly(DateTime.now());
    return null;
  }

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(auditLogFilterProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveTo = _effectiveDateTo(filter);
    final chips = <Widget>[];

    if (filter.action != null) {
      chips.add(
        AuditFilterChip(
          icon: filter.action!.icon,
          label: filter.action!.label,
          color: colorScheme.primary,
        ),
      );
    }
    if (filter.status != null) {
      chips.add(
        AuditFilterChip(
          icon: filter.status!.icon,
          label: filter.status!.label,
          color: filter.status!.statusColor,
        ),
      );
    }
    if (filter.createdFrom != null) {
      chips.add(
        AuditFilterChip(
          icon: LucideIcons.calendar,
          label: '${'audit.filter.from'.tr()}: ${_formatDate(_toDateOnly(filter.createdFrom!))}',
          color: colorScheme.primary,
        ),
      );
    }
    if (effectiveTo != null) {
      chips.add(
        AuditFilterChip(
          icon: LucideIcons.calendarRange,
          label: '${'audit.filter.to'.tr()}: ${_formatDate(effectiveTo)}',
          color: colorScheme.primary,
        ),
      );
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        0,
        context.paddingMedium,
        context.spaceSmall,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var i = 0; i < chips.length; i++) ...[
              if (i > 0) SizedBox(width: context.paddingSmall),
              chips[i],
            ],
          ],
        ),
      ),
    );
  }
}
