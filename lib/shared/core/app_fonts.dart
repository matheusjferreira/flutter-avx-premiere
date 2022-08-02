import 'package:flutter/material.dart';

import 'app_colors.dart';

enum AppFonts {
  smallSubtitle,
  smallTitle,
  subtitle,
  title,
}

extension AppFontsExtension on AppFonts {
  TextStyle get getFont {
    switch (this) {
      case AppFonts.smallSubtitle:
        return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.white.getColor);
      case AppFonts.smallTitle:
        return TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.white.getColor);
      case AppFonts.subtitle:
        return TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.white.getColor,
        );
      case AppFonts.title:
        return TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.white.getColor);
    }
  }
}
