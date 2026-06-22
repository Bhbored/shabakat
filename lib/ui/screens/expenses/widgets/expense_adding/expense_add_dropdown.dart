import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class ExpenseAddDropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<T> items;
  final String Function(T) itemLabel;
  final bool enabled;
  final ValueChanged<T?> onChanged;

  const ExpenseAddDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                border: Border.all(color: colorScheme.outline),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  padding: EdgeInsets.zero,
                  isExpanded: true,
                  menuWidth: constraints.maxWidth,
                  borderRadius: BorderRadius.circular(
                    context.borderRadiusMedium,
                  ),
                  dropdownColor: colorScheme.surfaceContainerHigh,
                  elevation: 4,
                  alignment: AlignmentDirectional.centerStart,
                  style: theme.textTheme.bodyMedium,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colorScheme.onSurfaceVariant,
                    size: 22,
                  ),
                  value: value,
                  items: items.map((e) {
                    return DropdownMenuItem<T>(
                      value: e,
                      child: Text(itemLabel(e)),
                    );
                  }).toList(),
                  onChanged: enabled ? onChanged : null,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
