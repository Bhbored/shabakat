import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/invoice/bulk_create_invoice_response.dart';
import 'package:shabakat/core/themes/app_colors.dart';

import 'bulk_create_result_tile.dart';

class BulkCreateSuccessContent extends StatelessWidget {
  final BulkCreateInvoiceResponse response;

  const BulkCreateSuccessContent({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(LucideIcons.checkCircle2, size: 48, color: AppColors.success),
        SizedBox(height: context.spaceMedium),
        Text(
          response.message,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.spaceMedium),
        Row(
          children: [
            Expanded(
              child: BulkCreateResultTile(
                label: 'Created',
                value: '${response.created}',
                color: AppColors.success,
              ),
            ),
            SizedBox(width: context.spaceSmall),
            Expanded(
              child: BulkCreateResultTile(
                label: 'Skipped',
                value: '${response.skipped}',
                color: colorScheme.onSurface.withValues(alpha: 0.55),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
