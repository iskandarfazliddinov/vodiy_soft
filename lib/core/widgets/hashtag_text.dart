import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/styles.dart';

class HashtagText extends StatelessWidget {
  final String text;

  const HashtagText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');
    final spans = <TextSpan>[];

    for (var word in words) {
      if (word.startsWith('#')) {
        spans.add(TextSpan(
          text: '$word ',
          style: Styles.getTextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ));
      } else {
        spans.add(TextSpan(
          text: '$word ',
          style: Styles.getTextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ));
      }
    }

    return RichText(
      text: TextSpan(
        children: spans,
      ),
    );
  }
}
