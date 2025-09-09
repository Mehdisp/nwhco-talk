import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nwhco_app/core/widgets/app_bar_buttons.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';

class HabibCoinsButton extends StatefulWidget {
  const HabibCoinsButton({super.key});

  @override
  State<HabibCoinsButton> createState() => _HabibCoinsButtonState();
}

class _HabibCoinsButtonState extends State<HabibCoinsButton> {
  @override
  Widget build(BuildContext context) {
    return AppActionButton(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
      ),
      onPressed: () => context.showSnackBar('Coming soon'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/habib-coin.svg'),
          const SizedBox(width: 4),
          Text(
            '0',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF151C31),
            ),
          ),
        ],
      ),
    );
  }
}
