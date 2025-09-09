import 'package:flutter/material.dart';
import 'package:nwhco_app/core/values/colors.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerTextPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final Duration period;
  const ShimmerTextPlaceholder(
      {super.key,
      this.period = const Duration(milliseconds: 650),
      this.width = 120,
      this.height = 10});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: period,
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.black, borderRadius: BorderRadius.circular(12)),
        width: width,
        height: height,
      ),
    );
  }
}
