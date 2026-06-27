import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class FilterDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String Function(T) labelBuilder;
  final ValueChanged<T?>? onChanged;

  const FilterDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            border: Border.all(color: scheme.outline),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T?>(
              padding: EdgeInsets.zero,
              isExpanded: true,
              menuWidth: constraints.maxWidth,
              borderRadius: BorderRadius.circular(context.borderRadiusMedium),
              dropdownColor: scheme.surfaceContainerHigh,
              elevation: 4,
              alignment: AlignmentDirectional.centerStart,
              style: theme.textTheme.bodyMedium,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: scheme.onSurfaceVariant,
                size: 22,
              ),
              hint: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text('common.all'.tr()),
              ),
              value: value,
              items: [
                DropdownMenuItem<T?>(
                  value: null,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('common.all'.tr()),
                  ),
                ),
                ...items.map((e) {
                  return DropdownMenuItem<T?>(
                    value: e,
                    child: Text(labelBuilder(e)),
                  );
                }),
              ],
              onChanged: onChanged,
            ),
          ),
        );
      },
    );
  }
}
