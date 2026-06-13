import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_pricing_override_dto.dart';
import 'package:shabakat/core/network/dto/request/customer/update_customer_request.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/data/providers/customer/single_customer_provider.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import 'subscriber_edit_form.dart';
import 'subscriber_edit_sheet_header.dart';

class SubscriberEditSheet extends ConsumerStatefulWidget {
  final String customerId;
  final Customer customer;

  const SubscriberEditSheet({
    super.key,
    required this.customerId,
    required this.customer,
  });

  static Future<void> show(
    BuildContext context, {
    required String customerId,
    required Customer customer,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) =>
          SubscriberEditSheet(customerId: customerId, customer: customer),
    );
  }

  @override
  ConsumerState<SubscriberEditSheet> createState() =>
      _SubscriberEditSheetState();
}

class _SubscriberEditSheetState extends ConsumerState<SubscriberEditSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _planValueController;
  late final TextEditingController _priceOverrideController;
  late final TextEditingController _fixedChargeOverrideController;
  late final TextEditingController _tvaOverrideController;

  late CustomerType _customerType;
  late PlanType _plan;
  late CustomerStatus _customerStatus;
  CustomerRelation? _customerRelation;
  String? _selectedAreaId;
  String? _selectedAreaName;
  bool _hasPricingOverride = false;

  @override
  void initState() {
    super.initState();
    final customer = widget.customer;
    _nameController = TextEditingController(text: customer.name);
    _phoneController = TextEditingController(text: customer.phone ?? '');
    _addressController = TextEditingController(text: customer.address ?? '');
    _planValueController = TextEditingController(
      text: customer.planValue.toStringAsFixed(
        customer.planValue.truncateToDouble() == customer.planValue ? 0 : 2,
      ),
    );
    _priceOverrideController = TextEditingController(
      text: customer.priceOverride?.toString() ?? '',
    );
    _fixedChargeOverrideController = TextEditingController(
      text: customer.fixedChargeOverride?.toString() ?? '',
    );
    _tvaOverrideController = TextEditingController(
      text: customer.tvaOverride?.toString() ?? '',
    );
    _customerType = customer.customerType;
    _plan = customer.plan;
    _customerStatus = customer.customerStatus;
    _customerRelation = customer.customerRelation;
    _selectedAreaId = customer.areaId;
    _selectedAreaName = customer.areaName;
    _hasPricingOverride =
        customer.priceOverride != null ||
        customer.fixedChargeOverride != null ||
        customer.tvaOverride != null;

    WidgetsBinding.instance.addPostFrameCallback((_) => _syncAreaIdFromName());
  }

  String? _areaIdFromName() {
    if (_selectedAreaName == null) return null;
    final areas = ref.read(areaProvider).asData?.value;
    if (areas == null) return null;
    for (final area in areas) {
      if (area.name == _selectedAreaName) return area.id;
    }
    return null;
  }

  void _syncAreaIdFromName() {
    if (!mounted || _selectedAreaId != null) return;
    final id = _areaIdFromName();
    if (id != null) setState(() => _selectedAreaId = id);
  }

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

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;
    _selectedAreaId ??= _areaIdFromName();
    if (_selectedAreaId == null) {
      AppSnackBar.show(
        context,
        message: 'Select an area',
        variant: AppSnackBarVariant.error,
      );
      return;
    }

    final planValue = double.parse(_planValueController.text.trim());
    final hadPricingOverride =
        widget.customer.priceOverride != null ||
        widget.customer.fixedChargeOverride != null ||
        widget.customer.tvaOverride != null;

    final request = UpdateCustomerRequest(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      address: _addressController.text.trim(),
      areaId: _selectedAreaId,
      customerType: _customerType.label,
      plan: _plan.label,
      planValue: planValue,
      customerStatus: _customerStatus.name,
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
      clearPricingOverride: !_hasPricingOverride && hadPricingOverride,
    );

    try {
      await ref
          .read(customerProvider.notifier)
          .updateCustomer(request, widget.customerId);
      await ref
          .read(singleCustomerProvider(widget.customerId).notifier)
          .refresh();
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'Subscriber updated',
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'Failed to update subscriber. Please try again.';
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(areaProvider, (_, next) {
      next.whenData((_) => _syncAreaIdFromName());
    });

    final isSaving = ref.watch(customerProvider).isLoading;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubscriberEditSheetHeader(
            isSaving: isSaving,
            onClose: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: SubscriberEditForm(
              formKey: _formKey,
              nameController: _nameController,
              phoneController: _phoneController,
              addressController: _addressController,
              planValueController: _planValueController,
              priceOverrideController: _priceOverrideController,
              fixedChargeOverrideController: _fixedChargeOverrideController,
              tvaOverrideController: _tvaOverrideController,
              customerType: _customerType,
              plan: _plan,
              customerStatus: _customerStatus,
              customerRelation: _customerRelation,
              selectedAreaId: _selectedAreaId,
              selectedAreaName: _selectedAreaName,
              hasPricingOverride: _hasPricingOverride,
              isSaving: isSaving,
              onCustomerTypeChanged: (v) => setState(() => _customerType = v),
              onPlanChanged: (v) => setState(() => _plan = v),
              onCustomerStatusChanged: (v) =>
                  setState(() => _customerStatus = v),
              onCustomerRelationChanged: (v) =>
                  setState(() => _customerRelation = v),
              onAreaSelected: (area) => setState(() {
                _selectedAreaId = area.id;
                _selectedAreaName = area.name;
              }),
              onPricingOverrideChanged: (v) =>
                  setState(() => _hasPricingOverride = v),
              onSave: _onSave,
            ),
          ),
        ],
      ),
    );
  }
}
