import 'package:flutter/material.dart';

class TopicItemWidget extends StatelessWidget {
  final String topic;
  final Color? color;

  const TopicItemWidget(
    this.topic, {
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      height: 22,
      decoration: BoxDecoration(
        border: Border.all(color: color ?? const Color(0xFFBCBCBC)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        topic,
        style: TextStyle(
          fontFamilyFallback: ['Segoeui', 'yekanx'],
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color ?? Color(0xFF8B8B8B),
          height: 10 / 8.9,
        ),
      ),
    );
  }
}
