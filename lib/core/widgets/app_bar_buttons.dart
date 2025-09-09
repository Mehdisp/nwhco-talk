import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';
import 'package:nwhco_app/core/widgets/app_back_icon.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const AppBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppActionButton(
      onPressed: onTap ?? () => Navigator.maybePop(context),
      // margin: context.isMobile ? null : const EdgeInsetsDirectional.only(start: 15),
      child: const AppBackIcon(),
    );
  }
}

class AppBarCloseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool transparentStyle;
  final double size;

  const AppBarCloseButton({
    super.key,
    this.onTap,
    this.size = 18.0,
    this.transparentStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppActionButton(
      onPressed: onTap ?? () => Navigator.pop(context),
      style: transparentStyle
          ? ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.transparent))
          : null,
      child: SvgPicture.asset('assets/icons/close_icon.svg',
          width: size,
          height: size,
          colorFilter: transparentStyle
              ? ColorFilter.mode(AppColors.white, BlendMode.srcIn)
              : null),
    );
  }
}

class PopupActionButton<T> extends StatelessWidget {
  final List<PopupMenuEntry<T>> Function(BuildContext) itemBuilder;

  const PopupActionButton({
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(context.isRtl ? 24 : -24, 24),
      padding: EdgeInsets.zero,
      itemBuilder: itemBuilder,
      child: IgnorePointer(
        child: AppActionButton(
          onPressed: () {},
          child: Icon(
            Icons.more_vert_rounded,
            color: context.isDarkMode ? Colors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}

class AppActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Size? minimumSize;
  final EdgeInsetsGeometry? margin;

  const AppActionButton({
    required this.onPressed,
    required this.child,
    this.style,
    this.minimumSize,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: margin ?? const EdgeInsetsDirectional.only(start: 8),
      child: Center(
        child: FilledButton(
          style: (style ?? const ButtonStyle()).merge(
            FilledButton.styleFrom(
              backgroundColor: isDarkMode ? Colors.white12 : Colors.white,
              foregroundColor: isDarkMode ? Colors.white : AppColors.black,
              padding: EdgeInsets.zero,
              elevation: 0,
              minimumSize: minimumSize ?? const Size(40, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
