import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class SimilarTileWidget extends StatelessWidget {
  final String srcImage;
  final String title;
  final String firstSubtitle;
  final String secondSubtitle;
  final IconData suffixIcon;

  const SimilarTileWidget({
    Key? key,
    required this.srcImage,
    required this.title,
    required this.firstSubtitle,
    required this.secondSubtitle,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 75,
          child: Image.network(
            srcImage,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.subtitle.getFont,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  firstSubtitle,
                  style: AppFonts.smallSubtitle.getFont,
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 150,
                  child: Text(
                    secondSubtitle,
                    style: AppFonts.smallSubtitle.getFont,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            height: 100,
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                suffixIcon,
                color: AppColors.white.getColor,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
