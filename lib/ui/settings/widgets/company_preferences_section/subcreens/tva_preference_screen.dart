import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';
import 'package:shabakat/domain/mappers/company_preferences/company_preferences_mapper.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

enum _CustomerTier { base, residential, commercial, industrial }

class TvaPreferenceScreen extends ConsumerStatefulWidget {
  const TvaPreferenceScreen({super.key});

  @override
  ConsumerState<TvaPreferenceScreen> createState() =>
      _TvaPreferenceScreenState();
}

class _TvaPreferenceScreenState extends ConsumerState<TvaPreferenceScreen> {
  final _priceController = TextEditingController();

  _CustomerTier _selectedTier = _CustomerTier.base;
  CompanyPreferences? _draft;
  CompanyPreferences? _original;
  bool _initialized = false;

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void _initialize(CompanyPreferences preferences) {
    if (_initialized) return;
    _initialized = true;
    _draft = preferences;
    _original = preferences;
    _priceController.text = _valueForTier(
      preferences,
      _selectedTier,
    ).toString();
  }

  double _valueForTier(CompanyPreferences preferences, _CustomerTier tier) {
    return switch (tier) {
      _CustomerTier.base => preferences.tva,
      _CustomerTier.residential => preferences.residentialTVA,
      _CustomerTier.commercial => preferences.commercialTVA,
      _CustomerTier.industrial => preferences.industrialTVA,
    };
  }

  CompanyPreferences _updateTierValue(
    CompanyPreferences preferences,
    _CustomerTier tier,
    double value,
  ) {
    return switch (tier) {
      _CustomerTier.base => preferences.copyWith(tva: value),
      _CustomerTier.residential => preferences.copyWith(residentialTVA: value),
      _CustomerTier.commercial => preferences.copyWith(commercialTVA: value),
      _CustomerTier.industrial => preferences.copyWith(industrialTVA: value),
    };
  }

  String _tierLabel(_CustomerTier tier) {
    return switch (tier) {
      _CustomerTier.base => 'settings.tier.base'.tr(),
      _CustomerTier.residential => 'settings.tier.residential'.tr(),
      _CustomerTier.commercial => 'settings.tier.commercial'.tr(),
      _CustomerTier.industrial => 'settings.tier.industrial'.tr(),
    };
  }

  String _tierDescription(_CustomerTier tier) {
    return switch (tier) {
      _CustomerTier.base => 'settings.tier.base_description'.tr(),
      _CustomerTier.residential => 'settings.tier.residential_description'.tr(),
      _CustomerTier.commercial => 'settings.tier.commercial_description'.tr(),
      _CustomerTier.industrial => 'settings.tier.industrial_description'.tr(),
    };
  }

  void _commitCurrentValue() {
    final draft = _draft;
    if (draft == null) return;
    final parsed = double.tryParse(_priceController.text.trim());
    if (parsed == null) return;
    _draft = _updateTierValue(draft, _selectedTier, parsed);
  }

  void _onTierChanged(_CustomerTier? tier) {
    if (tier == null) return;
    _commitCurrentValue();
    setState(() {
      _selectedTier = tier;
      if (_draft != null) {
        _priceController.text = _valueForTier(_draft!, tier).toString();
      }
    });
  }

  void _onPriceChanged(String value) {
    final draft = _draft;
    if (draft == null) return;
    final parsed = double.tryParse(value.trim());
    if (parsed == null) return;
    setState(() {
      _draft = _updateTierValue(draft, _selectedTier, parsed);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final preferencesAsync = ref.watch(companyProvider);
    final current = preferencesAsync.value;
    final showFieldLoading =
        preferencesAsync.isLoading && !preferencesAsync.hasValue;
    final isSaving = preferencesAsync.isLoading && preferencesAsync.hasValue;

    if (current != null) _initialize(current);

    final draft = _draft;
    final hasChanges = draft != null && _original != null && draft != _original;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('settings.preferences.tva'.tr()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(context.paddingMedium),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<_CustomerTier>(
                        isExpanded: true,
                        initialValue: _selectedTier,
                        borderRadius: BorderRadius.circular(
                          context.borderRadiusMedium,
                        ),
                        dropdownColor: colorScheme.surface,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                        style: theme.textTheme.bodyLarge,
                        decoration: InputDecoration(
                          labelText: 'settings.customer_type'.tr(),
                        ).applyDefaults(theme.inputDecorationTheme),
                        items: _CustomerTier.values
                            .map(
                              (tier) => DropdownMenuItem(
                                value: tier,
                                child: Text(
                                  _tierLabel(tier),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: isSaving ? null : _onTierChanged,
                      ),
                    ),
                    SizedBox(width: context.paddingSmall),
                    Expanded(
                      flex: 3,
                      child: showFieldLoading
                          ? InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'settings.price'.tr(),
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            )
                          : TextField(
                              controller: _priceController,
                              enabled: !isSaving,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              decoration: InputDecoration(
                                labelText: 'settings.price'.tr(),
                                hintText: '0',
                              ),
                              onChanged: _onPriceChanged,
                            ),
                    ),
                  ],
                ),
                SizedBox(height: context.spaceSmall),
                Text(
                  textAlign: TextAlign.center,
                  _tierDescription(_selectedTier),
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (preferencesAsync.hasError && current == null) ...[
                  SizedBox(height: context.spaceSmall),
                  Text(
                    preferencesAsync.error is ApiException
                        ? (preferencesAsync.error! as ApiException).userMessage
                        : 'settings.load_preferences_failed'.tr(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.paddingMedium,
              context.paddingSmall,
              context.paddingMedium,
              context.viewInsets.bottom + context.paddingLarge,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isSaving
                    ? null
                    : hasChanges && !showFieldLoading && current != null
                    ? () async {
                        _commitCurrentValue();
                        final tvaDraft = _draft!;
                        if (tvaDraft == _original) return;

                        final updated = current.copyWith(
                          tva: tvaDraft.tva,
                          residentialTVA: tvaDraft.residentialTVA,
                          commercialTVA: tvaDraft.commercialTVA,
                          industrialTVA: tvaDraft.industrialTVA,
                        );

                        try {
                          await ref
                              .read(companyProvider.notifier)
                              .upsertPreferences(updated.toUpdateRequest());
                          if (!context.mounted) return;
                          AppSnackBar.show(
                            context,
                            message: 'settings.preference_saved'.tr(),
                            variant: AppSnackBarVariant.success,
                          );
                          Navigator.of(context).pop();
                        } catch (e) {
                          if (!context.mounted) return;
                          final message = e is ApiException
                              ? e.userMessage
                              : 'settings.preference_save_failed'.tr();
                          AppSnackBar.show(
                            context,
                            message: message,
                            variant: AppSnackBarVariant.error,
                          );
                        }
                      }
                    : null,
                child: isSaving
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onPrimary,
                        ),
                      )
                    : Text(
                        'settings.save'.tr(),
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
