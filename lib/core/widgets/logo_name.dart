import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LogoName extends StatelessWidget {
  final String title;

  const LogoName({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String languageCode = context.locale.languageCode;

    // Define specific languages for which Segoe UI should be used
    final List<String> specificLanguages = ['az', 'tr', 'ru', 'uz', 'tg', 'gu'];

    final bool useSegoeUI = specificLanguages.contains(languageCode);

    return Text(
      title,
      style: TextStyle(
        fontFamily: useSegoeUI ? 'Segoeui' : 'Faminela',
        fontWeight: useSegoeUI ? FontWeight.w800 : FontWeight.normal,
        height: 1,
        fontSize: 20,
      ),
    );
  }
}
