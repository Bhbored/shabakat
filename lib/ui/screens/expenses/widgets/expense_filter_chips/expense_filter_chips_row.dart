import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/request/expenses/expense_filter_request.dart';
import 'package:shabakat/core/themes/controls_themes.dart';
import 'package:shabakat/data/providers/expense/expense_filter_provider.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/expense_filters_screen.dart';
import '../expense_card/expense_type_badge.dart';

class ExpenseFilterChipsRow extends ConsumerWidget {
  const ExpenseFilterChipsRow({super.key});

  DateTime _toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  DateTime? _effectiveDateTo(ExpenseFilterRequest filter) {
    if (filter.dateTo != null) return _toDateOnly(filter.dateTo!);
    if (filter.dateFrom != null) return _toDateOnly(DateTime.now());
    return null;
  }

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(expenseFilterProvider);
    final effectiveTo = _effectiveDateTo(filter);
    final chips = <Widget>[];

    if (filter.dateFrom != null) {
      chips.add(
        _FilterDateChip(
          label: 'From',
          date: _formatDate(_toDateOnly(filter.dateFrom!)),
        ),
      );
    }
    if (effectiveTo != null) {
      chips.add(
        _FilterDateChip(label: 'To', date: _formatDate(effectiveTo)),
      );
    }
    if (filter.expenseType != null) {
      chips.add(ExpenseTypeBadge(type: filter.expenseType!));
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
                openInnerScreen(widget: const ExpenseFiltersScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FilterDateChip extends StatelessWidget {
  final String label;
  final String date;

  const _FilterDateChip({required this.label, required this.date});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final color = colorScheme.primary;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.5,
      ),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Text(
        '$label: $date',
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
