import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/utilities/day_of_month_formatter.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';
import 'package:shabakat/domain/mappers/company_preferences/company_preferences_mapper.dart';
import 'package:shabakat/ui/settings/widgets/preference_tile.dart';
import 'package:shabakat/ui/shared/dialogs/preference_day_picker_dialog.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import 'subcreens/ampere_schedule_pricing_preference_screen.dart';
import 'subcreens/trigger_message_preference_screen.dart';
import 'subcreens/fixed_charge_preference_screen.dart';
import 'subcreens/tva_preference_screen.dart';
import 'subcreens/price_per_amp_preference_screen.dart';
import 'subcreens/price_per_kilowatt_preference_screen.dart';
import '../../subcreens/language_preference_screen.dart';

class CompanyPreferencesSection extends ConsumerWidget {
  const CompanyPreferencesSection({super.key});

  static const _defaultPreferences = CompanyPreferences();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final preferencesAsync = ref.watch(companyProvider);

    return Card(
      child: Column(
        children: [
          PreferenceTile(
            label: 'settings.preferences.price_per_kilowatt'.tr(),
            icon: LucideIcons.zap,
            labelOnly: true,
            onTap: () => Navigator.of(context).push(
              openInnerScreen(widget: const PricePerKilowattPreferenceScreen()),
            ),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'settings.preferences.price_per_amp'.tr(),
            icon: LucideIcons.zap,
            labelOnly: true,
            onTap: () => Navigator.of(context).push(
              openInnerScreen(widget: const PricePerAmpPreferenceScreen()),
            ),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'settings.preferences.fixed_charge'.tr(),
            icon: LucideIcons.receipt,
            labelOnly: true,
            onTap: () => Navigator.of(context).push(
              openInnerScreen(widget: const FixedChargePreferenceScreen()),
            ),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'settings.preferences.tva'.tr(),
            icon: LucideIcons.percent,
            labelOnly: true,
            onTap: () => Navigator.of(
              context,
            ).push(openInnerScreen(widget: const TvaPreferenceScreen())),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'settings.preferences.language'.tr(),
            value: preferencesAsync.when(
              data: (preferences) => _formatLanguage(preferences.language),
              loading: () => _formatLanguage(_defaultPreferences.language),
              error: (_, _) => _formatLanguage(_defaultPreferences.language),
            ),
            icon: LucideIcons.globe,
            onTap: () => _openLanguageScreen(context, ref),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'settings.preferences.due_date'.tr(),
            value: preferencesAsync.when(
              data: (preferences) =>
                  _formatDayOfMonth(context, preferences.dueDate),
              loading: () => null,
              error: (_, _) => null,
            ),
            icon: LucideIcons.calendarClock,
            onTap: () => _openDueDateDialog(context, ref),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'settings.preferences.trigger_date'.tr(),
            value: preferencesAsync.when(
              data: (preferences) =>
                  _formatDayOfMonth(context, preferences.triggerDate),
              loading: () => null,
              error: (_, _) => null,
            ),
            icon: LucideIcons.calendar,
            onTap: () => _openTriggerDateDialog(context, ref),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'settings.preferences.trigger_message'.tr(),
            value: preferencesAsync.when(
              data: (preferences) => preferences.triggerMessage,
              loading: () => null,
              error: (_, _) => null,
            ),
            icon: LucideIcons.messageSquare,
            onTap: () => Navigator.of(context).push(
              openInnerScreen(widget: const TriggerMessagePreferenceScreen()),
            ),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'Ampere Schedule',
            value: preferencesAsync.when(
              data: (preferences) => preferences.ampereSchedulePricingEnabled
                  ? 'Enabled'
                  : 'Disabled',
              loading: () => null,
              error: (_, _) => null,
            ),
            icon: LucideIcons.gauge,
            onTap: () => Navigator.of(context).push(
              openInnerScreen(
                widget: const AmpereSchedulePricingPreferenceScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context, ColorScheme colorScheme) {
    return Divider(
      height: 1,
      indent: context.paddingMedium + 40,
      color: colorScheme.outline,
    );
  }

  String _formatLanguage(String language) {
    return switch (language.toLowerCase()) {
      'en' => 'settings.language_english'.tr(),
      'ar' => 'settings.language_arabic'.tr(),
      _ => language,
    };
  }

  String _formatDayOfMonth(BuildContext context, int day) {
    return DayOfMonthFormatter.format(context, day);
  }

  void _openLanguageScreen(BuildContext context, WidgetRef ref) {
    final preferences = ref.read(companyProvider).asData?.value;
    Navigator.of(context).push(
      openInnerScreen(
        widget: LanguagePreferenceScreen(
          preferences: preferences ?? _defaultPreferences,
        ),
      ),
    );
  }

  void _openDueDateDialog(BuildContext context, WidgetRef ref) {
    final current = ref.read(companyProvider).asData?.value;
    if (current == null) return;

    showPreferenceDayPickerDialog(
      context: context,
      title: 'settings.preferences.due_date'.tr(),
      initialDay: current.dueDate,
      description: 'settings.due_date_description'.tr(),
      onSave: (day) async {
        final latest = ref.read(companyProvider).asData?.value ?? current;
        final updated = latest.copyWith(dueDate: day);
        await ref
            .read(companyProvider.notifier)
            .upsertPreferences(updated.toUpdateRequest());
      },
    );
  }

  void _openTriggerDateDialog(BuildContext context, WidgetRef ref) {
    final current = ref.read(companyProvider).asData?.value;
    if (current == null) return;

    showPreferenceDayPickerDialog(
      context: context,
      title: 'settings.preferences.trigger_date'.tr(),
      initialDay: current.triggerDate,
      description: 'settings.trigger_date_description'.tr(),
      onSave: (day) async {
        final latest = ref.read(companyProvider).asData?.value ?? current;
        final updated = latest.copyWith(triggerDate: day);
        await ref
            .read(companyProvider.notifier)
            .upsertPreferences(updated.toUpdateRequest());
      },
    );
  }
}
