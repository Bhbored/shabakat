import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class RecordingWaveform extends StatelessWidget {
  const RecordingWaveform({
    super.key,
    required this.level,
    required this.color,
  });

  final double level;
  final Color color;

  static const _barCount = 20;

  @override
  Widget build(BuildContext context) {
    final normalized = ((level + 50) / 50).clamp(0.08, 1.0);

    return SizedBox(
      height: context.spaceMedium + context.spaceSmall,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_barCount, (index) {
          final wave = math.sin((index / _barCount) * math.pi);
          final height =
              (context.spaceSmall +
                      (normalized * context.spaceMedium * wave))
                  .clamp(context.spaceSmall / 2, context.spaceMedium * 1.4);
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingSmall / 8,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 90),
                curve: Curves.easeOut,
                height: height,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.35 + normalized * 0.55),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
