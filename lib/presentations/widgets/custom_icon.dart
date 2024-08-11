import 'package:flutter/widgets.dart';

class YIcon extends StatelessWidget {
  const YIcon(
    this.icon, {
    super.key,
    this.color,
    this.applyBackground,
  });

  final IconData icon;
  final Color? color;
  final bool? applyBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 18, color: color),
    );
  }
}
