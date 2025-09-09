import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nwhco_app/core/values/colors.dart';

class CircularLoadingIndicator extends StatefulWidget {
  final double radius;
  final double strokeWidth;

  const CircularLoadingIndicator(
      {super.key, this.radius = 24, this.strokeWidth = 3.7});

  @override
  State<CircularLoadingIndicator> createState() =>
      _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState
    extends State<CircularLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: CustomPaint(
        size: Size.fromRadius(widget.radius),
        painter: GradientCircularProgressPainter(
          radius: widget.radius,
          gradientColors: [Colors.white, AppColors.meetPrimary],
          strokeWidth: widget.strokeWidth,
        ),
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });

  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(
            colors: gradientColors, startAngle: 0.0, endAngle: 1.5 * pi)
        .createShader(rect);
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(rect, .5, 4, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
