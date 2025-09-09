import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingText extends StatelessWidget {
  final double rating;

  const RatingText(this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    if (rating == 0) return SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/icons/star.svg', width: 11, height: 11),
        const SizedBox(width: 3),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 10,
            height: 13.9/10,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF4C51D),
          ),
        ),
      ],
    );
  }
}
