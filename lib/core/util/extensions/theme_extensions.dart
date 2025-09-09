import 'package:flutter/material.dart';

extension ThemeExtensions on ThemeData {
  bool get isDarkMode => brightness == Brightness.dark;
}
