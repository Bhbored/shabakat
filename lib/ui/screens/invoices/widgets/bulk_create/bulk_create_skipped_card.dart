import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_skipped_response.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class BulkCreateSkippedCard extends StatelessWidget {
  final InvoiceSkippedResponse item;

  const BulkCreateSkippedCard({super.key, required this.item});

  String _formatDateTime(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month/${date.year} · $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accentColor = colorScheme.primary;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: accentColor),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.paddingMedium),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SkipIcon(color: accentColor),
                    SizedBox(width: context.paddingSmall),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.customerName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: context.spaceSmall * 0.75),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: context.paddingSmall,
                              vertical: context.paddingSmall * 0.75,
                            ),
                            decoration: ControlsThemes.statusBadgeDecoration(
                              colorScheme.onSurface.withValues(alpha: 0.55),
                            ),
                            child: Text(
                              item.reason,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.75,
                                ),
                                height: 1.4,
                              ),
                            ),
                          ),
                          SizedBox(height: context.spaceSmall),
                          Row(
                            children: [
                              Icon(
                                LucideIcons.clock,
                                size: 13,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.4,
                                ),
                              ),
                              SizedBox(width: context.paddingSmall * 0.4),
                              Expanded(
                                child: Text(
                                  _formatDateTime(item.skippedAt),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.55,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkipIcon extends StatelessWidget {
  final Color color;

  const _SkipIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      ),
      child: Icon(LucideIcons.skipForward, size: 18, color: color),
    );
  }
}
