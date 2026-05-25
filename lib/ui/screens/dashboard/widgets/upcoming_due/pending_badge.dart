import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class PendingBadge extends StatelessWidget {
  final int count;

  const PendingBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.paddingSmall, vertical: context.paddingSmall * 0.25),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
      ),
      child: Text(
        '$count pending',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.red, fontWeight: FontWeight.w600),
      ),
    );
  }
}
