import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'custom_themes/text_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/input_decoration_theme.dart';
import 'custom_themes/outlined_button_theme.dart';

class YTheme {
  YTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: YColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ADTextTheme.lightTextTheme,
    appBarTheme: ADAppBarTheme.lightAppBarTheme,
    checkboxTheme: ADCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: ADBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: ADElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: ADOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ADInputDecorationTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: YColors.primary,
    brightness: Brightness.dark,
    // chipTheme: ADChipTheme.darkChipTheme,
    textTheme: ADTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: ADAppBarTheme.darkAppBarTheme,
    checkboxTheme: ADCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: ADBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: ADElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: ADOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ADInputDecorationTheme.darkInputDecorationTheme,
  );
}
