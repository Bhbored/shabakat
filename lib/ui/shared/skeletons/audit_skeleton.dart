import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/screens/audit/widgets/audit_log_card/audit_log_card.dart';
import 'package:shabakat/ui/screens/audit/widgets/audit_log_list/audit_log_skeleton_cards.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuditSkeleton extends StatelessWidget {
  const AuditSkeleton({super.key});

  static const _itemCount = 6;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      child: Skeletonizer(
        effect: AuditLogSkeletonCards.shimmerEffect(colorScheme),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: context.spaceSmall,
                bottom: context.spaceSmall,
              ),
              child: const AuditSummaryBarSkeleton(),
            ),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  context.paddingMedium,
                  0,
                  context.paddingMedium,
                  context.viewInsets.bottom,
                ),
                itemCount: _itemCount,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: context.spaceSmall),
                    child: AuditLogCard(
                      log: AuditLogSkeletonCards.mockLogs[
                          index % AuditLogSkeletonCards.mockLogs.length],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
