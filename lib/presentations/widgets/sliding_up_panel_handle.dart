import 'package:flutter/widgets.dart';

class YSlidingUpPanelHandle extends StatelessWidget {
  const YSlidingUpPanelHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 33,
        height: 6,
        decoration: BoxDecoration(
          color: const Color(0xFFD0D5DD),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
