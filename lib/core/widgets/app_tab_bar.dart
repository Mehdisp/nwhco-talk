import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;
  final EdgeInsetsGeometry? margin;
  final List<Tab> tabs;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final void Function(int index)? onTap;

  const AppTabBar({
    required this.controller,
    required this.tabs,
    this.margin,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.onTap,
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 64);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 48,
      margin: margin ??
          EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.grey5 : AppColors.grey1,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TabBar(
        controller: controller,
        onTap: onTap,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.white,
        indicatorWeight: 1,
        tabs: tabs,
        labelStyle: labelStyle ??
            themeData.tabBarTheme.labelStyle?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
        unselectedLabelStyle: unselectedLabelStyle ??
            themeData.tabBarTheme.unselectedLabelStyle?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
        indicator: BoxDecoration(
          color: context.isDarkMode ? AppColors.grey1 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x331E1E1E),
              offset: Offset(0, 4),
              blurRadius: 11,
            ),
          ],
        ),
      ),
    );
  }
}
