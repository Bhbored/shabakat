import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/storage/shared_preferences/shared_preferences.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';
import 'package:shabakat/domain/mappers/company_preferences/company_preferences_mapper.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class LanguagePreferenceScreen extends ConsumerStatefulWidget {
  final CompanyPreferences preferences;

  const LanguagePreferenceScreen({super.key, required this.preferences});

  @override
  ConsumerState<LanguagePreferenceScreen> createState() =>
      _LanguagePreferenceScreenState();
}

class _LanguagePreferenceScreenState
    extends ConsumerState<LanguagePreferenceScreen> {
  bool _isLoading = false;

  Future<void> _selectLanguage(String languageCode) async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    final updatedPreferences = widget.preferences.copyWith(
      language: languageCode,
    );

    final request = updatedPreferences.toUpdateRequest();

    try {
      await ref.read(companyProvider.notifier).upsertPreferences(request);
      await ref
          .read(sharedPreferencesHandlerProvider)
          .setString('language', languageCode);
      if (!mounted) return;
      await context.setLocale(Locale(languageCode));
      if (!mounted) return;
      AppSnackBar.show(
          context,
          message: 'settings.preference_saved'.tr(),
          variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        final message = e is ApiException
            ? e.userMessage
            : 'settings.preference_save_failed'.tr();
        AppSnackBar.show(
          context,
          message: message,
          variant: AppSnackBarVariant.error,
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentLanguage = widget.preferences.language.toLowerCase();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('settings.preferences.language'.tr()),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(context.paddingMedium),
            children: [
              _LanguageOptionTile(
                label: 'settings.language_english'.tr(),
                isSelected: currentLanguage == 'en',
                onTap: () => _selectLanguage('en'),
              ),
              SizedBox(height: context.spaceSmall),
              _LanguageOptionTile(
                label: 'settings.language_arabic'.tr(),
                isSelected: currentLanguage == 'ar',
                onTap: () => _selectLanguage('ar'),
              ),
            ],
          ),
          if (_isLoading)
            Container(
              color: colorScheme.surface.withValues(alpha: 0.5),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

class _LanguageOptionTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOptionTile({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      ),
      tileColor: isSelected
          ? colorScheme.primaryContainer
          : colorScheme.surfaceContainerHighest,
      title: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          color: isSelected
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSurface,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: colorScheme.primary)
          : Icon(
              Icons.circle_outlined,
              color: colorScheme.onSurface.withValues(alpha: 0.3),
            ),
      onTap: onTap,
    );
  }
}
