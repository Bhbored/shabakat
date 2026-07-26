import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/invoice_filters_screen.dart';
import '../invoice_card/invoice_status_badge.dart';
import 'invoice_filter_date_chip.dart';

class InvoiceFilterChipsRow extends ConsumerWidget {
  const InvoiceFilterChipsRow({super.key});

  DateTime _toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  DateTime? _effectiveDateTo(InvoiceFilterRequest filter) {
    if (filter.consumptionStartTo != null) {
      return _toDateOnly(filter.consumptionStartTo!);
    }
    if (filter.consumptionStartFrom != null) {
      return _toDateOnly(DateTime.now());
    }
    return null;
  }

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(invoiceFilterProvider);
    final effectiveTo = _effectiveDateTo(filter);
    final chips = <Widget>[];

    if (filter.consumptionStartFrom != null) {
      chips.add(
        InvoiceFilterDateChip(
          label: 'invoices.filter.from'.tr(),
          date: _formatDate(_toDateOnly(filter.consumptionStartFrom!)),
        ),
      );
    }
    if (effectiveTo != null) {
      chips.add(
        InvoiceFilterDateChip(label: 'invoices.filter.to'.tr(), date: _formatDate(effectiveTo)),
      );
    }
    if (filter.invoiceStatus != null) {
      chips.add(InvoiceStatusBadge(status: filter.invoiceStatus!));
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        0,
        context.paddingSmall,
        context.spaceSmall,
      ),
      child: Row(
        children: [
          Expanded(
            child: chips.isEmpty
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0; i < chips.length; i++) ...[
                          if (i > 0) SizedBox(width: context.paddingSmall),
                          chips[i],
                        ],
                      ],
                    ),
                  ),
          ),
          IconButton(
            icon: const Icon(LucideIcons.slidersHorizontal),
            onPressed: () {
              Navigator.of(context).push(
                openInnerScreen(widget: const InvoiceFiltersScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
