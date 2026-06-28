import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/customer/create_customer_request.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_pricing_override_dto.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import '../widgets/area_select/area_select_field.dart';
import '../widgets/subscriber_edit_sheet/subscriber_edit_validators.dart';
import 'area_selecting_screen.dart';

class SubscriberAddingScreen extends ConsumerStatefulWidget {
  const SubscriberAddingScreen({super.key});

  @override
  ConsumerState<SubscriberAddingScreen> createState() =>
      _SubscriberAddingScreenState();
}

class _SubscriberAddingScreenState
    extends ConsumerState<SubscriberAddingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _areaFieldKey = GlobalKey<FormFieldState<Area>>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _planValueController = TextEditingController();
  final _priceOverrideController = TextEditingController();
  final _fixedChargeOverrideController = TextEditingController();
  final _tvaOverrideController = TextEditingController();

  CustomerType _customerType = CustomerType.residential;
  PlanType _plan = PlanType.ampere;
  DateTime _subscriptionDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  String? _dateError;
  CustomerRelation? _customerRelation;
  bool _hasPricingOverride = false;
  bool _isLoading = false;

  DateTime _toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _planValueController.dispose();
    _priceOverrideController.dispose();
    _fixedChargeOverrideController.dispose();
    _tvaOverrideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('subscribers.add.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: 'subscribers.form.name'.tr(),
                controller: _nameController,
                hint: 'subscribers.form.name_hint'.tr(),
                validator: SubscriberEditValidators.name,
              ),
              SizedBox(height: context.spaceMedium),
              _buildTextField(
                label: 'subscribers.form.phone'.tr(),
                controller: _phoneController,
                hint: 'subscribers.form.phone_hint'.tr(),
                keyboardType: TextInputType.phone,
                validator: SubscriberEditValidators.phone,
              ),
              SizedBox(height: context.spaceMedium),
              _buildAreaField(),
              SizedBox(height: context.spaceMedium),
              _buildTextField(
                label: 'subscribers.form.address'.tr(),
                controller: _addressController,
                hint: 'subscribers.form.address_hint'.tr(),
                validator: SubscriberEditValidators.address,
              ),
              SizedBox(height: context.spaceMedium),
              _buildDropdown(
                label: 'subscribers.form.customer_type'.tr(),
                value: _customerType,
                items: CustomerType.values,
                itemLabel: (e) => e.label,
                onChanged: (v) => setState(() => _customerType = v!),
              ),
              SizedBox(height: context.spaceMedium),
              _buildDropdown(
                label: 'subscribers.form.plan'.tr(),
                value: _plan,
                items: PlanType.values,
                itemLabel: (e) => e.label,
                onChanged: (v) => setState(() => _plan = v!),
              ),
              SizedBox(height: context.spaceMedium),
              _buildTextField(
                label: 'subscribers.form.plan_value'.tr(),
                controller: _planValueController,
                hint: 'subscribers.form.plan_value_hint'.tr(),
                keyboardType: TextInputType.number,
                validator: _validatePlanValue,
              ),
              SizedBox(height: context.spaceMedium),
              _buildDatePicker(context),
              SizedBox(height: context.spaceMedium),
              _buildDropdown(
                label: 'subscribers.form.customer_relation'.tr(),
                value: _customerRelation,
                items: [null, ...CustomerRelation.values],
                itemLabel: (e) => e?.label ?? 'subscribers.form.none'.tr(),
                onChanged: (v) => setState(() => _customerRelation = v),
              ),
              SizedBox(height: context.spaceMedium),
              Row(
                children: [
                  Text('subscribers.form.pricing_override'.tr(), style: theme.textTheme.titleMedium),
                  const Spacer(),
                  Switch(
                    value: _hasPricingOverride,
                    onChanged: (v) => setState(() => _hasPricingOverride = v),
                  ),
                ],
              ),
              if (_hasPricingOverride) ...[
                SizedBox(height: context.spaceSmall),
                _buildTextField(
                  label: 'subscribers.form.price_override'.tr(),
                  controller: _priceOverrideController,
                  hint: 'subscribers.form.amount_hint'.tr(),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (v) {
                    if (!_hasPricingOverride) return null;
                    if (v == null || v.trim().isEmpty) {
                      return 'settings.validation.required'.tr();
                    }
                    final n = double.tryParse(v.trim());
                    if (n == null) {
                      return 'subscribers.validation.invalid_number'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.spaceMedium),
                _buildTextField(
                  label: 'subscribers.form.fixed_charge_override'.tr(),
                  controller: _fixedChargeOverrideController,
                  hint: 'subscribers.form.amount_hint'.tr(),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (v) {
                    if (!_hasPricingOverride) return null;
                    if (v == null || v.trim().isEmpty) {
                      return 'settings.validation.required'.tr();
                    }
                    final n = double.tryParse(v.trim());
                    if (n == null) {
                      return 'subscribers.validation.invalid_number'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.spaceMedium),
                _buildTextField(
                  label: 'subscribers.form.tva_override'.tr(),
                  controller: _tvaOverrideController,
                  hint: 'subscribers.form.amount_hint'.tr(),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (v) {
                    if (!_hasPricingOverride) return null;
                    if (v == null || v.trim().isEmpty) {
                      return 'settings.validation.required'.tr();
                    }
                    final n = double.tryParse(v.trim());
                    if (n == null) {
                      return 'subscribers.validation.invalid_number'.tr();
                    }
                    return null;
                  },
                ),
              ],
              SizedBox(height: context.spaceMedium),
              Padding(
                padding: EdgeInsets.only(
                  bottom: context.spaceMedium + context.viewInsets.bottom,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _onSubmit,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            'subscribers.add.submit'.tr(),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: context.spaceSmall),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }

  Widget _buildAreaField() {
    return FormField<Area>(
      key: _areaFieldKey,
      validator: (value) =>
          value == null ? 'subscribers.validation.area_required'.tr() : null,
      builder: (field) {
        return AreaSelectField(
          areaName: field.value?.name,
          errorText: field.errorText,
          onTap: _openAreaSelecting,
        );
      },
    );
  }

  String? _validatePlanValue(String? value) =>
      SubscriberEditValidators.planValue(value);

  Widget _buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required String Function(T) itemLabel,
    required ValueChanged<T?> onChanged,
  }) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleMedium),
        SizedBox(height: context.spaceSmall),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.borderRadiusMedium),
                border: Border.all(color: scheme.outline),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  padding: EdgeInsets.zero,
                  isExpanded: true,
                  menuWidth: constraints.maxWidth,
                  borderRadius: BorderRadius.circular(
                    context.borderRadiusMedium,
                  ),
                  dropdownColor: scheme.surfaceContainerHigh,
                  elevation: 4,
                  alignment: AlignmentDirectional.centerStart,
                  style: theme.textTheme.bodyMedium,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: scheme.onSurfaceVariant,
                    size: 22,
                  ),
                  value: value,
                  items: items.map((e) {
                    return DropdownMenuItem<T>(
                      value: e,
                      child: Text(itemLabel(e)),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('subscribers.form.subscription_date'.tr(), style: theme.textTheme.titleMedium),
        SizedBox(height: context.spaceSmall),
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              setState(() {
                _subscriptionDate = _toDateOnly(picked);
                _dateError = null;
              });
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.paddingMedium,
              vertical: context.spaceMedium,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.borderRadiusMedium),
              border: Border.all(color: scheme.outline),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${_subscriptionDate.year.toString().padLeft(4, '0')}-${_subscriptionDate.month.toString().padLeft(2, '0')}-${_subscriptionDate.day.toString().padLeft(2, '0')}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: _dateError != null ? scheme.error : null,
                    ),
                  ),
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  color: scheme.onSurfaceVariant,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (_dateError != null) ...[
          SizedBox(height: context.spaceSmall),
          Text(
            _dateError!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: scheme.error,
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _openAreaSelecting() async {
    final result = await Navigator.of(
      context,
    ).push(openInnerScreen(widget: const AreaSelectingScreen()));
    if (result is Area) _areaFieldKey.currentState?.didChange(result);
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final selectedArea = _areaFieldKey.currentState?.value;
    if (selectedArea == null) return;

    if (_toDateOnly(_subscriptionDate).isAfter(_toDateOnly(DateTime.now()))) {
      setState(() => _dateError = 'subscribers.validation.subscription_date_future'.tr());
      return;
    }

    final planValue = double.parse(_planValueController.text.trim());

    setState(() => _isLoading = true);

    final request = CreateCustomerRequest(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      address: _addressController.text.trim(),
      areaId: selectedArea.id,
      customerType: _customerType,
      plan: _plan,
      planValue: planValue,
      subscriptionDate: _subscriptionDate,
      customerRelation: _customerRelation,
      pricingOverride: _hasPricingOverride
          ? CustomerPricingOverrideDto(
              price: double.parse(_priceOverrideController.text.trim()),
              fixedCharge: double.parse(
                _fixedChargeOverrideController.text.trim(),
              ),
              tva: double.parse(_tvaOverrideController.text.trim()),
            )
          : null,
    );

    try {
      await ref.read(customerProvider.notifier).addCustomer(request);
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'subscribers.add.success'.tr(),
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'subscribers.add.failed'.tr();
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
