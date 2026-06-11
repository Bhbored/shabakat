import 'package:flutter/material.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showPreferenceEditDialog({
  required BuildContext context,
  required String title,
  String? initialValue,
  TextInputType keyboardType = TextInputType.text,
  int maxLines = 1,
  String? hintText,
  String? Function(String?)? validator,
  required Future<void> Function(String value) onSave,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return PreferenceEditDialog(
        title: title,
        initialValue: initialValue,
        keyboardType: keyboardType,
        maxLines: maxLines,
        hintText: hintText,
        validator: validator,
        onSave: onSave,
      );
    },
  );
}

class PreferenceEditDialog extends StatefulWidget {
  final String title;
  final String? initialValue;
  final TextInputType keyboardType;
  final int maxLines;
  final String? hintText;
  final String? Function(String?)? validator;
  final Future<void> Function(String value) onSave;

  const PreferenceEditDialog({
    super.key,
    required this.title,
    required this.initialValue,
    required this.keyboardType,
    required this.maxLines,
    required this.hintText,
    required this.validator,
    required this.onSave,
  });

  @override
  State<PreferenceEditDialog> createState() => _PreferenceEditDialogState();
}

class _PreferenceEditDialogState extends State<PreferenceEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    var success = false;
    late String message;
    late AppSnackBarVariant variant;

    try {
      await widget.onSave(_controller.text.trim());
      success = true;
      message = 'Preference saved';
      variant = AppSnackBarVariant.success;
    } catch (e) {
      success = false;
      message = e is ApiException
          ? e.userMessage
          : 'Failed to save preference. Please try again.';
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
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          enabled: !_isLoading,
          autofocus: true,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          validator: widget.validator,
          decoration: InputDecoration(hintText: widget.hintText),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _save,
          child: _isLoading
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Save'),
        ),
      ],
    );
  }
}
