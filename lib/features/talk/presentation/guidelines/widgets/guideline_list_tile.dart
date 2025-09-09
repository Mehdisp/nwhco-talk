import 'package:flutter/material.dart';
import 'package:nwhco_app/core/values/colors.dart';

class GuidelineListTile extends StatelessWidget {
  const GuidelineListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Item Title',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.4,
        color: AppColors.grey4,
      ),
    );
  }
}
