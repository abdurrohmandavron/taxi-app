import 'package:flutter/material.dart';

class YGradientContainer extends StatelessWidget {
  const YGradientContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F0925),
            Color(0xFF2B547A),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: child,
    );
  }
}
