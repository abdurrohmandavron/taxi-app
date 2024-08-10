import 'package:flutter/material.dart';
import 'package:yollararo/utils/theme/text_theme.dart';

class YTheme {
  static ThemeData yTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'SF Pro Display',
    brightness: Brightness.light,
    textTheme: YTextTheme.yTextTheme,
    primaryColor: const Color(0xFF0085FF),
    scaffoldBackgroundColor: Colors.white,
  );
}
