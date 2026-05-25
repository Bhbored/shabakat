import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSecondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(title: 'Appearance'),
            SizedBox(height: context.spaceSmall),
            Card(
              child: Padding(
                padding: EdgeInsets.all(context.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.spaceSmall),
                    _ThemeSelector(),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.spaceMedium),
            _SectionTitle(title: 'Company Preferences'),
            SizedBox(height: context.spaceSmall),
            Card(
              child: Column(
                children: [
                  _PreferenceTile(
                    label: 'Price per Kilowatt',
                    value: '\$0.15',
                    icon: LucideIcons.zap,
                  ),
                  Divider(
                    height: 1,
                    indent: context.paddingMedium + 40,
                    color: colorScheme.outline,
                  ),
                  _PreferenceTile(
                    label: 'Price per Amp',
                    value: '\$17.00',
                    icon: LucideIcons.zap,
                  ),
                  Divider(
                    height: 1,
                    indent: context.paddingMedium + 40,
                    color: colorScheme.outline,
                  ),
                  _PreferenceTile(
                    label: 'Fixed Charge',
                    value: '\$10.00',
                    icon: LucideIcons.receipt,
                  ),
                  Divider(
                    height: 1,
                    indent: context.paddingMedium + 40,
                    color: colorScheme.outline,
                  ),
                  _PreferenceTile(
                    label: 'TVA (%)',
                    value: '11%',
                    icon: LucideIcons.percent,
                  ),
                  Divider(
                    height: 1,
                    indent: context.paddingMedium + 40,
                    color: colorScheme.outline,
                  ),
                  _PreferenceTile(
                    label: 'Language',
                    value: 'English',
                    icon: LucideIcons.globe,
                  ),
                  Divider(
                    height: 1,
                    indent: context.paddingMedium + 40,
                    color: colorScheme.outline,
                  ),
                  _PreferenceTile(
                    label: 'Trigger Date',
                    value: '1st of month',
                    icon: LucideIcons.calendar,
                  ),
                  Divider(
                    height: 1,
                    indent: context.paddingMedium + 40,
                    color: colorScheme.outline,
                  ),
                  _PreferenceTile(
                    label: 'Trigger Message',
                    value: 'Your invoice is due',
                    icon: LucideIcons.messageSquare,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.spaceMedium),
            _SectionTitle(title: 'Notifications'),
            SizedBox(height: context.spaceSmall),
            Card(
              child: Column(
                children: [
                  _SwitchTile(
                    title: 'Payment Reminders',
                    subtitle: 'Notify when payments are due',
                    icon: LucideIcons.bell,
                    value: true,
                    onChanged: null,
                  ),
                  Divider(height: 1, color: colorScheme.outline),
                  _SwitchTile(
                    title: 'New Subscribers',
                    subtitle: 'Alert when a subscriber joins',
                    icon: LucideIcons.userPlus,
                    value: true,
                    onChanged: null,
                  ),
                  Divider(height: 1, color: colorScheme.outline),
                  _SwitchTile(
                    title: 'Overdue Alerts',
                    subtitle: 'Warn about overdue invoices',
                    icon: LucideIcons.alertTriangle,
                    value: false,
                    onChanged: null,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.spaceMedium),
            _SectionTitle(title: 'About'),
            SizedBox(height: context.spaceSmall),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(context.paddingSmall),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
                      ),
                      child: Icon(
                        LucideIcons.info,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                    ),
                    title: Text(
                      'Version',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      '1.0.0',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.scrollPaddingAboveMainNav),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title.toUpperCase(),
      style: theme.textTheme.labelSmall?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
      ),
    );
  }
}

class _ThemeSelector extends StatefulWidget {
  @override
  State<_ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<_ThemeSelector> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final options = [
      (label: 'Light', icon: LucideIcons.sun),
      (label: 'Dark', icon: LucideIcons.moon),
      (label: 'System', icon: LucideIcons.monitor),
    ];

    return Row(
      children: options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final isSelected = index == _selected;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < options.length - 1 ? context.paddingSmall : 0,
            ),
            child: InkWell(
              onTap: () => setState(() => _selected = index),
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

class _PreferenceTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _PreferenceTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(context.paddingSmall),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        ),
        child: Icon(
          icon,
          size: 16,
          color: colorScheme.primary,
        ),
      ),
      title: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        value,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      trailing: Icon(
        LucideIcons.chevronRight,
        size: 16,
        color: colorScheme.onSurface.withValues(alpha: 0.4),
      ),
      onTap: () {},
    );
  }
}

class _SwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(context.paddingSmall),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        ),
        child: Icon(
          icon,
          size: 16,
          color: colorScheme.primary,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
