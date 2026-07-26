import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

typedef MonthPickerResult = ({int year, int month});

Future<MonthPickerResult?> showMonthPickerDialog({
  required BuildContext context,
  int? initialYear,
  int? selectedYear,
  int? selectedMonth,
  DateTime? firstDate,
  DateTime? lastDate,
  String? title,
}) {
  final now = DateTime.now();
  final first = firstDate ?? DateTime(2000);
  final last = lastDate ?? now;
  final year = initialYear ?? now.year;

  return showAppDialog<MonthPickerResult>(
    context: context,
    builder: (dialogContext) => _MonthPickerDialog(
      title: title,
      initialYear: year.clamp(first.year, last.year),
      selectedYear: selectedYear,
      selectedMonth: selectedMonth,
      firstDate: first,
      lastDate: last,
    ),
  );
}

class _MonthPickerDialog extends StatefulWidget {
  final String? title;
  final int initialYear;
  final int? selectedYear;
  final int? selectedMonth;
  final DateTime firstDate;
  final DateTime lastDate;

  const _MonthPickerDialog({
    this.title,
    required this.initialYear,
    this.selectedYear,
    this.selectedMonth,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  State<_MonthPickerDialog> createState() => _MonthPickerDialogState();
}

class _MonthPickerDialogState extends State<_MonthPickerDialog> {
  late int _year;

  @override
  void initState() {
    super.initState();
    _year = widget.initialYear;
  }

  bool get _canGoToPreviousYear => _year > widget.firstDate.year;

  bool get _canGoToNextYear => _year < widget.lastDate.year;

  bool _isMonthEnabled(int month) {
    if (_year < widget.firstDate.year || _year > widget.lastDate.year) {
      return false;
    }
    if (_year == widget.firstDate.year && month < widget.firstDate.month) {
      return false;
    }
    if (_year == widget.lastDate.year && month > widget.lastDate.month) {
      return false;
    }
    return true;
  }

  String _monthLabel(BuildContext context, int month) {
    return DateFormat.MMMM(
      context.locale.toString(),
    ).format(DateTime(_year, month));
  }

  void _selectMonth(int month) {
    if (!_isMonthEnabled(month)) return;
    Navigator.of(context).pop((year: _year, month: month));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppAlertDialog(
      title: Text(widget.title ?? 'dashboard.filter.pick_month'.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _canGoToPreviousYear
                    ? () => setState(() => _year -= 1)
                    : null,
                icon: const Icon(Icons.chevron_left),
              ),
              Text(
                '$_year',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: _canGoToNextYear
                    ? () => setState(() => _year += 1)
                    : null,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
          SizedBox(height: context.spaceSmall),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var row = 0; row < 4; row++) ...[
                if (row > 0) SizedBox(height: context.paddingSmall),
                Row(
                  children: [
                    for (var col = 0; col < 3; col++) ...[
                      if (col > 0) SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: _MonthCell(
                          label: _monthLabel(context, row * 3 + col + 1),
                          enabled: _isMonthEnabled(row * 3 + col + 1),
                          selected:
                              widget.selectedYear != null &&
                              widget.selectedMonth != null &&
                              row * 3 + col + 1 == widget.selectedMonth &&
                              _year == widget.selectedYear,
                          onTap: () => _selectMonth(row * 3 + col + 1),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
      ],
    );
  }
}

class _MonthCell extends StatelessWidget {
  final String label;
  final bool enabled;
  final bool selected;
  final VoidCallback onTap;

  const _MonthCell({
    required this.label,
    required this.enabled,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: selected ? colorScheme.primary : colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        side: BorderSide(
          color: selected ? colorScheme.primary : colorScheme.outline,
        ),
      ),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        child: SizedBox(
          height: context.spaceLarge,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelLarge?.copyWith(
                color: enabled
                    ? (selected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface)
                    : colorScheme.onSurface.withValues(alpha: 0.38),
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
