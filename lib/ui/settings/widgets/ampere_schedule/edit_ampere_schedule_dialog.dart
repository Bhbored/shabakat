import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/ampere_schedule/update_ampere_schedule_request.dart';
import 'package:shabakat/data/providers/ampere_schedule/ampere_schedule_provider.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class EditAmpereScheduleDialog extends ConsumerStatefulWidget {
  final AmpereSchedule schedule;

  const EditAmpereScheduleDialog({super.key, required this.schedule});

  @override
  ConsumerState<EditAmpereScheduleDialog> createState() =>
      _EditAmpereScheduleDialogState();
}

class _EditAmpereScheduleDialogState
    extends ConsumerState<EditAmpereScheduleDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _hoursController;
  late final TextEditingController _priceController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.schedule.name);
    _hoursController = TextEditingController(
      text: widget.schedule.hoursPerDay.toString(),
    );
    _priceController = TextEditingController(
      text: widget.schedule.pricePerAmp.toString(),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _hoursController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final request = UpdateAmpereScheduleRequest(
      name: _nameController.text.trim(),
      hoursPerDay: int.parse(_hoursController.text.trim()),
      pricePerAmp: double.parse(_priceController.text.trim()),
    );

    try {
      await ref
          .read(ampereScheduleProvider.notifier)
          .updateAmpereSchedule(request, widget.schedule.id);
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'settings.ampere_schedule.updated'.tr(),
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'settings.ampere_schedule.update_failed'.tr();
      AppSnackBar.show(context, message: message, variant: AppSnackBarVariant.error);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: Text('settings.ampere_schedule.edit_title'.tr()),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              enabled: !_isLoading,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              maxLength: 200,
              decoration: InputDecoration(
                hintText: 'settings.ampere_schedule.name_hint'.tr(),
              ),
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) {
                  return 'settings.ampere_schedule.validation.required'.tr();
                }
                if (text.length > 200) {
                  return 'settings.ampere_schedule.validation.name_max'.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _hoursController,
              enabled: !_isLoading,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: 'settings.ampere_schedule.hours_hint'.tr(),
              ),
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) {
                  return 'settings.ampere_schedule.validation.required'.tr();
                }
                final parsed = int.tryParse(text);
                if (parsed == null) {
                  return 'settings.ampere_schedule.validation.invalid_int'.tr();
                }
                if (parsed < 1 || parsed > 24) {
                  return 'settings.ampere_schedule.validation.hours_range'.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _priceController,
              enabled: !_isLoading,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: InputDecoration(
                hintText: 'settings.ampere_schedule.price_hint'.tr(),
              ),
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) {
                  return 'settings.ampere_schedule.validation.required'.tr();
                }
                final parsed = double.tryParse(text);
                if (parsed == null) {
                  return 'settings.ampere_schedule.validation.invalid_number'.tr();
                }
                if (parsed < 0.0001 || parsed > 9999999) {
                  return 'settings.ampere_schedule.validation.price_range'.tr();
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _save,
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
