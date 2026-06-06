import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

import '../filter_dropdown/filter_dropdown.dart';

class FilterSection<T> extends StatelessWidget {
  final String title;
  final T? value;
  final List<T> items;
  final String Function(T) labelBuilder;
  final ValueChanged<T?>? onChanged;

  const FilterSection({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleMedium),
        SizedBox(height: context.spaceSmall),
        FilterDropdown<T>(
          value: value,
          items: items,
          labelBuilder: labelBuilder,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
