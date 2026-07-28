import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_pricing_override_dto.dart';
import 'package:shabakat/core/network/dto/request/customer/update_customer_request.dart';
import 'package:shabakat/data/providers/ampere_schedule/ampere_schedule_provider.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/data/providers/customer/single_customer_provider.dart';
import 'package:shabakat/data/providers/meter/meter_reading_provider.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
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
    return showAppFormBottomSheet<void>(
      context: context,
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
  late final TextEditingController _buildingController;
  late final TextEditingController _floorController;
  late final TextEditingController _cableNameController;
  late final TextEditingController _planValueController;
  late final TextEditingController _initialMeterReadingController;
  late final TextEditingController _priceOverrideController;
  late final TextEditingController _fixedChargeOverrideController;
  late final TextEditingController _tvaOverrideController;

  late CustomerType _customerType;
  late PlanType _plan;
  late CustomerStatus _customerStatus;
  CustomerRelation? _customerRelation;
  String? _selectedAreaId;
  String? _selectedAreaName;
  String? _selectedBoxId;
  String? _selectedBoxName;
  AmpereSchedule? _ampereSchedule;
  bool _hasPricingOverride = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final customer = widget.customer;
    _nameController = TextEditingController(text: customer.name);
    _phoneController = TextEditingController(text: customer.phone ?? '');
    _addressController = TextEditingController(text: customer.address ?? '');
    _buildingController = TextEditingController(text: customer.building ?? '');
    _floorController = TextEditingController(text: customer.floor ?? '');
    _cableNameController = TextEditingController(
      text: customer.cableName ?? '',
    );
    _planValueController = TextEditingController(
      text: customer.planValue.toStringAsFixed(
        customer.planValue.truncateToDouble() == customer.planValue ? 0 : 2,
      ),
    );
    _initialMeterReadingController = TextEditingController(
      text: customer.initialMeterReading?.toString() ?? '',
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
    _selectedBoxId = customer.boxId;
    _selectedBoxName = customer.boxName;
    _hasPricingOverride =
        customer.hasPricingOverride ||
        customer.priceOverride != null ||
        customer.fixedChargeOverride != null ||
        customer.tvaOverride != null;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncAreaIdFromName();
      _syncAmpereSchedule();
    });
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

  void _syncAmpereSchedule() {
    if (!mounted) return;
    if (_plan != PlanType.ampere) {
      if (_ampereSchedule != null) {
        setState(() => _ampereSchedule = null);
      }
      return;
    }
    if (_ampereSchedule != null) return;
    final scheduleId = widget.customer.ampereScheduleId;
    if (scheduleId == null) return;
    final schedules = ref.read(ampereScheduleProvider).asData?.value ?? [];
    for (final schedule in schedules) {
      if (schedule.id == scheduleId) {
        setState(() => _ampereSchedule = schedule);
        return;
      }
    }
  }

  String? _trimOrNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  double? _parseOptionalDouble(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    return double.parse(trimmed);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _buildingController.dispose();
    _floorController.dispose();
    _cableNameController.dispose();
    _planValueController.dispose();
    _initialMeterReadingController.dispose();
    _priceOverrideController.dispose();
    _fixedChargeOverrideController.dispose();
    _tvaOverrideController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;
    _selectedAreaId ??= _areaIdFromName();

    final planValue = double.parse(_planValueController.text.trim());
    final hadPricingOverride =
        widget.customer.hasPricingOverride ||
        widget.customer.priceOverride != null ||
        widget.customer.fixedChargeOverride != null ||
        widget.customer.tvaOverride != null;
    final prefs = ref.read(companyProvider).asData?.value;
    final ampereScheduleId =
        _plan == PlanType.ampere && prefs?.ampereSchedulePricingEnabled == true
        ? _ampereSchedule?.id
        : null;

    final hasMeterReadings =
        (ref.read(meterReadingProvider(widget.customerId)).asData?.value ??
                const [])
            .isNotEmpty;
    final canEditInitialMeterReading =
        _plan != PlanType.ampere && !hasMeterReadings;

    final request = UpdateCustomerRequest(
      name: _nameController.text.trim(),
      phone: _trimOrNull(_phoneController.text),
      address: _trimOrNull(_addressController.text),
      building: _trimOrNull(_buildingController.text),
      floor: _trimOrNull(_floorController.text),
      cableName: _trimOrNull(_cableNameController.text),
      boxId: _selectedBoxId,
      ampereScheduleId: ampereScheduleId,
      areaId: _selectedAreaId,
      customerType: _customerType,
      plan: _plan,
      planValue: planValue,
      initialMeterReading: canEditInitialMeterReading
          ? _parseOptionalDouble(_initialMeterReadingController.text)
          : null,
      customerStatus: _customerStatus,
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
      clearPricingOverride: !_hasPricingOverride && hadPricingOverride,
    );

    setState(() => _isSaving = true);
    try {
      final updated = await ref
          .read(customerProvider.notifier)
          .updateCustomer(request, widget.customerId);
      ref.read(singleCustomerProvider(widget.customerId).notifier).set(updated);
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'subscribers.edit.success'.tr(),
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      final message = e is ApiException
          ? e.userMessage
          : 'subscribers.edit.failed'.tr();
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
    ref.listen(ampereScheduleProvider, (_, next) {
      next.whenData((_) => _syncAmpereSchedule());
    });

    final isSaving = _isSaving;
    final preferences = ref.watch(companyProvider);
    final schedules = ref.watch(ampereScheduleProvider).asData?.value ?? [];
    final meterReadings = ref
        .watch(meterReadingProvider(widget.customerId))
        .asData
        ?.value;
    final showAmpereSchedule =
        preferences.asData?.value.ampereSchedulePricingEnabled == true &&
        _plan == PlanType.ampere;
    final showInitialMeterReading =
        _plan != PlanType.ampere &&
        meterReadings != null &&
        meterReadings.isEmpty;

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
              buildingController: _buildingController,
              floorController: _floorController,
              cableNameController: _cableNameController,
              planValueController: _planValueController,
              initialMeterReadingController: _initialMeterReadingController,
              priceOverrideController: _priceOverrideController,
              fixedChargeOverrideController: _fixedChargeOverrideController,
              tvaOverrideController: _tvaOverrideController,
              customerType: _customerType,
              plan: _plan,
              customerStatus: _customerStatus,
              customerRelation: _customerRelation,
              selectedAreaId: _selectedAreaId,
              selectedAreaName: _selectedAreaName,
              selectedBoxName: _selectedBoxName,
              ampereSchedule: _ampereSchedule,
              ampereSchedules: schedules,
              showAmpereSchedule: showAmpereSchedule,
              showInitialMeterReading: showInitialMeterReading,
              hasPricingOverride: _hasPricingOverride,
              isSaving: isSaving,
              onCustomerTypeChanged: (v) => setState(() => _customerType = v),
              onPlanChanged: (v) => setState(() {
                _plan = v;
                if (_plan != PlanType.ampere) {
                  _ampereSchedule = null;
                } else {
                  _initialMeterReadingController.clear();
                }
              }),
              onCustomerStatusChanged: (v) =>
                  setState(() => _customerStatus = v),
              onCustomerRelationChanged: (v) =>
                  setState(() => _customerRelation = v),
              onAmpereScheduleChanged: (v) =>
                  setState(() => _ampereSchedule = v),
              onAreaSelected: (area) => setState(() {
                _selectedAreaId = area.id;
                _selectedAreaName = area.name;
                _selectedBoxId = null;
                _selectedBoxName = null;
              }),
              onBoxSelected: (box) => setState(() {
                _selectedBoxId = box.id;
                _selectedBoxName = box.name;
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
