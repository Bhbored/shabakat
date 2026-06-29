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

class TriggerMessagePreferenceScreen extends ConsumerStatefulWidget {
  const TriggerMessagePreferenceScreen({super.key});

  static const maxLength = 1000;

  @override
  ConsumerState<TriggerMessagePreferenceScreen> createState() =>
      _TriggerMessagePreferenceScreenState();
}

class _TriggerMessagePreferenceScreenState
    extends ConsumerState<TriggerMessagePreferenceScreen> {
  final _messageController = TextEditingController();

  CompanyPreferences? _draft;
  CompanyPreferences? _original;
  bool _initialized = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _initialize(CompanyPreferences preferences) {
    if (_initialized) return;
    _initialized = true;
    _draft = preferences;
    _original = preferences;
    _messageController.text = preferences.triggerMessage ?? '';
  }

  String? _normalizedMessage(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  bool get _hasChanges {
    if (_draft == null || _original == null) return false;
    return _normalizedMessage(_messageController.text) !=
        _original!.triggerMessage;
  }

  void _onMessageChanged(String value) {
    final draft = _draft;
    if (draft == null) return;
    setState(() {
      _draft = draft.copyWith(triggerMessage: _normalizedMessage(value));
    });
  }

  void _clearAll() {
    final draft = _draft;
    if (draft == null) return;
    setState(() {
      _messageController.clear();
      _draft = draft.copyWith(triggerMessage: null);
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

    final charCount = _messageController.text.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('settings.preferences.trigger_message'.tr()),
        actions: [
          TextButton(
            onPressed: showFieldLoading || isSaving || _draft == null
                ? null
                : _clearAll,
            child: Text('settings.clear_all'.tr()),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.paddingMedium,
              context.paddingMedium,
              context.paddingMedium,
              context.paddingSmall,
            ),
            child: Text(
              textAlign: TextAlign.center,
              'settings.trigger_message.description'.tr(),
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
              child: showFieldLoading
                  ? InputDecorator(
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'settings.trigger_message.label'.tr(),
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
                      controller: _messageController,
                      enabled: !isSaving,
                      maxLength: TriggerMessagePreferenceScreen.maxLength,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'settings.trigger_message.label'.tr(),
                        hintText: 'settings.trigger_message.hint'.tr(),
                        counterText: '',
                      ),
                      onChanged: _onMessageChanged,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.paddingMedium,
              context.paddingSmall,
              context.paddingMedium,
              0,
            ),
            child: Text(
              '$charCount / ${TriggerMessagePreferenceScreen.maxLength}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: charCount > TriggerMessagePreferenceScreen.maxLength
                    ? colorScheme.error
                    : colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          if (preferencesAsync.hasError && current == null) ...[
            Padding(
              padding: EdgeInsets.all(context.paddingMedium),
              child: Text(
                preferencesAsync.error is ApiException
                    ? (preferencesAsync.error! as ApiException).userMessage
                    : 'settings.load_preferences_failed'.tr(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.error,
                ),
              ),
            ),
          ],
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
                    : _hasChanges && !showFieldLoading && current != null
                    ? () async {
                        final message = _normalizedMessage(
                          _messageController.text,
                        );
                        if (message == _original?.triggerMessage) return;

                        final updated = current.copyWith(
                          triggerMessage: message,
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
                          final errorMessage = e is ApiException
                              ? e.userMessage
                              : 'settings.preference_save_failed'.tr();
                          AppSnackBar.show(
                            context,
                            message: errorMessage,
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
                    : Text('settings.save'.tr()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
