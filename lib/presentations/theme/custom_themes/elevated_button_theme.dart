import 'package:flutter/material.dart';
import 'package:yollararo/utils/constants.dart';

class ADElevatedButtonTheme {
  ADElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: YColors.primary,
      // disabledBackgroundColor: YColors.grey,
      // disabledForegroundColor: YColors.darkGrey,
      side: const BorderSide(color: YColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      // backgroundColor: YColors.secondary,
      // disabledBackgroundColor: YColors.grey,
      // disabledForegroundColor: YColors.darkGrey,
      // side: const BorderSide(color: YColors.secondary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    ),
  );
}
