import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/util/extensions/list_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';

class NavigationBarItem {
  final String? tag;
  final Widget icon;
  final Widget iconFilled;
  final Widget label;

  // final VoidCallback? onTap;

  NavigationBarItem({
    required this.icon,
    required this.iconFilled,
    required this.label,
    this.tag,
    // this.onTap,
  });

  factory NavigationBarItem.ai() {
    return NavigationBarItem(
      tag: 'ai-assistant',
      icon: const SizedBox.shrink(),
      iconFilled: const SizedBox.shrink(),
      label: const SizedBox.shrink(),
    );
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  final double width;
  final double height;
  final int index;
  final List<NavigationBarItem> items;
  final void Function(int index)? onIndexChanged;

  const AppBottomNavigationBar({
    required this.items,
    this.width = double.infinity,
    this.height = 78,
    this.onIndexChanged,
    this.index = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pb = context.padding.bottom;
    return Container(
      width: width,
      height: height + pb,
      padding: EdgeInsets.only(bottom: pb),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: context.isDarkMode ? const Color(0xFF121211) : Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x26676E7C),
            offset: Offset(0, -7),
            blurRadius: 12,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int i = index;

          final aiIndex = items.indexWhere((element) {
            return element.tag == 'ai-assistant';
          });

          if (aiIndex >= 0) {
            i = index < aiIndex ? index : index + 1;
          }

          final itemWidth = (constraints.maxWidth - 16) / items.length;

          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              children: [
                Row(
                  children: items.mapIndexed((index, item) {
                    return _NavigationItem(
                      width: itemWidth,
                      item: item,
                      isSelected: i == index,
                      onPressed: () => onIndexChanged?.call(
                        aiIndex == -1 || index < aiIndex ? index : index - 1,
                      ),
                    );
                  }).toList(),
                ),
                AnimatedPositionedDirectional(
                  start: (i * itemWidth) + ((itemWidth / 2) - 24),
                  bottom: 0,
                  height: 10,
                  width: 48,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                  child: const NavigationBarIndicator(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final double width;
  final NavigationBarItem item;
  final bool isSelected;
  final VoidCallback? onPressed;

  const _NavigationItem({
    required this.item,
    required this.width,
    this.isSelected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(width / 2),
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Center(
                child: isSelected ? item.iconFilled : item.icon,
              ),
            ),
            const SizedBox(height: 1),
            DefaultTextStyle(
              maxLines: 1,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: themeData.bottomNavigationBarTheme.selectedLabelStyle
                      ?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? themeData.colorScheme.primary
                        : context.isDarkMode
                            ? AppColors.grey2
                            : AppColors.grey4,
                  ) ??
                  const TextStyle(),
              child: item.label,
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationBarIndicator extends StatelessWidget {
  const NavigationBarIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return CustomPaint(
      painter: NavigationBarIndicatorPainter(color),
    );
  }
}

class NavigationBarIndicatorPainter extends CustomPainter {
  final Color? color;

  NavigationBarIndicatorPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, size.height);

    path.cubicTo(
      size.width * 0.25,
      size.height,
      size.width * 0.25,
      0,
      size.width * 0.5,
      0,
    );

    path.cubicTo(
      size.width * 0.75,
      0,
      size.width * 0.75,
      size.height,
      size.width,
      size.height,
    );

    path.lineTo(0, size.height);
    path.close();

    final paint = Paint();
    paint.isAntiAlias = true;
    paint.color = color ?? AppColors.quran;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
