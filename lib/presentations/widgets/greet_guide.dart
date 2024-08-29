import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../presentations/widgets/custom_icon.dart';

class YGreetGuide extends StatelessWidget {
  const YGreetGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Xayrli kun Abdurahmon Davronov", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w700)),
            Text("Bormoqchi bo'lgan manzilingizni kiriting", style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const YIcon(FeatherIcons.user, color: Color(0xFF98A2B3), backgroundColor: Color(0xFFF2F4F7)),
      ],
    );
  }
}
