import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

enum SelectorType { radio, checkbox }

class WSelectButton extends StatelessWidget {
  final bool isSelected;
  final String txt;
  final SelectorType selectorType;

  const WSelectButton({
    Key? key,
    this.isSelected = false,
    required this.txt,
    this.selectorType = SelectorType.radio,
  }) : super(key: key);

  _getRadioDecoration() => BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.C999999,
          width: 1));

  _getCheckBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: isSelected ? AppColors.primaryColor : null,
      border:
          !isSelected ? Border.all(color: AppColors.C999999, width: 1) : null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isSelected && selectorType == SelectorType.checkbox
            ? Icon(Icons.check,color: Colors.green,size: 24,)
            : Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: selectorType == SelectorType.radio
                    ? _getRadioDecoration()
                    : _getCheckBoxDecoration(),
                child: isSelected && selectorType == SelectorType.radio
                    ? Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                      )
                    : null,
              ),
        const SizedBox(width: 4),
        Text(
          txt,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    );
  }
}
