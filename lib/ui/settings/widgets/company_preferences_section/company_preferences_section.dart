import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';
import 'package:shabakat/domain/mappers/company_preferences/company_preferences_mapper.dart';
import 'package:shabakat/ui/settings/widgets/preference_tile.dart';
import 'package:shabakat/ui/shared/dialogs/preference_edit_dialog.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

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
            label: 'Price per Kilowatt',
            icon: LucideIcons.zap,
            labelOnly: true,
            onTap: () => Navigator.of(context).push(
              openInnerScreen(widget: const PricePerKilowattPreferenceScreen()),
            ),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'Price per Amp',
            icon: LucideIcons.zap,
            labelOnly: true,
            onTap: () => Navigator.of(context).push(
              openInnerScreen(widget: const PricePerAmpPreferenceScreen()),
            ),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'Fixed Charge',
            icon: LucideIcons.receipt,
            labelOnly: true,
            onTap: () => Navigator.of(context).push(
              openInnerScreen(widget: const FixedChargePreferenceScreen()),
            ),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'TVA (%)',
            icon: LucideIcons.percent,
            labelOnly: true,
            onTap: () => Navigator.of(
              context,
            ).push(openInnerScreen(widget: const TvaPreferenceScreen())),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'Language',
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
            label: 'Due Date',
            value: preferencesAsync.when(
              data: (preferences) => _formatDayOfMonth(preferences.dueDate),
              loading: () => null,
              error: (_, _) => null,
            ),
            icon: LucideIcons.calendarClock,
            onTap: () => _openDueDateDialog(context, ref),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'Trigger Date',
            value: preferencesAsync.when(
              data: (preferences) => _formatDayOfMonth(preferences.triggerDate),
              loading: () => null,
              error: (_, _) => null,
            ),
            icon: LucideIcons.calendar,
            onTap: () => _openTriggerDateDialog(context, ref),
          ),
          _divider(context, colorScheme),
          PreferenceTile(
            label: 'Trigger Message',
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
      'en' => 'English',
      'ar' => 'Arabic',
      _ => language,
    };
  }

  String _formatDayOfMonth(int day) {
    final suffix = switch (day % 10) {
      1 when day != 11 => 'st',
      2 when day != 12 => 'nd',
      3 when day != 13 => 'rd',
      _ => 'th',
    };
    return '$day$suffix of month';
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

    showPreferenceEditDialog(
      context: context,
      title: 'Due Date',
      initialValue: current.dueDate.toString(),
      hintText: '1-31',
      description: 'Day of the month when invoices are due.',
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.trim().isEmpty) return 'Required';
        final day = int.tryParse(value.trim());
        if (day == null) return 'Enter a valid number';
        if (day < 1 || day > 31) return 'Must be between 1 and 31';

        return null;
      },
      onSave: (value) async {
        final parsed = int.parse(value.trim());
        final latest = ref.read(companyProvider).asData?.value ?? current;
        final updated = latest.copyWith(dueDate: parsed);
        await ref
            .read(companyProvider.notifier)
            .upsertPreferences(updated.toUpdateRequest());
      },
    );
  }

  void _openTriggerDateDialog(BuildContext context, WidgetRef ref) {
    final current = ref.read(companyProvider).asData?.value;
    if (current == null) return;

    showPreferenceEditDialog(
      context: context,
      title: 'Trigger Date',
      initialValue: current.triggerDate.toString(),
      hintText: '1-31',
      description:
          'Day of the month when invoice reminders are sent to customers.',
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.trim().isEmpty) return 'Required';
        final day = int.tryParse(value.trim());
        if (day == null) return 'Enter a valid number';
        if (day < 1 || day > 31) return 'Must be between 1 and 31';

        return null;
      },
      onSave: (value) async {
        final parsed = int.parse(value.trim());
        final latest = ref.read(companyProvider).asData?.value ?? current;
        final updated = latest.copyWith(triggerDate: parsed);
        await ref
            .read(companyProvider.notifier)
            .upsertPreferences(updated.toUpdateRequest());
      },
    );
  }
}
