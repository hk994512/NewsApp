import 'package:flutter/material.dart';

class AppTheme {
  static themeArg(context, double fontSize) {
    Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: fontSize,
        );
  }

  static ThemeData theme(context) {
    return ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
          bodyLarge: AppTheme.themeArg(context, 18),
          bodyMedium: AppTheme.themeArg(context, 15),
          bodySmall: AppTheme.themeArg(context, 12)),
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 17, 35, 134),
      ),
    );
  }
}
