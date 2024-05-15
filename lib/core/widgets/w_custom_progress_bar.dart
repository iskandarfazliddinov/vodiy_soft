import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class WCustomProgressBar extends StatelessWidget {
  final int percentage;
  final double width;

  const WCustomProgressBar({
    Key? key,
    required this.percentage,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.C999999.withOpacity(0.1),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: width * (percentage / 100),
          height: 12,
          decoration: BoxDecoration(
            color: const Color(0xFF63CC49),
            borderRadius: BorderRadius.circular(80),
          ),
        ),
      ),
    );
  }
}
