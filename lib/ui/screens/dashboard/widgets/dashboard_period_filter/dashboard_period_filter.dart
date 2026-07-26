import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/request/dashboard/dashboard_filter_request.dart';
import 'package:shabakat/data/providers/dashboard/dashboard_filter_provider.dart';
import 'package:shabakat/ui/shared/dialogs/month_picker_dialog.dart';

enum _DashboardPeriod { allTime, thisMonth, custom }

class DashboardPeriodFilter extends ConsumerWidget {
  const DashboardPeriodFilter({super.key});

  _DashboardPeriod _periodFromFilter(DashboardFilterRequest filter) {
    final now = DateTime.now();
    if (filter.year == null && filter.month == null) {
      return _DashboardPeriod.allTime;
    }
    if (filter.year == now.year && filter.month == now.month) {
      return _DashboardPeriod.thisMonth;
    }
    return _DashboardPeriod.custom;
  }

  String _customLabel(BuildContext context, DashboardFilterRequest filter) {
    if (filter.year == null || filter.month == null) {
      return 'dashboard.filter.custom'.tr();
    }
    return DateFormat.yMMMM(
      context.locale.toString(),
    ).format(DateTime(filter.year!, filter.month!));
  }

  Future<void> _pickCustomMonth(
    BuildContext context,
    WidgetRef ref,
    DashboardFilterRequest current,
  ) async {
    final now = DateTime.now();
    final picked = await showMonthPickerDialog(
      context: context,
      title: 'dashboard.filter.pick_month'.tr(),
      initialYear: current.year ?? now.year,
      selectedYear: current.year,
      selectedMonth: current.month,
    );
    if (picked == null || !context.mounted) return;

    ref.read(dashboardFilterProvider.notifier).update(
      DashboardFilterRequest(year: picked.year, month: picked.month),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(dashboardFilterProvider);
    final selected = _periodFromFilter(filter);
    final notifier = ref.read(dashboardFilterProvider.notifier);
    final now = DateTime.now();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        context.paddingMedium,
        context.paddingMedium,
        context.spaceSmall,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(context.paddingSmall),
          child: Row(
            children: [
              Icon(
                LucideIcons.calendarRange,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: context.paddingSmall),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _PeriodChip(
                        label: 'dashboard.filter.all_time'.tr(),
                        selected: selected == _DashboardPeriod.allTime,
                        onSelected: () =>
                            notifier.update(const DashboardFilterRequest()),
                      ),
                      SizedBox(width: context.paddingSmall),
                      _PeriodChip(
                        label: 'dashboard.filter.this_month'.tr(),
                        selected: selected == _DashboardPeriod.thisMonth,
                        onSelected: () => notifier.update(
                          DashboardFilterRequest(
                            year: now.year,
                            month: now.month,
                          ),
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      _PeriodChip(
                        label: _customLabel(context, filter),
                        selected: selected == _DashboardPeriod.custom,
                        onSelected: () =>
                            _pickCustomMonth(context, ref, filter),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PeriodChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const _PeriodChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      showCheckmark: false,
      onSelected: (_) => onSelected(),
    );
  }
}
