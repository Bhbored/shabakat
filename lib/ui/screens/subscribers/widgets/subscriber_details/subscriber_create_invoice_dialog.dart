import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/create_invoice_request.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_pay_dialog/invoice_pay_dialog_content.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showSubscriberCreateInvoiceDialog({
  required BuildContext context,
  required String customerId,
  required PlanType plan,
  String? customerName,
}) {
  return showAppDialog<void>(
    context: context,
    builder: (dialogContext) => SubscriberCreateInvoiceDialog(
      scaffoldContext: context,
      customerId: customerId,
      plan: plan,
      customerName: customerName,
    ),
  );
}

class SubscriberCreateInvoiceDialog extends ConsumerStatefulWidget {
  final BuildContext scaffoldContext;
  final String customerId;
  final PlanType plan;
  final String? customerName;

  const SubscriberCreateInvoiceDialog({
    super.key,
    required this.scaffoldContext,
    required this.customerId,
    required this.plan,
    this.customerName,
  });

  bool get _isFixedKilowatt => plan == PlanType.fixedKilowatt;

  String get _targetLabel {
    final name = customerName?.trim();
    if (name != null && name.isNotEmpty) return name;
    return 'subscribers.fallback_name'.tr();
  }

  @override
  ConsumerState<SubscriberCreateInvoiceDialog> createState() =>
      _SubscriberCreateInvoiceDialogState();
}

class _SubscriberCreateInvoiceDialogState
    extends ConsumerState<SubscriberCreateInvoiceDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _notesController;
  PaymentMethod _paymentMethod = PaymentMethod.cash;
  bool _isKilowattMode = false;

  late final DateTime _monthStart;
  late final DateTime _monthEnd;
  late DateTime _fromDate;
  late DateTime _toDate;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _notesController = TextEditingController();

    final now = DateTime.now();
    _monthStart = DateTime(now.year, now.month, 1);
    _monthEnd = DateTime(now.year, now.month + 1, 0);
    _fromDate = DateTime(now.year, now.month, now.day);
    _toDate = _monthEnd;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String? _amountValidator(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final amount = double.tryParse(value.trim());
    if (amount == null) return 'settings.validation.invalid_number'.tr();
    if (amount <= 0) return 'subscribers.invoices.validation.amount_positive'.tr();
    return null;
  }

  CreateInvoiceRequest _buildRequest() {
    final amountText = _amountController.text.trim();
    final notes = _notesController.text.trim();
    double? paymentAmount;
    double? kilowattAmount;

    if (amountText.isNotEmpty) {
      final amount = double.parse(amountText);
      if (_isKilowattMode) {
        kilowattAmount = amount;
      } else {
        paymentAmount = amount;
      }
    }

    return CreateInvoiceRequest(
      customerId: widget.customerId,
      paymentAmount: paymentAmount,
      kilowattAmount: kilowattAmount,
      paymentMethod: _paymentMethod,
      notes: notes.isEmpty ? null : notes,
    );
  }

  int get _billedDays {
    final from = DateTime(_fromDate.year, _fromDate.month, _fromDate.day);
    final to = DateTime(_toDate.year, _toDate.month, _toDate.day);
    final safeTo = to.isBefore(from) ? from : to;
    return safeTo.difference(from).inDays + 1;
  }

  bool _ampereProrationByDaysEnabled({
    required bool companyPreferenceLoaded,
    required bool companyPreferenceEnabled,
  }) {
    return widget.plan == PlanType.ampere &&
        companyPreferenceLoaded &&
        companyPreferenceEnabled;
  }

  Future<void> _pickDateRange() async {
    final initialRange = DateTimeRange(start: _fromDate, end: _toDate);

    final pickedRange = await showDateRangePicker(
      context: context,
      firstDate: _monthStart,
      lastDate: _monthEnd,
      initialDateRange: initialRange,
    );

    if (pickedRange == null || !mounted) return;

    setState(() {
      _fromDate = DateTime(
        pickedRange.start.year,
        pickedRange.start.month,
        pickedRange.start.day,
      );
      _toDate = DateTime(
        pickedRange.end.year,
        pickedRange.end.month,
        pickedRange.end.day,
      );
    });
  }

  Future<void> _onCreate() async {
    try {
      final companyPreferencesAsync = ref.read(companyProvider);
      final companyPreferenceEnabled =
          companyPreferencesAsync.value?.ampereProrateByDaysEnabled == true;
      final shouldProrateByDays = _ampereProrationByDaysEnabled(
        companyPreferenceLoaded: companyPreferencesAsync.hasValue,
        companyPreferenceEnabled: companyPreferenceEnabled,
      );

      if (widget._isFixedKilowatt) {
        if (!(_formKey.currentState?.validate() ?? true)) return;
      }

      await ref
          .read(invoiceProvider.notifier)
          .createInvoice(
            widget._isFixedKilowatt
                ? _buildRequest()
                : shouldProrateByDays
                    ? CreateInvoiceRequest(
                        customerId: widget.customerId,
                        billedDays: _billedDays,
                      )
                    : CreateInvoiceRequest(customerId: widget.customerId),
          );

      if (!mounted) return;
      Navigator.of(context).pop();
      if (widget.scaffoldContext.mounted) {
        AppSnackBar.show(
          widget.scaffoldContext,
          message: 'subscribers.invoices.create_success'.tr(),
          variant: AppSnackBarVariant.success,
        );
      }
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'subscribers.invoices.create_failed'.tr();
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
    final isCreating = ref.watch(invoiceProvider).isLoading;
    final companyPreferencesAsync = ref.watch(companyProvider);

    final companyPreferenceLoaded = companyPreferencesAsync.hasValue;
    final companyPreferenceEnabled =
        companyPreferencesAsync.value?.ampereProrateByDaysEnabled == true;
    final shouldProrateByDays = _ampereProrationByDaysEnabled(
      companyPreferenceLoaded: companyPreferenceLoaded,
      companyPreferenceEnabled: companyPreferenceEnabled,
    );
    final isCompanyPreferenceLoadingForAmpere = widget.plan == PlanType.ampere &&
        companyPreferencesAsync.isLoading &&
        !companyPreferencesAsync.hasValue;

    final Widget content;
    if (widget._isFixedKilowatt) {
      content = _FixedKilowattContent(
        formKey: _formKey,
        targetLabel: widget._targetLabel,
        amountController: _amountController,
        notesController: _notesController,
        paymentMethod: _paymentMethod,
        isKilowattMode: _isKilowattMode,
        enabled: !isCreating,
        amountValidator: _amountValidator,
        onPaymentMethodChanged: isCreating ? (_) {} : (value) {
          if (value != null) {
            setState(() => _paymentMethod = value);
          }
        },
        onKilowattModeChanged:
            isCreating ? null : (value) => setState(() => _isKilowattMode = value),
      );
    } else if (widget.plan == PlanType.ampere) {
      if (isCompanyPreferenceLoadingForAmpere) {
        content = const Center(child: CircularProgressIndicator(strokeWidth: 2));
      } else if (shouldProrateByDays) {
        content = _AmpereProrateByDaysContent(
          targetLabel: widget._targetLabel,
          monthStart: _monthStart,
          fromDate: _fromDate,
          toDate: _toDate,
          enabled: !isCreating,
          onPickDateRange: _pickDateRange,
        );
      } else {
        content = Text(
          'subscribers.invoices.create_confirm'.tr(args: [widget._targetLabel]),
          style: theme.textTheme.bodyMedium,
        );
      }
    } else {
      content = Text(
        'subscribers.invoices.create_confirm'.tr(args: [widget._targetLabel]),
        style: theme.textTheme.bodyMedium,
      );
    }

    return AppAlertDialog(
      title: Text('subscribers.invoices.create_title'.tr()),
      content: SizedBox(
        width: double.maxFinite,
        child: content,
      ),
      actions: [
        TextButton(
          onPressed: isCreating ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: (isCreating || isCompanyPreferenceLoadingForAmpere)
              ? null
              : _onCreate,
          child: isCreating
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('subscribers.invoices.create_submit'.tr()),
        ),
      ],
    );
  }
}

class _AmpereProrateByDaysContent extends StatelessWidget {
  final String targetLabel;
  final DateTime monthStart;
  final DateTime fromDate;
  final DateTime toDate;
  final bool enabled;
  final Future<void> Function() onPickDateRange;

  const _AmpereProrateByDaysContent({
    required this.targetLabel,
    required this.monthStart,
    required this.fromDate,
    required this.toDate,
    required this.enabled,
    required this.onPickDateRange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final monthLabel = DateFormat.yMMMM(context.locale.toString()).format(
      monthStart,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'subscribers.invoices.create_description'.tr(args: [targetLabel]),
          style: theme.textTheme.bodyMedium,
        ),
        SizedBox(height: context.spaceMedium),
        Row(
          children: [
            Expanded(
              child: Text(
                monthLabel,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            IconButton(
              onPressed: enabled ? onPickDateRange : null,
              icon: Icon(
                Icons.calendar_today_outlined,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        SizedBox(height: context.spaceSmall),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('invoices.filter.from'.tr(), style: theme.textTheme.titleSmall),
                  SizedBox(height: context.spaceSmall),
                  InkWell(
                    onTap: enabled ? onPickDateRange : null,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.paddingMedium,
                        vertical: context.spaceSmall,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(context.borderRadiusMedium),
                        border: Border.all(color: colorScheme.outline),
                      ),
                      child: Text(
                        '${fromDate.day}',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: context.paddingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('invoices.filter.to'.tr(), style: theme.textTheme.titleSmall),
                  SizedBox(height: context.spaceSmall),
                  InkWell(
                    onTap: enabled ? onPickDateRange : null,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.paddingMedium,
                        vertical: context.spaceSmall,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(context.borderRadiusMedium),
                        border: Border.all(color: colorScheme.outline),
                      ),
                      child: Text(
                        '${toDate.day}',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FixedKilowattContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String targetLabel;
  final TextEditingController amountController;
  final TextEditingController notesController;
  final PaymentMethod paymentMethod;
  final bool isKilowattMode;
  final bool enabled;
  final String? Function(String?)? amountValidator;
  final ValueChanged<PaymentMethod?> onPaymentMethodChanged;
  final ValueChanged<bool>? onKilowattModeChanged;

  const _FixedKilowattContent({
    required this.formKey,
    required this.targetLabel,
    required this.amountController,
    required this.notesController,
    required this.paymentMethod,
    required this.isKilowattMode,
    required this.enabled,
    required this.amountValidator,
    required this.onPaymentMethodChanged,
    required this.onKilowattModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'subscribers.invoices.create_description'.tr(args: [targetLabel]),
          style: theme.textTheme.bodyMedium,
        ),
        SizedBox(height: context.spaceMedium),
        Row(
          children: [
            Expanded(
              child: Text(
                isKilowattMode
                    ? 'subscribers.plan.kilowatt'.tr()
                    : 'subscribers.invoices.payment'.tr(),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              'subscribers.invoices.payment'.tr(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface.withValues(
                  alpha: isKilowattMode ? 0.45 : 1,
                ),
                fontWeight: isKilowattMode ? null : FontWeight.w600,
              ),
            ),
            Switch(
              value: isKilowattMode,
              onChanged: enabled ? onKilowattModeChanged : null,
            ),
            Text(
              'subscribers.plan.kilowatt'.tr(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurface.withValues(
                  alpha: isKilowattMode ? 1 : 0.45,
                ),
                fontWeight: isKilowattMode ? FontWeight.w600 : null,
              ),
            ),
          ],
        ),
        SizedBox(height: context.spaceSmall),
        InvoicePayDialogContent(
          formKey: formKey,
          amountController: amountController,
          notesController: notesController,
          paymentMethod: paymentMethod,
          enabled: enabled,
          amountValidator: amountValidator,
          onPaymentMethodChanged: onPaymentMethodChanged,
          amountLabel: isKilowattMode
              ? 'subscribers.plan.kilowatt'.tr()
              : 'subscribers.invoices.amount'.tr(),
        ),
      ],
    );
  }
}
