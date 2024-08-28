import 'package:flutter/material.dart';

class YCityBubble extends StatelessWidget {
  final String title;
  final String subtitle;

  const YCityBubble({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CityBubblePainter(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4.0),
            Text(subtitle, style: TextStyle(fontSize: 12.0, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}

class CityBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2 - 10, size.height)
      ..lineTo(size.width / 2, size.height + 10)
      ..lineTo(size.width / 2 + 10, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
