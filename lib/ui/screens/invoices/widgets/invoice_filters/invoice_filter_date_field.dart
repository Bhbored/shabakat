import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class InvoiceFilterDateField extends StatelessWidget {
  final String value;
  final String? errorText;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  const InvoiceFilterDateField({
    super.key,
    required this.value,
    this.errorText,
    required this.onTap,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPlaceholder = value == 'All';
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
