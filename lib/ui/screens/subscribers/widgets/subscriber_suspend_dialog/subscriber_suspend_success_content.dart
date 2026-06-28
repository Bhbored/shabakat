import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/customer/suspend_customers_response.dart';
import 'package:shabakat/core/themes/app_colors.dart';

class SubscriberSuspendSuccessContent extends StatelessWidget {
  final SuspendCustomersResponse response;

  const SubscriberSuspendSuccessContent({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(LucideIcons.checkCircle2, size: 48, color: AppColors.success),
        SizedBox(height: context.spaceMedium),
        Text(
          response.message,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.spaceMedium),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(context.paddingMedium),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          ),
          child: Column(
            children: [
              Text(
                '${response.suspended}',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.success,
                ),
              ),
              SizedBox(height: context.spaceSmall * 0.25),
              Text(
                'subscribers.suspend.success_label'.tr(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.55),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
