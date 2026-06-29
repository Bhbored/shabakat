import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

class AreaEditDialog extends StatefulWidget {
  final String initialName;
  final int maxLength;
  final String? Function(String?)? validator;
  final Future<void> Function(String name) onSave;

  const AreaEditDialog({
    super.key,
    required this.initialName,
    required this.maxLength,
    required this.validator,
    required this.onSave,
  });

  @override
  State<AreaEditDialog> createState() => _AreaEditDialogState();
}

class _AreaEditDialogState extends State<AreaEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    try {
      await widget.onSave(_nameController.text.trim());
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: Text('areas.edit.title'.tr()),
      content: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: TextFormField(
          controller: _nameController,
          enabled: !_isSaving,
          maxLength: widget.maxLength,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => _save(),
          validator: widget.validator,
          decoration: InputDecoration(hintText: 'areas.add.name_hint'.tr()),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: _isSaving ? null : _save,
          child: _isSaving
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
