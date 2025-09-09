import 'package:flutter/material.dart';
import 'package:nwhco_app/core/values/colors.dart';

class BottomSheetTitle extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onCloseTap;

  const BottomSheetTitle({
    required this.title,
    this.padding,
    this.onCloseTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: 8, bottom: 24),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.grey3,
              ),
            ),
          ),
          GestureDetector(
            onTap: onCloseTap ?? () => Navigator.pop(context),
            child: const Icon(
              Icons.close,
              color: AppColors.grey3,
            ),
          ),
        ],
      ),
    );
  }
}
