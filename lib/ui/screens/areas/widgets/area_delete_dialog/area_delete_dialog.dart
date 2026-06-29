import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

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

    return AppAlertDialog(
      title: Text('areas.delete.title'.tr()),
      content: Text(
        'areas.delete.message'.tr(args: [widget.areaName]),
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: _isDeleting ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: _isDeleting ? null : _confirm,
          child: _isDeleting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('areas.delete.confirm'.tr()),
        ),
      ],
    );
  }
}
