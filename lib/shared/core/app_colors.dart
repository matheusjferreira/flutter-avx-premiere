import 'package:flutter/material.dart';

const primaryColor = MaterialColor(
  0xff000000,
  <int, Color>{
    50: Color(0xfff5f5f5),
    100: Color(0xffe9e9e9),
    200: Color(0xffd9d9d9),
    300: Color(0xffc4c4c4),
    400: Color(0xff9d9d9d),
    500: Color(0xff7b7b7b),
    600: Color(0xff555555),
    700: Color(0xff434343),
    800: Color(0xff262626),
    900: Color(0xff000000),
  },
);

enum AppColors {
  black,
  white,
}

extension AppColorsExtension on AppColors {
  Color get getColor {
    switch (this) {
      case AppColors.black:
        return const Color(0xff000000);
      case AppColors.white:
        return const Color(0xffffffff);
      default:
        return const Color(0xff000000);
    }
  }
}
