import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/company/update_preferences_request.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';
import 'package:shabakat/ui/settings/widgets/preference_tile.dart';
import 'package:shabakat/ui/shared/dialogs/preference_edit_dialog.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import 'subcreens/language_preference_screen.dart';

class CompanyPreferencesSection extends ConsumerWidget {
  const CompanyPreferencesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferencesAsync = ref.watch(companyProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return preferencesAsync.when(
      loading: () => Card(
        child: SizedBox(
          height: 280,
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (err, stack) {
        final message = err is ApiException
            ? err.userMessage
            : 'Error loading preferences: $err';
        return Card(
          child: Padding(
            padding: EdgeInsets.all(context.paddingMedium),
            child: Text(message, textAlign: TextAlign.center),
          ),
        );
      },
      data: (preferences) => Card(
        child: Column(
          children: [
            PreferenceTile(
              label: 'Price per Kilowatt',
              value: _formatPrice(preferences.pricePerKilowat),
              icon: LucideIcons.zap,
              onTap: () => _editPrice(
                context,
                ref,
                preferences,
                title: 'Price per Kilowatt',
                update: (value) => preferences.copyWith(pricePerKilowat: value),
                initial: preferences.pricePerKilowat.toString(),
              ),
            ),
            _divider(context, colorScheme),
            PreferenceTile(
              label: 'Price per Amp',
              value: _formatPrice(preferences.pricePerAmp),
              icon: LucideIcons.zap,
              onTap: () => _editPrice(
                context,
                ref,
                preferences,
                title: 'Price per Amp',
                update: (value) => preferences.copyWith(pricePerAmp: value),
                initial: preferences.pricePerAmp.toString(),
              ),
            ),
            _divider(context, colorScheme),
            PreferenceTile(
              label: 'Fixed Charge',
              value: _formatPrice(preferences.fixedCharge),
              icon: LucideIcons.receipt,
              onTap: () => _editPrice(
                context,
                ref,
                preferences,
                title: 'Fixed Charge',
                update: (value) => preferences.copyWith(fixedCharge: value),
                initial: preferences.fixedCharge.toString(),
              ),
            ),
            _divider(context, colorScheme),
            PreferenceTile(
              label: 'TVA (%)',
              value: _formatPercent(preferences.tva),
              icon: LucideIcons.percent,
              onTap: () => _editPercentage(
                context,
                ref,
                preferences,
                title: 'TVA (%)',
                update: (value) => preferences.copyWith(tva: value),
                initial: preferences.tva.toString(),
              ),
            ),
            _divider(context, colorScheme),
            PreferenceTile(
              label: 'Language',
              value: _formatLanguage(preferences.language),
              icon: LucideIcons.globe,
              onTap: () => _openLanguageScreen(context, preferences),
            ),
            _divider(context, colorScheme),
            PreferenceTile(
              label: 'Trigger Date',
              value: _formatTriggerDate(preferences.triggerDate),
              icon: LucideIcons.calendar,
              onTap: () => _editTriggerDate(context, ref, preferences),
            ),
            _divider(context, colorScheme),
            PreferenceTile(
              label: 'Trigger Message',
              value: preferences.triggerMessage,
              icon: LucideIcons.messageSquare,
              onTap: () => _editTriggerMessage(context, ref, preferences),
            ),
          ],
        ),
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

  String _formatPrice(double value) => '\$${value.toStringAsFixed(2)}';

  String _formatPercent(double value) => '${value.toStringAsFixed(0)}%';

  String _formatLanguage(String language) {
    return switch (language.toLowerCase()) {
      'en' => 'English',
      'ar' => 'Arabic',
      _ => language,
    };
  }

  String _formatTriggerDate(int day) {
    final suffix = switch (day % 10) {
      1 when day != 11 => 'st',
      2 when day != 12 => 'nd',
      3 when day != 13 => 'rd',
      _ => 'th',
    };
    return '$day$suffix of month';
  }

  UpdatePreferencesRequest _toRequest(CompanyPreferences preferences) {
    return UpdatePreferencesRequest(
      pricePerKilowat: preferences.pricePerKilowat,
      pricePerAmp: preferences.pricePerAmp,
      fixedCharge: preferences.fixedCharge,
      tva: preferences.tva,
      language: preferences.language,
      triggerDate: preferences.triggerDate,
      triggerMessage: preferences.triggerMessage,
    );
  }

  Future<void> _upsert(
    WidgetRef ref,
    CompanyPreferences preferences,
  ) async {
    await ref
        .read(companyProvider.notifier)
        .upsertPreferences(_toRequest(preferences));
  }

  Future<void> _editPrice(
    BuildContext context,
    WidgetRef ref,
    CompanyPreferences preferences, {
    required String title,
    required CompanyPreferences Function(double value) update,
    required String initial,
  }) {
    return showPreferenceEditDialog(
      context: context,
      title: title,
      initialValue: initial,
      hintText: '0.00',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        if (value == null || value.trim().isEmpty) return 'Required';
        final n = double.tryParse(value.trim());
        if (n == null) return 'Invalid number';
        if (n < 0) return 'Must be 0 or greater';
        return null;
      },
      onSave: (value) async {
        final parsed = double.parse(value.trim());
        await _upsert(ref, update(parsed));
      },
    );
  }

  Future<void> _editPercentage(
    BuildContext context,
    WidgetRef ref,
    CompanyPreferences preferences, {
    required String title,
    required CompanyPreferences Function(double value) update,
    required String initial,
  }) {
    return showPreferenceEditDialog(
      context: context,
      title: title,
      initialValue: initial,
      hintText: '0-100',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) {
        if (value == null || value.trim().isEmpty) return 'Required';
        final n = double.tryParse(value.trim());
        if (n == null) return 'Invalid number';
        if (n < 0 || n > 100) return 'Must be between 0 and 100';
        return null;
      },
      onSave: (value) async {
        final parsed = double.parse(value.trim());
        await _upsert(ref, update(parsed));
      },
    );
  }

  void _openLanguageScreen(BuildContext context, CompanyPreferences preferences) {
    Navigator.of(context).push(
      openInnerScreen(
        widget: LanguagePreferenceScreen(preferences: preferences),
      ),
    );
  }

  Future<void> _editTriggerDate(
    BuildContext context,
    WidgetRef ref,
    CompanyPreferences preferences,
  ) {
    return showPreferenceEditDialog(
      context: context,
      title: 'Trigger Date',
      initialValue: preferences.triggerDate.toString(),
      hintText: '1-30',
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.trim().isEmpty) return 'Required';
        final n = int.tryParse(value.trim());
        if (n == null) return 'Invalid day';
        if (n < 1 || n > 30) return 'Must be between 1 and 30';
        return null;
      },
      onSave: (value) async {
        final parsed = int.parse(value.trim());
        await _upsert(ref, preferences.copyWith(triggerDate: parsed));
      },
    );
  }

  Future<void> _editTriggerMessage(
    BuildContext context,
    WidgetRef ref,
    CompanyPreferences preferences,
  ) {
    return showPreferenceEditDialog(
      context: context,
      title: 'Trigger Message',
      initialValue: preferences.triggerMessage,
      hintText: 'Enter trigger message',
      maxLines: 250,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value == null || value.trim().isEmpty) return null;
        final lineCount = '\n'.allMatches(value).length + 1;
        if (lineCount > 250) return 'Must not exceed 250 lines';
        return null;
      },
      onSave: (value) async {
        final message = value.trim().isEmpty ? null : value.trim();
        await _upsert(ref, preferences.copyWith(triggerMessage: message));
      },
    );
  }
}
