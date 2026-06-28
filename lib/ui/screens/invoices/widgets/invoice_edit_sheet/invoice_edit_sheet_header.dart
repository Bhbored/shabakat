import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class InvoiceEditSheetHeader extends StatelessWidget {
  final bool isSaving;
  final VoidCallback onClose;

  const InvoiceEditSheetHeader({
    super.key,
    required this.isSaving,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.paddingMedium,
            context.paddingSmall,
            context.paddingMedium,
            context.paddingSmall,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'invoices.edit.title'.tr(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: isSaving ? null : onClose,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
