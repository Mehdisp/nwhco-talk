import 'package:flutter/material.dart';

class CheckBoxView extends StatelessWidget {
  final bool value;
  final double height;

  const CheckBoxView({
    required this.value,
    this.height = double.infinity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SizedBox(
      width: 20,
      height: height,
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: themeData.colorScheme.onSurface,
              width: 1,
            ),
          ),
          child: AnimatedContainer(
            width: value ? 14 : 0,
            height: value ? 14 : 0,
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: themeData.colorScheme.primary,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
