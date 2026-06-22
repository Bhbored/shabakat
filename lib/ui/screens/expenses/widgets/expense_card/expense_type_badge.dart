import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/expense_type.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class ExpenseTypeBadge extends StatelessWidget {
  final ExpenseType type;

  const ExpenseTypeBadge({super.key, required this.type});

  static IconData iconFor(ExpenseType type) => switch (type) {
    ExpenseType.fuel => LucideIcons.fuel,
    ExpenseType.maintenance => LucideIcons.wrench,
    ExpenseType.employees => LucideIcons.users,
    ExpenseType.other => LucideIcons.tag,
  };

  static Color colorFor(ExpenseType type, ColorScheme colorScheme) =>
      switch (type) {
        ExpenseType.fuel => AppColors.warning,
        ExpenseType.maintenance => colorScheme.primary,
        ExpenseType.employees => AppColors.success,
        ExpenseType.other => colorScheme.onSurface.withValues(alpha: 0.55),
      };

  IconData get _icon => iconFor(type);

  Color _color(ColorScheme colorScheme) => colorFor(type, colorScheme);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = _color(colorScheme);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.5,
      ),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icon, size: 12, color: color),
          SizedBox(width: context.paddingSmall * 0.5),
          Text(
            type.label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
