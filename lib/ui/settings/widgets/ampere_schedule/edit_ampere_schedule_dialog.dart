import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/ampere_schedule/update_ampere_schedule_request.dart';
import 'package:shabakat/data/providers/ampere_schedule/ampere_schedule_provider.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

enum _CustomerTier { base, residential, commercial, industrial }

class EditAmpereScheduleDialog extends ConsumerStatefulWidget {
  final AmpereSchedule schedule;

  const EditAmpereScheduleDialog({super.key, required this.schedule});

  @override
  ConsumerState<EditAmpereScheduleDialog> createState() =>
      _EditAmpereScheduleDialogState();
}

class _EditAmpereScheduleDialogState
    extends ConsumerState<EditAmpereScheduleDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _hoursController;
  late final TextEditingController _priceController;
  _CustomerTier _selectedTier = _CustomerTier.base;
  late double _pricePerAmp;
  late double _residentialPricePerAmp;
  late double _commercialPricePerAmp;
  late double _industrialPricePerAmp;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final schedule = widget.schedule;
    _nameController = TextEditingController(text: schedule.name);
    _hoursController = TextEditingController(
      text: schedule.hoursPerDay.toString(),
    );
    _pricePerAmp = schedule.pricePerAmp;
    _residentialPricePerAmp = schedule.residentialPricePerAmp;
    _commercialPricePerAmp = schedule.commercialPricePerAmp;
    _industrialPricePerAmp = schedule.industrialPricePerAmp;
    _priceController = TextEditingController(text: _pricePerAmp.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _hoursController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  double _valueForTier(_CustomerTier tier) {
    return switch (tier) {
      _CustomerTier.base => _pricePerAmp,
      _CustomerTier.residential => _residentialPricePerAmp,
      _CustomerTier.commercial => _commercialPricePerAmp,
      _CustomerTier.industrial => _industrialPricePerAmp,
    };
  }

  void _updateTierValue(_CustomerTier tier, double value) {
    switch (tier) {
      case _CustomerTier.base:
        _pricePerAmp = value;
      case _CustomerTier.residential:
        _residentialPricePerAmp = value;
      case _CustomerTier.commercial:
        _commercialPricePerAmp = value;
      case _CustomerTier.industrial:
        _industrialPricePerAmp = value;
    }
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
    final parsed = double.tryParse(_priceController.text.trim());
    if (parsed == null) return;
    _updateTierValue(_selectedTier, parsed);
  }

  void _onTierChanged(_CustomerTier? tier) {
    if (tier == null) return;
    _commitCurrentValue();
    setState(() {
      _selectedTier = tier;
      _priceController.text = _valueForTier(tier).toString();
    });
  }

  void _onPriceChanged(String value) {
    final parsed = double.tryParse(value.trim());
    if (parsed == null) return;
    setState(() => _updateTierValue(_selectedTier, parsed));
  }

  String? _validatePrice(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return null;
    final parsed = double.tryParse(text);
    if (parsed == null) {
      return 'settings.ampere_schedule.validation.invalid_number'.tr();
    }
    if (parsed < 0 || parsed > 9999999) {
      return 'settings.ampere_schedule.validation.price_range'.tr();
    }
    return null;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    _commitCurrentValue();

    setState(() => _isLoading = true);

    final request = UpdateAmpereScheduleRequest(
      name: _nameController.text.trim(),
      hoursPerDay: int.parse(_hoursController.text.trim()),
      pricePerAmp: _pricePerAmp,
      residentialPricePerAmp: _residentialPricePerAmp,
      commercialPricePerAmp: _commercialPricePerAmp,
      industrialPricePerAmp: _industrialPricePerAmp,
    );

    try {
      await ref
          .read(ampereScheduleProvider.notifier)
          .updateAmpereSchedule(request, widget.schedule.id);
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'settings.ampere_schedule.updated'.tr(),
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'settings.ampere_schedule.update_failed'.tr();
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppAlertDialog(
      title: Text('settings.ampere_schedule.edit_title'.tr()),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              enabled: !_isLoading,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              maxLength: 200,
              decoration: InputDecoration(
                hintText: 'settings.ampere_schedule.name_hint'.tr(),
              ),
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) {
                  return 'settings.ampere_schedule.validation.required'.tr();
                }
                if (text.length > 200) {
                  return 'settings.ampere_schedule.validation.name_max'.tr();
                }
                return null;
              },
            ),
            SizedBox(height: context.spaceMedium),
            TextFormField(
              controller: _hoursController,
              enabled: !_isLoading,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: 'settings.ampere_schedule.hours_hint'.tr(),
              ),
              validator: (value) {
                final text = value?.trim() ?? '';
                if (text.isEmpty) {
                  return 'settings.ampere_schedule.validation.required'.tr();
                }
                final parsed = int.tryParse(text);
                if (parsed == null) {
                  return 'settings.ampere_schedule.validation.invalid_int'.tr();
                }
                if (parsed < 1 || parsed > 24) {
                  return 'settings.ampere_schedule.validation.hours_range'.tr();
                }
                return null;
              },
            ),
            SizedBox(height: context.spaceMedium),
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
                    onChanged: _isLoading ? null : _onTierChanged,
                  ),
                ),
                SizedBox(width: context.paddingSmall),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _priceController,
                    enabled: !_isLoading,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    decoration: InputDecoration(
                      labelText: 'settings.price'.tr(),
                      hintText: '0',
                    ),
                    onChanged: _onPriceChanged,
                    validator: _validatePrice,
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
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _save,
          child: _isLoading
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('settings.save'.tr()),
        ),
      ],
    );
  }
}
