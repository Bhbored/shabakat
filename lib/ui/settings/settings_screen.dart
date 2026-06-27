import 'package:easy_localization/easy_localization.dart';
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
          'settings.title'.tr(),
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
            SettingsSectionTitle(title: 'settings.appearance'.tr()),
            SizedBox(height: context.spaceSmall),
            Card(
              child: Padding(
                padding: EdgeInsets.all(context.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'settings.theme'.tr(),
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
            SettingsSectionTitle(title: 'settings.company_preferences'.tr()),
            SizedBox(height: context.spaceSmall),
            const CompanyPreferencesSection(),
            SizedBox(height: context.spaceMedium),
            SettingsSectionTitle(title: 'settings.notifications'.tr()),
            SizedBox(height: context.spaceSmall),
            Card(
              child: Column(
                children: [
                  SwitchTile(
                    title: 'settings.payment_reminders'.tr(),
                    subtitle: 'settings.payment_reminders_subtitle'.tr(),
                    icon: LucideIcons.bell,
                    value: true,
                    onChanged: null,
                  ),
                  Divider(height: 1, color: colorScheme.outline),
                  SwitchTile(
                    title: 'settings.new_subscribers'.tr(),
                    subtitle: 'settings.new_subscribers_subtitle'.tr(),
                    icon: LucideIcons.userPlus,
                    value: true,
                    onChanged: null,
                  ),
                  Divider(height: 1, color: colorScheme.outline),
                  SwitchTile(
                    title: 'settings.overdue_alerts'.tr(),
                    subtitle: 'settings.overdue_alerts_subtitle'.tr(),
                    icon: LucideIcons.alertTriangle,
                    value: false,
                    onChanged: null,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.spaceMedium),
            SettingsSectionTitle(title: 'settings.about'.tr()),
            SizedBox(height: context.spaceSmall),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(context.paddingSmall),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          context.borderRadiusMedium,
                        ),
                      ),
                      child: Icon(
                        LucideIcons.info,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                    ),
                    title: Text(
                      'settings.version'.tr(),
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
