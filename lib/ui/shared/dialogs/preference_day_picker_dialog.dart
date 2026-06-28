import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/utilities/day_of_month_formatter.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showPreferenceDayPickerDialog({
  required BuildContext context,
  required String title,
  required int initialDay,
  String? description,
  required Future<void> Function(int day) onSave,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return PreferenceDayPickerDialog(
        title: title,
        initialDay: initialDay,
        description: description,
        onSave: onSave,
      );
    },
  );
}

class PreferenceDayPickerDialog extends StatefulWidget {
  final String title;
  final int initialDay;
  final String? description;
  final Future<void> Function(int day) onSave;

  const PreferenceDayPickerDialog({
    super.key,
    required this.title,
    required this.initialDay,
    this.description,
    required this.onSave,
  });

  @override
  State<PreferenceDayPickerDialog> createState() =>
      _PreferenceDayPickerDialogState();
}

class _PreferenceDayPickerDialogState extends State<PreferenceDayPickerDialog> {
  late int _selectedDay;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.initialDay.clamp(1, 31);
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DayOfMonthFormatter.dateFromDay(_selectedDay, now),
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1, 12, 31),
    );
    if (picked == null || !mounted) return;

    setState(() => _selectedDay = picked.day);
  }

  Future<void> _save() async {
    setState(() => _isLoading = true);

    var success = false;
    late String message;
    late AppSnackBarVariant variant;

    try {
      await widget.onSave(_selectedDay);
      success = true;
      message = 'settings.preference_saved'.tr();
      variant = AppSnackBarVariant.success;
    } catch (e) {
      success = false;
      message = e is ApiException
          ? e.userMessage
          : 'settings.preference_save_failed'.tr();
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.description != null) ...[
            Text(
              widget.description!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            SizedBox(height: context.spaceMedium),
          ],
          InkWell(
            onTap: _isLoading ? null : _pickDate,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingMedium,
                vertical: context.spaceMedium,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.borderRadiusMedium),
                border: Border.all(color: colorScheme.outline),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      DayOfMonthFormatter.format(context, _selectedDay),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
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
