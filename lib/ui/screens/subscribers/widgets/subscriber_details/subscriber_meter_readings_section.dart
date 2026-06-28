import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/meter/meter_reading_provider.dart';
import 'package:shabakat/domain/entities/meter/meter_reading.dart';

import 'meter_reading_card.dart';
import 'subscriber_record_meter_reading_dialog.dart';

class SubscriberMeterReadingsSection extends ConsumerStatefulWidget {
  final String customerId;
  final String? customerName;
  final CustomerStatus customerStatus;
  final PlanType plan;

  const SubscriberMeterReadingsSection({
    super.key,
    required this.customerId,
    required this.customerStatus,
    required this.plan,
    this.customerName,
  });

  @override
  ConsumerState<SubscriberMeterReadingsSection> createState() =>
      _SubscriberMeterReadingsSectionState();
}

class _SubscriberMeterReadingsSectionState
    extends ConsumerState<SubscriberMeterReadingsSection> {
  static const _pageSize = 5;

  int _pageIndex = 0;

  int _effectivePageIndex(int totalCount) {
    if (totalCount == 0) return 0;
    final maxPage = (totalCount - 1) ~/ _pageSize;
    return _pageIndex.clamp(0, maxPage);
  }

  List<MeterReading> _pageSlice(List<MeterReading> readings, int pageIndex) {
    final start = pageIndex * _pageSize;
    if (start >= readings.length) return [];
    final end = (start + _pageSize).clamp(0, readings.length);
    return readings.sublist(start, end);
  }

  void _previousPage() {
    if (_pageIndex > 0) setState(() => _pageIndex--);
  }

  void _nextPage(int totalCount) {
    final pageIndex = _effectivePageIndex(totalCount);
    if ((pageIndex + 1) * _pageSize < totalCount) {
      setState(() => _pageIndex = pageIndex + 1);
    }
  }

  bool _canAddReading(List<MeterReading> readings) {
    if (readings.isEmpty) return true;
    final latest = readings.first;
    final now = DateTime.now();
    return latest.createdAt.year < now.year ||
        latest.createdAt.month < now.month;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final readingsAsync = ref.watch(meterReadingProvider(widget.customerId));

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'subscribers.meter_readings.title'.tr(),
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (widget.plan != PlanType.fixedKilowatt &&
                    widget.customerStatus == CustomerStatus.active &&
                    readingsAsync.maybeWhen(
                      data: _canAddReading,
                      orElse: () => false,
                    ))
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => showSubscriberRecordMeterReadingDialog(
                      context: context,
                      customerId: widget.customerId,
                      customerName: widget.customerName,
                    ),
                  ),
                readingsAsync.maybeWhen(
                  data: (readings) {
                    final pageIndex = _effectivePageIndex(readings.length);
                    final hasPrevious = pageIndex > 0;
                    final hasNext =
                        (pageIndex + 1) * _pageSize < readings.length;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: hasPrevious ? _previousPage : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: hasNext ? () => _nextPage(readings.length) : null,
                        ),
                      ],
                    );
                  },
                  orElse: () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: null,
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            Divider(color: colorScheme.outline.withValues(alpha: 0.5)),
            SizedBox(height: context.spaceSmall),
            readingsAsync.when(
              skipLoadingOnRefresh: true,
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (err, _) {
                final message = err is ApiException
                    ? err.userMessage
                    : 'subscribers.meter_readings.load_failed'.tr();
                return Text(message, style: theme.textTheme.bodyMedium);
              },
              data: (readings) {
                final pageIndex = _effectivePageIndex(readings.length);
                final pageReadings = _pageSlice(readings, pageIndex);

                if (readings.isEmpty) {
                  return Text(
                    'subscribers.meter_readings.empty'.tr(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  );
                }

                return Column(
                  children: [
                    for (var i = 0; i < pageReadings.length; i++) ...[
                      if (i > 0) SizedBox(height: context.spaceSmall),
                      MeterReadingCard(
                        customerId: widget.customerId,
                        reading: pageReadings[i],
                        canDelete: widget.plan != PlanType.fixedKilowatt,
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
