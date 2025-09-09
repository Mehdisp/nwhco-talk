import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? message;
  final String? title;
  final double topPadding;
  final double? height;
  final BoxFit? fit;

  const EmptyStateWidget({
    this.message,
    this.title,
    this.height,
    this.fit,
    this.topPadding = 56,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: topPadding),
        if (context.isDarkMode)
          Image.asset(
            'assets/images/png/empty-box-dark.png',
            height: height,
            width: double.infinity,
            fit: fit ?? BoxFit.contain,
          )
        else
          Image.asset(
            'assets/images/png/empty-box.png',
            height: height,
            width: double.infinity,
            fit: fit ?? BoxFit.contain,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title ?? 'There is no content available'.tr(),
            textAlign: TextAlign.center,
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
            message ?? 'Please check some other time!!'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: themeData.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
