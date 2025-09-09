import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';

class AppBackIcon extends StatelessWidget {
  final Color? color;
  final double? size;

  const AppBackIcon({
    this.color,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColors =
        context.isDarkMode ? Colors.white : AppColors.black;

    return RotatedBox(
      quarterTurns: context.isRtl ? 2 : 0,
      child: SvgPicture.asset(
        'assets/icons/arrow-back.svg',
        width: size,
        colorFilter: ColorFilter.mode(
          color ?? foregroundColors,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
