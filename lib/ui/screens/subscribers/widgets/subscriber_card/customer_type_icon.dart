import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_type.dart';

class CustomerTypeIcon extends StatelessWidget {
  final CustomerType type;

  const CustomerTypeIcon({super.key, required this.type});

  IconData get _icon => switch (type) {
    CustomerType.residential => LucideIcons.home,
    CustomerType.commercial => LucideIcons.building2,
    CustomerType.industrial => LucideIcons.factory,
  };

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(context.paddingSmall),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      ),
      child: Icon(
        _icon,
        size: 20,
        color: colorScheme.primary,
      ),
    );
  }
}
