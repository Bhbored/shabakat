import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

const companyNameMaxLength = 50;

Future<void> showCompanyNameEditDialog({
  required BuildContext context,
  required String initialName,
  required Future<void> Function(String name) onSave,
}) {
  return showAppDialog<void>(
    context: context,
    builder: (dialogContext) {
      return CompanyNameEditDialog(
        initialName: initialName,
        onSave: onSave,
      );
    },
  );
}

class CompanyNameEditDialog extends StatefulWidget {
  final String initialName;
  final Future<void> Function(String name) onSave;

  const CompanyNameEditDialog({
    super.key,
    required this.initialName,
    required this.onSave,
  });

  @override
  State<CompanyNameEditDialog> createState() => _CompanyNameEditDialogState();
}

class _CompanyNameEditDialogState extends State<CompanyNameEditDialog> {
  late final TextEditingController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get _trimmedName => _controller.text.trim();

  bool get _hasChanges => _trimmedName != widget.initialName.trim();

  bool get _canSave =>
      !_isLoading && _hasChanges && _trimmedName.isNotEmpty && _trimmedName.length <= companyNameMaxLength;

  Future<void> _save() async {
    if (!_canSave) return;

    setState(() => _isLoading = true);

    var success = false;
    late String message;
    late AppSnackBarVariant variant;

    try {
      await widget.onSave(_trimmedName);
      success = true;
      message = 'settings.profile.name_updated'.tr();
      variant = AppSnackBarVariant.success;
    } catch (e) {
      message = e is ApiException
          ? e.userMessage
          : 'settings.profile.name_update_failed'.tr();
      variant = AppSnackBarVariant.error;
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
        AppSnackBar.show(context, message: message, variant: variant);
        if (success) Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: Text('settings.profile.edit_name'.tr()),
      content: TextField(
        controller: _controller,
        enabled: !_isLoading,
        maxLength: companyNameMaxLength,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _save(),
        decoration: InputDecoration(
          labelText: 'settings.profile.company_name'.tr(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: _canSave ? _save : null,
          child: _isLoading
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('settings.save'.tr()),
        ),
      ],
    );
  }
}
