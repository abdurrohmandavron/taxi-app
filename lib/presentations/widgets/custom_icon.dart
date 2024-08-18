import 'package:flutter/widgets.dart';

class YIcon extends StatelessWidget {
  const YIcon(
    this.icon, {
    super.key,
    this.color,
    this.size = 18,
    this.width = 32,
    this.height = 32,
    this.backgroundColor,
  });

  final IconData icon;
  final double width, height, size;
  final Color? color, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: size, color: color),
    );
  }
}
