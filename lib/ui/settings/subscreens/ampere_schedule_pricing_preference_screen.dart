import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/ampere_schedule/ampere_schedule_provider.dart';
import 'package:shabakat/data/providers/company/company_provider.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/domain/entities/settings/company_preferences.dart';
import 'package:shabakat/domain/mappers/company_preferences/company_preferences_mapper.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/add_ampere_schedule_dialog.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/ampere_schedule_card.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/ampere_schedule_empty_view.dart';
import 'package:shabakat/ui/settings/widgets/switch_tile/switch_tile.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/ampere_schedule_skeleton.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class AmpereSchedulePricingPreferenceScreen extends ConsumerStatefulWidget {
  const AmpereSchedulePricingPreferenceScreen({super.key});

  @override
  ConsumerState<AmpereSchedulePricingPreferenceScreen> createState() =>
      _AmpereSchedulePricingPreferenceScreenState();
}

class _AmpereSchedulePricingPreferenceScreenState
    extends ConsumerState<AmpereSchedulePricingPreferenceScreen> {
  bool? _draft;
  bool? _original;
  bool _initialized = false;

  void _initialize(CompanyPreferences preferences) {
    if (_initialized) return;
    _initialized = true;
    _draft = preferences.ampereSchedulePricingEnabled;
    _original = preferences.ampereSchedulePricingEnabled;
  }

  void _onToggled(bool value) {
    setState(() => _draft = value);
  }

  Future<void> _save(CompanyPreferences current, bool draft) async {
    final updated = current.copyWith(ampereSchedulePricingEnabled: draft);

    try {
      await ref
          .read(companyProvider.notifier)
          .upsertPreferences(updated.toUpdateRequest());
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'settings.preference_saved'.tr(),
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
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

  @override
  Widget build(BuildContext context) {
    final schedulesAsync = ref.watch(ampereScheduleProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('settings.ampere_schedule.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showAppDialog<void>(
              context: context,
              builder: (_) => const AddAmpereScheduleDialog(),
            ),
          ),
        ],
      ),
      body: schedulesAsync.when(
        skipLoadingOnRefresh: true,
        loading: () => const AmpereScheduleSkeleton(),
        error: (error, _) => DynamicError(
          text: error is ApiException
              ? error.userMessage
              : 'settings.ampere_schedule.load_failed'.tr(),
          onTryAgain: () => ref.read(ampereScheduleProvider.notifier).refresh(),
        ),
        data: (schedules) => schedules.isEmpty
            ? const AmpereScheduleEmptyView()
            : _buildEnabled(context, schedules),
      ),
    );
  }

  Widget _buildEnabled(BuildContext context, List<AmpereSchedule> schedules) {
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

    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async => ref.invalidate(ampereScheduleProvider),
            child: ListView(
              padding: EdgeInsets.all(context.paddingMedium),
              children: [
                if (showFieldLoading)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(context.paddingLarge),
                      child: CircularProgressIndicator(
                        color: colorScheme.primary,
                      ),
                    ),
                  )
                else ...[
                  SwitchTile(
                    title: 'settings.ampere_schedule.pricing_title'.tr(),
                    subtitle: 'settings.ampere_schedule.pricing_subtitle'.tr(),
                    icon: LucideIcons.gauge,
                    value: draft ?? false,
                    onChanged: isSaving ? null : _onToggled,
                  ),
                  SizedBox(height: context.spaceSmall),
                  Text(
                    textAlign: TextAlign.center,
                    'settings.ampere_schedule.pricing_description'.tr(),
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
                SizedBox(height: context.spaceMedium),
                for (final schedule in schedules) ...[
                  AmpereScheduleCard(schedule: schedule),
                  SizedBox(height: context.spaceSmall),
                ],
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.paddingMedium,
            context.paddingSmall,
            context.paddingMedium,
            context.paddingMedium,
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isSaving
                  ? null
                  : hasChanges && !showFieldLoading && current != null
                  ? () => _save(current, draft)
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
    );
  }
}
