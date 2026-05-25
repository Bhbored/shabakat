import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/data/app_data.dart';

class SubscriberDropdown extends StatelessWidget {
  final int selectedId;
  final ValueChanged<int> onChanged;

  const SubscriberDropdown({
    super.key,
    required this.selectedId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        border: Border.all(color: colorScheme.outline),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedId,
          isExpanded: true,
          dropdownColor: colorScheme.surface,
          icon: Icon(
            LucideIcons.chevronDown,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
            size: 18,
          ),
          style: theme.textTheme.bodyMedium,
          items: allSubscribers.map((s) {
            return DropdownMenuItem<int>(
              value: s.id,
              child: Text('${s.name} — ${s.area} (${s.ampere})'),
            );
          }).toList(),
          onChanged: (id) {
            if (id != null) onChanged(id);
          },
        ),
      ),
    );
  }
}
