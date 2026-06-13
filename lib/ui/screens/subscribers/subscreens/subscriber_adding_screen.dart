import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_type.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/network/dto/request/customer/create_customer_request.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_pricing_override_dto.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../widgets/area_select/area_select_field.dart';
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
  DateTime _subscriptionDate = DateTime.now();
  String? _dateError;
  CustomerRelation? _customerRelation;
  bool _hasPricingOverride = false;
  bool _isLoading = false;

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
        title: const Text('Add Subscriber'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: 'Name',
                controller: _nameController,
                hint: 'Enter full name',
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Enter subscriber name';
                  }
                  if (v.trim().length > 200) return 'Max 200 characters';
                  return null;
                },
              ),
              SizedBox(height: context.spaceMedium),
              _buildTextField(
                label: 'Phone',
                controller: _phoneController,
                hint: 'Enter phone number',
                keyboardType: TextInputType.phone,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Enter phone number';
                  }
                  if (v.trim().length > 30) return 'Max 30 characters';
                  return null;
                },
              ),
              SizedBox(height: context.spaceMedium),
              _buildAreaField(),
              SizedBox(height: context.spaceMedium),
              _buildTextField(
                label: 'Address',
                controller: _addressController,
                hint: 'Enter address',
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Enter address';
                  }
                  if (v.trim().length > 500) return 'Max 500 characters';
                  return null;
                },
              ),
              SizedBox(height: context.spaceMedium),
              _buildDropdown(
                label: 'Customer Type',
                value: _customerType,
                items: CustomerType.values,
                itemLabel: (e) => e.label,
                onChanged: (v) => setState(() => _customerType = v!),
              ),
              SizedBox(height: context.spaceMedium),
              _buildDropdown(
                label: 'Plan',
                value: _plan,
                items: PlanType.values,
                itemLabel: (e) => e.label,
                onChanged: (v) => setState(() => _plan = v!),
              ),
              SizedBox(height: context.spaceMedium),
              _buildTextField(
                label: 'Plan Value',
                controller: _planValueController,
                hint: '1-100',
                keyboardType: TextInputType.number,
                validator: _validatePlanValue,
              ),
              SizedBox(height: context.spaceMedium),
              _buildDatePicker(context),
              SizedBox(height: context.spaceMedium),
              _buildDropdown(
                label: 'Customer Relation',
                value: _customerRelation,
                items: [null, ...CustomerRelation.values],
                itemLabel: (e) => e?.label ?? 'None',
                onChanged: (v) => setState(() => _customerRelation = v),
              ),
              SizedBox(height: context.spaceMedium),
              Row(
                children: [
                  Text('Pricing Override', style: theme.textTheme.titleMedium),
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
                  label: 'Price Override',
                  controller: _priceOverrideController,
                  hint: '0.00',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (v) {
                    if (!_hasPricingOverride) return null;
                    if (v == null || v.trim().isEmpty) return 'Required';
                    final n = double.tryParse(v.trim());
                    if (n == null) return 'Invalid number';
                    return null;
                  },
                ),
                SizedBox(height: context.spaceMedium),
                _buildTextField(
                  label: 'Fixed Charge Override',
                  controller: _fixedChargeOverrideController,
                  hint: '0.00',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (v) {
                    if (!_hasPricingOverride) return null;
                    if (v == null || v.trim().isEmpty) return 'Required';
                    final n = double.tryParse(v.trim());
                    if (n == null) return 'Invalid number';
                    return null;
                  },
                ),
                SizedBox(height: context.spaceMedium),
                _buildTextField(
                  label: 'TVA Override',
                  controller: _tvaOverrideController,
                  hint: '0.00',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (v) {
                    if (!_hasPricingOverride) return null;
                    if (v == null || v.trim().isEmpty) return 'Required';
                    final n = double.tryParse(v.trim());
                    if (n == null) return 'Invalid number';
                    return null;
                  },
                ),
              ],
              SizedBox(height: context.spaceExtraLarge),
              SizedBox(
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
                          'Add Subscriber',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
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
      validator: (value) => value == null ? 'Select an area' : null,
      builder: (field) {
        return AreaSelectField(
          areaName: field.value?.name,
          errorText: field.errorText,
          onTap: _openAreaSelecting,
        );
      },
    );
  }

  String? _validatePlanValue(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter plan value';
    final parsed = int.tryParse(value.trim());
    if (parsed == null) return 'Enter a valid number';
    if (parsed < 1 || parsed > 100) return 'Must be between 1 and 100';
    return null;
  }

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
        Text('Subscription Date', style: theme.textTheme.titleMedium),
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
                _subscriptionDate = picked;
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

    final today = DateTime.now();
    final isFutureDate = _subscriptionDate.isAfter(
      DateTime(today.year, today.month, today.day),
    );
    if (isFutureDate) {
      setState(() => _dateError = 'Subscription date cannot be in the future');
      return;
    }

    final planValue = double.parse(_planValueController.text.trim());

    setState(() => _isLoading = true);

    final request = CreateCustomerRequest(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      address: _addressController.text.trim(),
      areaId: selectedArea.id,
      customerType: _customerType.label,
      plan: _plan.label,
      planValue: planValue,
      subscriptionDate: _subscriptionDate,
      customerRelation: _customerRelation?.label,
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
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to add subscriber: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
