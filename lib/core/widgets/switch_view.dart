import 'package:flutter/material.dart';

class SwitchView extends StatelessWidget {
  final bool value;

  const SwitchView(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      child: IgnorePointer(
        child: FittedBox(
          fit: BoxFit.fill,
          child: Switch(
            value: value,
            onChanged: (_) {},
          ),
        ),
      ),
    );
  }
}