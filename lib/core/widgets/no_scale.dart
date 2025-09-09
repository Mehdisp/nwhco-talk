import 'package:flutter/material.dart';

// Prevents text scaling based on system accessibility settings.
class FixedTextScale extends StatelessWidget {
  final Widget child;

  const FixedTextScale({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.noScaling,
      ),
      child: child,
    );
  }
}
