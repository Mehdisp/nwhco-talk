import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';

class UnderConstructionWidget extends StatelessWidget {
  final EdgeInsets? padding;
  const UnderConstructionWidget({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 56),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (context.isDarkMode)
            Image.asset(
              'assets/images/png/under-construction-dark.png',
              width: double.infinity,
              fit: BoxFit.contain,
            )
          else
            Image.asset(
              'assets/images/png/under-construction.png',
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Page Under Construction'.tr(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: themeData.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'We are building this page and will publish it as soon as possible.'
                  .tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: themeData.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
