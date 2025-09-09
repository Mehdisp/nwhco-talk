import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  final bool isEnabled;

  const AppShimmer({
    required this.child,
    this.isEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return Shimmer.fromColors(
      enabled: isEnabled,
      baseColor: isDarkMode ? Colors.white10 : AppColors.shimmerBase,
      highlightColor: isDarkMode ? Colors.white24 : AppColors.shimmerHighlight,
      child: child,
    );
  }
}
