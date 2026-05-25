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
}
