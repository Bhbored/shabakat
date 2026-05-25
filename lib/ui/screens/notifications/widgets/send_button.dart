import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class SendButton extends StatelessWidget {
  final bool isSent;
  final bool isWhatsApp;
  final VoidCallback? onTap;

  const SendButton({
    super.key,
    required this.isSent,
    required this.isWhatsApp,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (isSent) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingSmall,
          vertical: context.paddingSmall * 0.5,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF10B981).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          border: Border.all(
            color: const Color(0xFF10B981).withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.checkCircle,
              size: 14,
              color: const Color(0xFF10B981),
            ),
            SizedBox(width: context.paddingSmall * 0.5),
            Text(
              'Sent',
              style: theme.textTheme.labelMedium?.copyWith(
                color: const Color(0xFF10B981),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingSmall,
          vertical: context.paddingSmall * 0.5,
        ),
        decoration: BoxDecoration(
          color: isWhatsApp ? const Color(0xFF10B981) : colorScheme.primary,
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.send,
              size: 14,
              color: isWhatsApp ? Colors.white : colorScheme.onPrimary,
            ),
            SizedBox(width: context.paddingSmall * 0.5),
            Text(
              isWhatsApp ? 'WhatsApp' : 'SMS',
              style: theme.textTheme.labelMedium?.copyWith(
                color: isWhatsApp ? Colors.white : colorScheme.onPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
