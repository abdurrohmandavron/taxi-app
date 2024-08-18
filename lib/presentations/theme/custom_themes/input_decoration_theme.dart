import 'package:flutter/material.dart';

class ADInputDecorationTheme {
  ADInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    // constraints: const BoxConstraints.expand(height: 14.inputFieldHeight),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.grey)),
    errorBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.red)),
    enabledBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.black12)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 2, color: Colors.orange)),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    // constraints: const BoxConstraints.expand(height: 14.inputFieldHeight),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.grey)),
    errorBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.red)),
    enabledBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.white)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 2, color: Colors.orange)),
  );
}
