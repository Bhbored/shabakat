import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';
import 'package:shabakat/ui/screens/audit/widgets/audit_log_card/audit_log_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuditLogSkeletonCards extends StatelessWidget {
  final int itemCount;
  final bool clipLastItem;

  const AuditLogSkeletonCards({
    super.key,
    required this.itemCount,
    this.clipLastItem = false,
  });

  static final List<AuditLog> mockLogs = List.generate(
    6,
    (index) => AuditLog(
      id: 'skeleton-$index',
      action: AuditAction.customerCreated,
      status: AuditLogStatus.success,
      messageKey: 'audit.customer.created',
      entityType: AuditEntityType.customer,
      userEmail: 'user@example.com',
      createdAt: DateTime(2024, 6, 15, 14, 30),
    ),
  );

  static ShimmerEffect shimmerEffect(ColorScheme colorScheme) => ShimmerEffect(
    baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
    highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final count = itemCount.clamp(1, mockLogs.length);

    return IgnorePointer(
      child: Skeletonizer(
        effect: shimmerEffect(colorScheme),
        child: Column(
          children: [
            for (var i = 0; i < count; i++)
              Padding(
                padding: EdgeInsets.only(bottom: context.spaceSmall),
                child: i == count - 1 && clipLastItem
                    ? ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.45,
                          child: AuditLogCard(log: mockLogs[i]),
                        ),
                      )
                    : AuditLogCard(log: mockLogs[i]),
              ),
          ],
        ),
      ),
    );
  }
}

class AuditSummaryBarSkeleton extends StatelessWidget {
  const AuditSummaryBarSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.paddingMedium),
          child: Row(
            children: [
              Icon(
                LucideIcons.scrollText,
                size: 18,
                color: colorScheme.primary,
              ),
              SizedBox(width: context.paddingSmall),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'audit.summary.entries'.tr(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.55),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                    Text(
                      '48',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(LucideIcons.slidersHorizontal),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
