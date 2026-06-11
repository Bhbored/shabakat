import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/settings/widgets/company_preferences_section/company_preferences_section.dart';
import 'package:shabakat/ui/settings/widgets/settings_section_title.dart';
import 'package:shabakat/ui/settings/widgets/switch_tile.dart';
import 'package:shabakat/ui/settings/widgets/theme_selector.dart';

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
            const SettingsSectionTitle(title: 'Appearance'),
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
                    const ThemeSelector(),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.spaceMedium),
            const SettingsSectionTitle(title: 'Company Preferences'),
            SizedBox(height: context.spaceSmall),
            const CompanyPreferencesSection(),
            SizedBox(height: context.spaceMedium),
            const SettingsSectionTitle(title: 'Notifications'),
            SizedBox(height: context.spaceSmall),
            Card(
              child: Column(
                children: [
                  const SwitchTile(
                    title: 'Payment Reminders',
                    subtitle: 'Notify when payments are due',
                    icon: LucideIcons.bell,
                    value: true,
                    onChanged: null,
                  ),
                  Divider(height: 1, color: colorScheme.outline),
                  const SwitchTile(
                    title: 'New Subscribers',
                    subtitle: 'Alert when a subscriber joins',
                    icon: LucideIcons.userPlus,
                    value: true,
                    onChanged: null,
                  ),
                  Divider(height: 1, color: colorScheme.outline),
                  const SwitchTile(
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
            const SettingsSectionTitle(title: 'About'),
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
