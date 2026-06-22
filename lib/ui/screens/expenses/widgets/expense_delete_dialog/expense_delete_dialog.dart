import 'package:flutter/material.dart';

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

    return AlertDialog(
      title: const Text('Delete Expense'),
      content: Text(
        'Are you sure you want to delete "$targetLabel"? This action cannot be undone.',
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: isDeleting ? null : onCancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: isDeleting ? null : onConfirm,
          child: isDeleting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Delete'),
        ),
      ],
    );
  }
}
