import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

class DistributionBoxDeleteDialog extends StatefulWidget {
  final String boxName;
  final Future<void> Function() onConfirm;

  const DistributionBoxDeleteDialog({
    super.key,
    required this.boxName,
    required this.onConfirm,
  });

  @override
  State<DistributionBoxDeleteDialog> createState() =>
      _DistributionBoxDeleteDialogState();
}

class _DistributionBoxDeleteDialogState extends State<DistributionBoxDeleteDialog> {
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
      title: Text('distribution_boxes.delete.title'.tr()),
      content: Text(
        'distribution_boxes.delete.message'.tr(args: [widget.boxName]),
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
              : Text('distribution_boxes.delete.confirm'.tr()),
        ),
      ],
    );
  }
}
