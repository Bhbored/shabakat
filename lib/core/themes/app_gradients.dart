import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primary, Color(0xFFFFD700)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient cardGradient = LinearGradient(
    colors: [AppColors.card, AppColors.secondary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient errorBorderGradient = LinearGradient(
    colors: [AppColors.error, AppColors.primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient cardGradientFor(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return const LinearGradient(
        colors: [AppColors.popover, AppColors.card],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
    return const LinearGradient(
      colors: [AppColors.cardLight, AppColors.mutedLight],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
