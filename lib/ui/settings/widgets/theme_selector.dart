import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/theme_mode_provider.dart';

class ThemeSelector extends ConsumerStatefulWidget {
  const ThemeSelector({super.key});

  @override
  ConsumerState<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends ConsumerState<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final themeModeAsync = ref.watch(themeModeProvider);

    final options = [
      (label: 'Light', icon: LucideIcons.sun, mode: ThemeMode.light),
      (label: 'Dark', icon: LucideIcons.moon, mode: ThemeMode.dark),
      (label: 'System', icon: LucideIcons.monitor, mode: ThemeMode.system),
    ];

    final currentMode = themeModeAsync.value ?? ThemeMode.system;
    final selectedIndex = options.indexWhere((o) => o.mode == currentMode);

    return Row(
      children: options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final isSelected = index == selectedIndex;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < options.length - 1 ? context.paddingSmall : 0,
            ),
            child: InkWell(
              onTap: () => ref
                  .read(themeModeProvider.notifier)
                  .setTheme(option.mode),
              borderRadius: BorderRadius.circular(context.borderRadiusMedium),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: context.paddingSmall,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? colorScheme.primary.withValues(alpha: 0.1)
                      : colorScheme.surface,
                  borderRadius: BorderRadius.circular(context.borderRadiusMedium),
                  border: Border.all(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.outline,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      option.icon,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface.withValues(alpha: 0.6),
                      size: 20,
                    ),
                    SizedBox(height: context.spaceSmall * 0.5),
                    Text(
                      option.label,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.onSurface.withValues(alpha: 0.6),
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
