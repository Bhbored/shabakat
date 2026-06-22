import 'package:flutter/material.dart';

class AreaDeleteDialog extends StatefulWidget {
  final String areaName;
  final Future<void> Function() onConfirm;

  const AreaDeleteDialog({
    super.key,
    required this.areaName,
    required this.onConfirm,
  });

  @override
  State<AreaDeleteDialog> createState() => _AreaDeleteDialogState();
}

class _AreaDeleteDialogState extends State<AreaDeleteDialog> {
  bool _isDeleting = false;

  Future<void> _confirm() async {
    setState(() => _isDeleting = true);
    try {
      await widget.onConfirm();
    } finally {
      if (mounted) setState(() => _isDeleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text('Delete Area'),
      content: Text(
        'Are you sure you want to delete "${widget.areaName}"? This action cannot be undone.',
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: _isDeleting ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isDeleting ? null : _confirm,
          child: _isDeleting
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
