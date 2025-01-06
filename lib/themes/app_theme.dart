import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFF735BF2),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      textTheme: TextTheme(
        bodyMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}
