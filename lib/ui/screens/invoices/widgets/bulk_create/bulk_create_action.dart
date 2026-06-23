import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_gradients.dart';

import 'bulk_create_dialog.dart';

class BulkCreateInvoicesAction extends ConsumerWidget {
  const BulkCreateInvoicesAction({super.key});

  void _openDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const BulkCreateInvoicesDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.only(right: context.paddingSmall),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppGradients.primaryGradient,
          borderRadius: BorderRadius.circular(context.borderRadiusLarge),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Material(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(
              context.borderRadiusLarge - 1.5,
            ),
            child: InkWell(
              onTap: () => _openDialog(context),
              borderRadius: BorderRadius.circular(
                context.borderRadiusLarge - 1.5,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingSmall,
                  vertical: context.paddingSmall * 0.625,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.layers,
                      size: 18,
                      color: colorScheme.primary,
                    ),
                    SizedBox(width: context.spaceSmall * 0.5),
                    Text(
                      'Bulk Generate',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
