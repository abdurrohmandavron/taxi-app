import 'package:flutter/material.dart';
import 'package:yollararo/utils/constants.dart';

class ADElevatedButtonTheme {
  ADElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: YColors.primary,
      disabledBackgroundColor: const Color(0xFFEFF5FD),
      padding: const EdgeInsets.symmetric(vertical: 18),
      disabledForegroundColor: const Color(0xFFC3D3E9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      disabledBackgroundColor: const Color(0xFFEFF5FD),
      padding: const EdgeInsets.symmetric(vertical: 18),
      disabledForegroundColor: const Color(0xFFC3D3E9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    ),
  );
}
