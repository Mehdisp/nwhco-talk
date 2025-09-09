import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/theme_extensions.dart';

class FeatureBackground extends StatelessWidget {
  final Color? color;
  final Widget? header;
  final Color? background;
  final Widget? floatingActionButton;
  final Widget child;

  const FeatureBackground({
    required this.child,
    this.color,
    this.header,
    this.background,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeData = Theme.of(context);
    final primaryColor = color ?? themeData.colorScheme.primary;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: background ?? themeData.scaffoldBackgroundColor,
        ),
        Positioned(
          top: (size.width) * -0.90,
          height: size.width / 1.1,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(200),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.4),
                  blurRadius: 48,
                  offset: const Offset(0, 48),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/png/islamic-pattern.png',
            fit: BoxFit.cover,
            color: themeData.isDarkMode //
                ? Colors.white.withOpacity(0.025)
                : Colors.white.withOpacity(0.25),
          ),
        ),
        Positioned.fill(child: child),
        if (floatingActionButton != null)
          PositionedDirectional(
            bottom: 16,
            end: 16,
            child: floatingActionButton!,
          ),
      ],
    );
  }
}
