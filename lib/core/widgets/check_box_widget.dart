import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../values/colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool value;
  final double? iconSize;
  final Color? color;

  const CheckBoxWidget({
    super.key,
    required this.value,
    this.iconSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: value ? (color ?? Theme.of(context).colorScheme.primary) : null,
          border: value ? null : Border.all(width: 1, color: AppColors.grey3)),
      child: value
          ? SvgPicture.asset(
              'assets/icons/check.svg',
              height: iconSize,
              width: iconSize,
            )
          : null,
    );
  }
}
