import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/meter/create_meter_reading_request.dart';
import 'package:shabakat/data/providers/meter/meter_reading_provider.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showSubscriberRecordMeterReadingDialog({
  required BuildContext context,
  required String customerId,
  String? customerName,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => SubscriberRecordMeterReadingDialog(
      scaffoldContext: context,
      customerId: customerId,
      customerName: customerName,
    ),
  );
}

class SubscriberRecordMeterReadingDialog extends ConsumerStatefulWidget {
  final BuildContext scaffoldContext;
  final String customerId;
  final String? customerName;

  const SubscriberRecordMeterReadingDialog({
    super.key,
    required this.scaffoldContext,
    required this.customerId,
    this.customerName,
  });

  @override
  ConsumerState<SubscriberRecordMeterReadingDialog> createState() =>
      _SubscriberRecordMeterReadingDialogState();
}

class _SubscriberRecordMeterReadingDialogState
    extends ConsumerState<SubscriberRecordMeterReadingDialog> {
  final _formKey = GlobalKey<FormState>();
  final _readingValueController = TextEditingController();
  DateTime _readingDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  void dispose() {
    _readingValueController.dispose();
    super.dispose();
  }

  String get _targetLabel {
    final name = widget.customerName?.trim();
    if (name != null && name.isNotEmpty) return name;
    return 'this subscriber';
  }

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _readingDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _readingDate = DateTime(picked.year, picked.month, picked.day);
      });
    }
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final value = double.parse(_readingValueController.text.trim());
    final request = CreateMeterReadingRequest(
      readingValue: value,
      readingDate: _readingDate,
    );

    try {
      await ref
          .read(meterReadingProvider(widget.customerId).notifier)
          .createMeterReading(request);
      if (!mounted) return;
      Navigator.of(context).pop();
      if (widget.scaffoldContext.mounted) {
        AppSnackBar.show(
          widget.scaffoldContext,
          message: 'Meter reading recorded',
          variant: AppSnackBarVariant.success,
        );
      }
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'Failed to record meter reading. Please try again.';
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSubmitting =
        ref.watch(meterReadingProvider(widget.customerId)).isLoading;
    final dialogWidth = context.isSmallScreen
        ? context.screenWidth * 0.92
        : 480.0;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.paddingMedium,
        vertical: context.spaceLarge,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: dialogWidth),
        child: Padding(
          padding: EdgeInsets.all(context.paddingMedium),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.paddingSmall),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius:
                            BorderRadius.circular(context.borderRadiusMedium),
                      ),
                      child: Icon(
                        LucideIcons.gauge,
                        color: colorScheme.onPrimaryContainer,
                        size: 22,
                      ),
                    ),
                    SizedBox(width: context.spaceMedium),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Record Reading',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: context.spaceSmall * 0.5),
                          Text(
                            'Log a new meter value for $_targetLabel.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.65,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: isSubmitting
                          ? null
                          : () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: context.spaceMedium),
                Divider(
                  color: colorScheme.outline.withValues(alpha: 0.35),
                  height: 1,
                ),
                SizedBox(height: context.spaceMedium),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final useRow = constraints.maxWidth >= 360;

                    final valueField = _MeterReadingField(
                      label: 'Reading Value',
                      child: TextFormField(
                        controller: _readingValueController,
                        enabled: !isSubmitting,
                        autofocus: true,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          hintText: '0.00',
                          suffixText: 'kWh',
                        ),
                        validator: (value) {
                          final trimmed = value?.trim();
                          if (trimmed == null || trimmed.isEmpty) {
                            return 'Required';
                          }
                          final parsed = double.tryParse(trimmed);
                          if (parsed == null) return 'Invalid number';
                          if (parsed < 0) return 'Must be 0 or greater';
                          return null;
                        },
                      ),
                    );

                    final dateField = _MeterReadingField(
                      label: 'Reading Date',
                      child: InkWell(
                        onTap: isSubmitting ? null : _pickDate,
                        borderRadius: BorderRadius.circular(
                          context.borderRadiusMedium,
                        ),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_today_outlined),
                          ),
                          child: Text(
                            _formatDate(_readingDate),
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    );

                    if (useRow) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 3, child: valueField),
                          SizedBox(width: context.spaceMedium),
                          Expanded(flex: 2, child: dateField),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        valueField,
                        SizedBox(height: context.spaceMedium),
                        dateField,
                      ],
                    );
                  },
                ),
                SizedBox(height: context.spaceLarge),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: isSubmitting
                            ? null
                            : () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    SizedBox(width: context.spaceMedium),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isSubmitting ? null : _onSubmit,
                        child: isSubmitting
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: colorScheme.onPrimary,
                                ),
                              )
                            : const Text('Record'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MeterReadingField extends StatelessWidget {
  final String label;
  final Widget child;

  const _MeterReadingField({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.spaceSmall),
        child,
      ],
    );
  }
}
