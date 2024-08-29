import 'package:flutter/material.dart';

import '../../../../presentations/widgets/city_bubble.dart';

class YMapPointer extends StatelessWidget {
  const YMapPointer({
    super.key,
    required this.region,
    required this.city,
  });

  final String region, city;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          YCityBubble(title: region, subtitle: city),
          const SizedBox(height: 16),
          const Image(image: AssetImage('assets/icons/pointer.png')),
          const SizedBox(height: 137),
        ],
      ),
    );
  }
}
