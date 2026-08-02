import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/data/providers/ampere_schedule/ampere_schedule_provider.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';

import '../widgets/filter_section/filter_section.dart';

class SubscribersFilters extends ConsumerStatefulWidget {
  const SubscribersFilters({super.key});

  @override
  ConsumerState<SubscribersFilters> createState() => _SubscribersFiltersState();
}

class _SubscribersFiltersState extends ConsumerState<SubscribersFilters> {
  CustomerRelation? _relation;
  PlanType? _planType;
  CustomerStatus? _customerStatus;
  String? _ampereScheduleId;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final filter = ref.read(customerFilterProvider);
    _relation = filter.customerRelation;
    _planType = filter.planType;
    _customerStatus = filter.customerStatus;
    _ampereScheduleId = filter.ampereScheduleId;
    _initialized = true;
  }

  void _applyFilters({required bool ampereScheduleEnabled}) {
    ref
        .read(customerFilterProvider.notifier)
        .updateFilter(
          ref
              .read(customerFilterProvider)
              .copyWith(
                customerRelation: _relation,
                planType: _planType,
                customerStatus: _customerStatus,
                ampereScheduleId: ampereScheduleEnabled
                    ? _ampereScheduleId
                    : null,
                pageNumber: 1,
              ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLoading = ref.watch(customerProvider).isLoading;
    final preferencesAsync = ref.watch(companyProvider);
    final ampereScheduleEnabled =
        preferencesAsync.asData?.value.ampereSchedulePricingEnabled == true;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('expenses.filter.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterSection<CustomerRelation>(
              title: 'subscribers.filter.relation'.tr(),
              value: _relation,
              items: CustomerRelation.values,
              labelBuilder: (e) => e.label,
              onChanged: (value) => setState(() => _relation = value),
            ),
            SizedBox(height: context.spaceMedium),
            FilterSection<PlanType>(
              title: 'subscribers.filter.plan'.tr(),
              value: _planType,
              items: PlanType.values,
              labelBuilder: (e) => e.label,
              onChanged: (value) => setState(() => _planType = value),
            ),
            SizedBox(height: context.spaceMedium),
            FilterSection<CustomerStatus>(
              title: 'subscribers.filter.status'.tr(),
              value: _customerStatus,
              items: CustomerStatus.values,
              labelBuilder: (e) => e.label,
              onChanged: (value) => setState(() => _customerStatus = value),
            ),
            if (ampereScheduleEnabled) ...[
              SizedBox(height: context.spaceMedium),
              ref
                  .watch(ampereScheduleProvider)
                  .when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (_, _) => const SizedBox.shrink(),
                    data: (schedules) {
                      AmpereSchedule? selected;
                      for (final schedule in schedules) {
                        if (schedule.id == _ampereScheduleId) {
                          selected = schedule;
                          break;
                        }
                      }

                      return FilterSection<AmpereSchedule>(
                        title: 'subscribers.filter.ampere_schedule'.tr(),
                        value: selected,
                        items: schedules,
                        labelBuilder: (e) => e.name,
                        onChanged: (value) =>
                            setState(() => _ampereScheduleId = value?.id),
                      );
                    },
                  ),
            ],
            SizedBox(height: context.spaceMedium),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () => _applyFilters(
                        ampereScheduleEnabled: ampereScheduleEnabled,
                      ),
                child: isLoading
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onPrimary,
                        ),
                      )
                    : Text(
                        'expenses.filter.apply'.tr(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
