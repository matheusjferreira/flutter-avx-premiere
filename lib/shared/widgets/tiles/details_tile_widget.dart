import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class DetailsTileWidget extends StatelessWidget {
  final String label;
  final IconData icon;

  const DetailsTileWidget({
    required this.label,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.white.getColor,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppFonts.subtitle.getFont,
        ),
      ],
    );
  }
}
