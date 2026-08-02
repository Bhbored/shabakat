import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/fixed_kilowatt_calculate_request.dart';
import 'package:shabakat/core/network/dto/response/invoice/fixed_kilowatt_calculate_response.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/core/utilities/decimal_amount.dart';

String _localizedCustomerType(String raw) {
  final lower = raw.trim().toLowerCase();
  for (final type in CustomerType.values) {
    if (type.name == lower) return type.label;
  }
  return raw;
}

class FixedKilowattCalculatorScreen extends ConsumerStatefulWidget {
  const FixedKilowattCalculatorScreen({super.key});

  @override
  ConsumerState<FixedKilowattCalculatorScreen> createState() =>
      _FixedKilowattCalculatorScreenState();
}

class _FixedKilowattCalculatorScreenState
    extends ConsumerState<FixedKilowattCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _planValueController = TextEditingController();
  final _amountController = TextEditingController();

  CustomerType _customerType = CustomerType.residential;
  bool _isKilowattMode = false;
  bool _isLoading = false;
  String? _errorMessage;
  FixedKilowattCalculateResponse? _result;

  @override
  void dispose() {
    _planValueController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  String? _planValueValidator(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return null;
    final parsed = double.tryParse(trimmed);
    if (parsed == null) return 'calculator.validation.invalid_number'.tr();
    if (parsed < 0 || parsed > 9999999) {
      return 'calculator.validation.plan_value_min'.tr();
    }
    return null;
  }

  String? _amountValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _isKilowattMode
          ? 'calculator.validation.kilowatt_required'.tr()
          : 'calculator.validation.payment_required'.tr();
    }
    final parsed = double.tryParse(value.trim());
    if (parsed == null) return 'calculator.validation.invalid_number'.tr();
    if (parsed < 0.0001) return 'calculator.validation.amount_min'.tr();
    return null;
  }

  Future<void> _calculate() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _result = null;
    });

    try {
      final planText = _planValueController.text.trim();
      final planValue = planText.isEmpty ? null : double.parse(planText);
      final amount = double.parse(_amountController.text.trim());
      final request = FixedKilowattCalculateRequest(
        customerType: _customerType,
        planValue: planValue,
        paymentAmount: _isKilowattMode ? null : amount,
        kilowattAmount: _isKilowattMode ? amount : null,
      );

      final result = await ref
          .read(invoiceServiceProvider)
          .calculateFixedKilowatt(request);

      if (!mounted) return;
      setState(() {
        _result = result;
        _isLoading = false;
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.userMessage;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'calculator.load_failed'.tr();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('calculator.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          context.paddingMedium,
          context.paddingMedium,
          context.paddingMedium,
          context.paddingMedium + context.keyboardBottomInset,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'calculator.subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.65),
                ),
              ),
              SizedBox(height: context.spaceMedium),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(context.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'calculator.customer_type'.tr(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: context.spaceSmall),
                      _CustomerTypeDropdown(
                        value: _customerType,
                        labelBuilder: (type) => type.label,
                        enabled: !_isLoading,
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() => _customerType = value);
                        },
                      ),
                      SizedBox(height: context.spaceMedium),
                      Text(
                        'calculator.plan_value'.tr(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: context.spaceSmall),
                      TextFormField(
                        controller: _planValueController,
                        enabled: !_isLoading,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*'),
                          ),
                        ],
                        decoration: InputDecoration(
                          hintText: 'calculator.plan_value_hint'.tr(),
                          prefixIcon: const Icon(LucideIcons.gauge),
                        ),
                        validator: _planValueValidator,
                      ),
                      SizedBox(height: context.spaceMedium),
                      _AmountModeSwitch(
                        isKilowattMode: _isKilowattMode,
                        enabled: !_isLoading,
                        onChanged: (value) {
                          setState(() => _isKilowattMode = value);
                        },
                      ),
                      SizedBox(height: context.spaceSmall),
                      Text(
                        _isKilowattMode
                            ? 'calculator.kilowatt_amount'.tr()
                            : 'calculator.payment_amount'.tr(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: context.spaceSmall),
                      TextFormField(
                        controller: _amountController,
                        enabled: !_isLoading,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*'),
                          ),
                        ],
                        decoration: InputDecoration(
                          hintText: _isKilowattMode
                              ? 'calculator.enter_kwh'.tr()
                              : 'calculator.enter_payment'.tr(),
                          prefixIcon: Icon(
                            _isKilowattMode
                                ? LucideIcons.zap
                                : LucideIcons.banknote,
                          ),
                        ),
                        validator: _amountValidator,
                      ),
                      SizedBox(height: context.spaceLarge),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _calculate,
                        child: _isLoading
                            ? SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: colorScheme.onPrimary,
                                ),
                              )
                            : Text('calculator.calculate'.tr()),
                      ),
                    ],
                  ),
                ),
              ),
              if (_errorMessage != null) ...[
                SizedBox(height: context.spaceMedium),
                _CalculatorErrorBanner(message: _errorMessage!),
              ],
              if (_result != null) ...[
                SizedBox(height: context.spaceMedium),
                _CalculatorResultCard(result: _result!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomerTypeDropdown extends StatelessWidget {
  final CustomerType value;
  final String Function(CustomerType) labelBuilder;
  final bool enabled;
  final ValueChanged<CustomerType?> onChanged;

  const _CustomerTypeDropdown({
    required this.value,
    required this.labelBuilder,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            border: Border.all(color: colorScheme.outline),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<CustomerType>(
              padding: EdgeInsets.zero,
              isExpanded: true,
              menuWidth: constraints.maxWidth,
              borderRadius: BorderRadius.circular(context.borderRadiusMedium),
              dropdownColor: colorScheme.surfaceContainerHigh,
              value: value,
              items: CustomerType.values
                  .map(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Text(labelBuilder(type)),
                    ),
                  )
                  .toList(),
              onChanged: enabled ? onChanged : null,
            ),
          ),
        );
      },
    );
  }
}

class _AmountModeSwitch extends StatelessWidget {
  final bool isKilowattMode;
  final bool enabled;
  final ValueChanged<bool> onChanged;

  const _AmountModeSwitch({
    required this.isKilowattMode,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            'calculator.calculate_from'.tr(),
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          'calculator.payment'.tr(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface.withValues(
              alpha: isKilowattMode ? 0.45 : 1,
            ),
            fontWeight: isKilowattMode ? null : FontWeight.w600,
          ),
        ),
        Switch(value: isKilowattMode, onChanged: enabled ? onChanged : null),
        Text(
          'calculator.kilowatt'.tr(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface.withValues(
              alpha: isKilowattMode ? 1 : 0.45,
            ),
            fontWeight: isKilowattMode ? FontWeight.w600 : null,
          ),
        ),
      ],
    );
  }
}

class _CalculatorErrorBanner extends StatelessWidget {
  final String message;

  const _CalculatorErrorBanner({required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(context.paddingMedium),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        border: Border.all(color: colorScheme.error.withValues(alpha: 0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(LucideIcons.alertCircle, size: 18, color: colorScheme.error),
          SizedBox(width: context.paddingSmall),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalculatorResultCard extends StatelessWidget {
  final FixedKilowattCalculateResponse result;

  const _CalculatorResultCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  LucideIcons.checkCircle2,
                  size: 18,
                  color: colorScheme.primary,
                ),
                SizedBox(width: context.paddingSmall * 0.5),
                Text(
                  'calculator.result.title'.tr(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.spaceMedium),
            _ResultRow(
              label: 'calculator.result.payment_amount'.tr(),
              value: formatDecimalAmount(result.paymentAmount),
            ),
            _ResultRow(
              label: 'calculator.result.kilowatt_amount'.tr(),
              value: 'calculator.result.kilowatt_value'.tr(
                args: [formatDecimalAmount(result.kilowattAmount)],
              ),
            ),
            _ResultRow(
              label: 'calculator.result.unit_price'.tr(),
              value: formatDecimalAmount(result.unitPrice),
            ),
            _ResultRow(
              label: 'calculator.result.fixed_charge'.tr(),
              value: formatDecimalAmount(result.fixedCharge),
            ),
            _ResultRow(
              label: 'calculator.result.tva'.tr(),
              value: formatDecimalAmount(result.tva),
            ),
            _ResultRow(
              label: 'calculator.result.plan_value'.tr(),
              value: formatDecimalAmount(result.planValue),
            ),
            _ResultRow(
              label: 'calculator.result.customer_type'.tr(),
              value: _localizedCustomerType(result.customerType),
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _ResultRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.paddingSmall),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLast) Divider(height: 1, color: colorScheme.outline),
      ],
    );
  }
}
