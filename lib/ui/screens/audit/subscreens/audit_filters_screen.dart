import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/data/providers/audit/audit_log_filter_provider.dart';
import 'package:shabakat/data/providers/audit/audit_log_provider.dart';
import 'package:shabakat/ui/screens/audit/widgets/audit_log_card/audit_log_labels.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/filter_section/filter_section.dart';

class AuditFiltersScreen extends ConsumerStatefulWidget {
  const AuditFiltersScreen({super.key});

  @override
  ConsumerState<AuditFiltersScreen> createState() => _AuditFiltersScreenState();
}

class _AuditFiltersScreenState extends ConsumerState<AuditFiltersScreen> {
  AuditAction? _action;
  AuditLogStatus? _status;
  DateTime? _createdFrom;
  DateTime? _createdTo;
  String? _createdFromError;
  String? _createdToError;
  bool _initialized = false;

  DateTime get _today => _toDateOnly(DateTime.now());

  DateTime _toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  String _formatDate(DateTime? date) {
    if (date == null) return 'common.all'.tr();
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final filter = ref.read(auditLogFilterProvider);
    _action = filter.action;
    _status = filter.status;
    _createdFrom = filter.createdFrom != null
        ? _toDateOnly(filter.createdFrom!)
        : null;
    _createdTo = filter.createdTo != null
        ? _toDateOnly(filter.createdTo!)
        : null;
    _initialized = true;
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final initial = isFrom
        ? (_createdFrom ?? _today)
        : (_createdTo ?? _createdFrom ?? _today);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isAfter(_today) ? _today : initial,
      firstDate: DateTime(2000),
      lastDate: _today,
    );
    if (picked == null) return;
    setState(() {
      if (isFrom) {
        _createdFrom = _toDateOnly(picked);
        _createdFromError = null;
      } else {
        _createdTo = _toDateOnly(picked);
        _createdToError = null;
      }
    });
  }

  bool _validateDates() {
    var isValid = true;
    String? fromError;
    String? toError;

    if (_createdFrom != null && _createdFrom!.isAfter(_today)) {
      fromError = 'audit.filter.future_date'.tr();
      isValid = false;
    }
    if (_createdTo != null && _createdTo!.isAfter(_today)) {
      toError = 'audit.filter.future_date'.tr();
      isValid = false;
    }

    setState(() {
      _createdFromError = fromError;
      _createdToError = toError;
    });
    return isValid;
  }

  void _applyFilters() {
    if (!_validateDates()) return;

    final normalizedTo =
        _createdTo ?? (_createdFrom != null ? _today : null);

    ref.read(auditLogFilterProvider.notifier).update(
      ref.read(auditLogFilterProvider).copyWith(
        action: _action,
        status: _status,
        createdFrom: _createdFrom,
        createdTo: normalizedTo,
        pageNumber: 1,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLoading = ref.watch(auditLogProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('audit.filter.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterSection<AuditAction>(
              title: 'audit.filter.action'.tr(),
              value: _action,
              items: AuditAction.values,
              labelBuilder: AuditLogLabels.actionLabel,
              onChanged: (value) => setState(() => _action = value),
            ),
            SizedBox(height: context.spaceMedium),
            FilterSection<AuditLogStatus>(
              title: 'audit.filter.status'.tr(),
              value: _status,
              items: AuditLogStatus.values,
              labelBuilder: AuditLogLabels.statusLabel,
              onChanged: (value) => setState(() => _status = value),
            ),
            SizedBox(height: context.spaceMedium),
            Text('audit.filter.created_from'.tr(), style: theme.textTheme.titleMedium),
            SizedBox(height: context.spaceSmall),
            _AuditDateFilterField(
              value: _formatDate(_createdFrom),
              isPlaceholder: _createdFrom == null,
              errorText: _createdFromError,
              onTap: () => _pickDate(isFrom: true),
              onClear: _createdFrom != null
                  ? () => setState(() {
                      _createdFrom = null;
                      _createdFromError = null;
                    })
                  : null,
            ),
            SizedBox(height: context.spaceMedium),
            Text('audit.filter.created_to'.tr(), style: theme.textTheme.titleMedium),
            SizedBox(height: context.spaceSmall),
            _AuditDateFilterField(
              value: _formatDate(_createdTo),
              isPlaceholder: _createdTo == null,
              errorText: _createdToError,
              onTap: () => _pickDate(isFrom: false),
              onClear: _createdTo != null
                  ? () => setState(() {
                      _createdTo = null;
                      _createdToError = null;
                    })
                  : null,
            ),
            SizedBox(height: context.spaceMedium),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : _applyFilters,
                child: isLoading
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onPrimary,
                        ),
                      )
                    : Text(
                        'audit.filter.apply'.tr(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuditDateFilterField extends StatelessWidget {
  final String value;
  final bool isPlaceholder;
  final String? errorText;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  const _AuditDateFilterField({
    required this.value,
    required this.isPlaceholder,
    this.errorText,
    required this.onTap,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingMedium,
                    vertical: context.spaceMedium,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.borderRadiusMedium,
                    ),
                    border: Border.all(
                      color: hasError ? colorScheme.error : colorScheme.outline,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: hasError
                                ? colorScheme.error
                                : isPlaceholder
                                ? colorScheme.onSurface.withValues(alpha: 0.5)
                                : null,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: hasError
                            ? colorScheme.error
                            : colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (onClear != null) ...[
              SizedBox(width: context.paddingSmall * 0.5),
              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: onClear,
              ),
            ],
          ],
        ),
        if (hasError) ...[
          SizedBox(height: context.spaceSmall),
          Text(
            errorText!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.error,
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }
}
