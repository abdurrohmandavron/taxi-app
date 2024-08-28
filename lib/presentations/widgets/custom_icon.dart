import 'package:flutter/material.dart';

class YIcon extends StatelessWidget {
  const YIcon(
    this.icon, {
    super.key,
    this.color,
    this.border,
    this.onPressed,
    this.size = 32,
    this.iconSize = 18,
    this.backgroundColor,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double size, iconSize;
  final Color? color, backgroundColor, border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: border != null ? Border.all(color: border!) : null,
        ),
        child: Icon(icon, size: iconSize, color: color),
      ),
    );
  }
}
