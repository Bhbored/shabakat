import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/area/area.dart';

import 'subscriber_edit_area_field.dart';
import 'subscriber_edit_dropdown.dart';
import 'subscriber_edit_form_field.dart';
import 'subscriber_edit_pricing_section.dart';
import 'subscriber_edit_save_button.dart';
import 'subscriber_edit_validators.dart';

class SubscriberEditForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController planValueController;
  final TextEditingController priceOverrideController;
  final TextEditingController fixedChargeOverrideController;
  final TextEditingController tvaOverrideController;
  final CustomerType customerType;
  final PlanType plan;
  final CustomerStatus customerStatus;
  final CustomerRelation? customerRelation;
  final String? selectedAreaId;
  final String? selectedAreaName;
  final bool hasPricingOverride;
  final bool isSaving;
  final ValueChanged<CustomerType> onCustomerTypeChanged;
  final ValueChanged<PlanType> onPlanChanged;
  final ValueChanged<CustomerStatus> onCustomerStatusChanged;
  final ValueChanged<CustomerRelation?> onCustomerRelationChanged;
  final ValueChanged<Area> onAreaSelected;
  final ValueChanged<bool> onPricingOverrideChanged;
  final VoidCallback onSave;

  const SubscriberEditForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.planValueController,
    required this.priceOverrideController,
    required this.fixedChargeOverrideController,
    required this.tvaOverrideController,
    required this.customerType,
    required this.plan,
    required this.customerStatus,
    required this.customerRelation,
    required this.selectedAreaId,
    required this.selectedAreaName,
    required this.hasPricingOverride,
    required this.isSaving,
    required this.onCustomerTypeChanged,
    required this.onPlanChanged,
    required this.onCustomerStatusChanged,
    required this.onCustomerRelationChanged,
    required this.onAreaSelected,
    required this.onPricingOverrideChanged,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubscriberEditFormField(
              label: 'subscribers.form.name'.tr(),
              controller: nameController,
              hint: 'subscribers.form.name_hint'.tr(),
              validator: SubscriberEditValidators.name,
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditFormField(
              label: 'subscribers.form.phone'.tr(),
              controller: phoneController,
              hint: 'subscribers.form.phone_hint'.tr(),
              keyboardType: TextInputType.phone,
              validator: SubscriberEditValidators.phone,
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditAreaField(
              areaName: selectedAreaName,
              enabled: !isSaving,
              onAreaSelected: onAreaSelected,
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditFormField(
              label: 'subscribers.form.address'.tr(),
              controller: addressController,
              hint: 'subscribers.form.address_hint'.tr(),
              validator: SubscriberEditValidators.address,
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditDropdown<CustomerType>(
              label: 'subscribers.form.customer_type'.tr(),
              value: customerType,
              items: CustomerType.values,
              itemLabel: (e) => e.label,
              onChanged: isSaving ? null : (v) => onCustomerTypeChanged(v!),
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditDropdown<PlanType>(
              label: 'subscribers.form.plan'.tr(),
              value: plan,
              items: PlanType.values,
              itemLabel: (e) => e.label,
              onChanged: isSaving ? null : (v) => onPlanChanged(v!),
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditFormField(
              label: 'subscribers.form.plan_value'.tr(),
              controller: planValueController,
              hint: 'subscribers.form.plan_value_hint'.tr(),
              keyboardType: TextInputType.number,
              validator: SubscriberEditValidators.planValue,
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditDropdown<CustomerStatus>(
              label: 'subscribers.form.status'.tr(),
              value: customerStatus,
              items: CustomerStatus.values,
              itemLabel: (e) => e.label,
              onChanged: isSaving ? null : (v) => onCustomerStatusChanged(v!),
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditDropdown<CustomerRelation?>(
              label: 'subscribers.form.customer_relation'.tr(),
              value: customerRelation,
              items: [null, ...CustomerRelation.values],
              itemLabel: (e) => e?.label ?? 'subscribers.form.none'.tr(),
              onChanged: isSaving ? null : onCustomerRelationChanged,
            ),
            SizedBox(height: context.spaceMedium),
            SubscriberEditPricingSection(
              hasPricingOverride: hasPricingOverride,
              enabled: !isSaving,
              priceOverrideController: priceOverrideController,
              fixedChargeOverrideController: fixedChargeOverrideController,
              tvaOverrideController: tvaOverrideController,
              onToggle: onPricingOverrideChanged,
            ),
            SizedBox(height: context.spaceMedium),
            Padding(
              padding: EdgeInsets.only(
                bottom: context.spaceMedium + context.viewInsets.bottom,
              ),
              child: SubscriberEditSaveButton(
                isSaving: isSaving,
                onPressed: onSave,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
