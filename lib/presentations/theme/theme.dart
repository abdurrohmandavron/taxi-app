import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'custom_themes/text_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/input_decoration_theme.dart';

class YTheme {
  YTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: YColors.primary,
    textTheme: YTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: YAppBarTheme.lightAppBarTheme,
    checkboxTheme: YCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: YBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: YElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: YOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: YInputDecorationTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: YColors.primary,
    textTheme: YTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: YAppBarTheme.darkAppBarTheme,
    checkboxTheme: YCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: YBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: YElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: YOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: YInputDecorationTheme.darkInputDecorationTheme,
  );
}
