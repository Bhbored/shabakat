import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

class ExpenseDeleteDialog extends StatelessWidget {
  final String targetLabel;
  final bool isDeleting;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const ExpenseDeleteDialog({
    super.key,
    required this.targetLabel,
    required this.isDeleting,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppAlertDialog(
      title: Text('expenses.delete.title'.tr()),
      content: Text(
        'expenses.delete.message'.tr(args: [targetLabel]),
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: isDeleting ? null : onCancel,
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: isDeleting ? null : onConfirm,
          child: isDeleting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('expenses.delete.confirm'.tr()),
        ),
      ],
    );
  }
}
