import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';
import 'package:shabakat/ui/screens/audit/widgets/audit_log_details/audit_log_details_context_grid.dart';
import 'package:shabakat/ui/screens/audit/widgets/audit_log_details/audit_log_details_hero.dart';
import 'package:shabakat/ui/screens/audit/widgets/audit_log_details/audit_log_event_data_section.dart';

class AuditLogDetailsScreen extends StatelessWidget {
  final AuditLog log;

  const AuditLogDetailsScreen({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statusColor = log.status.statusColor;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: AuditLogDetailsHeroBackground(
                statusColor: statusColor,
              ),
              titlePadding: EdgeInsets.only(
                left: context.paddingMedium,
                right: context.paddingMedium,
                bottom: context.paddingSmall,
              ),
              title: Text(
                log.action.label,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              context.paddingMedium,
              context.spaceSmall,
              context.paddingMedium,
              context.paddingMedium,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                AuditLogDetailsSummary(log: log, statusColor: statusColor),
                SizedBox(height: context.spaceMedium),
                AuditLogDetailsContextGrid(log: log),
                SizedBox(height: context.spaceMedium),
                AuditLogEventDataSection(parameters: log.parameters),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
