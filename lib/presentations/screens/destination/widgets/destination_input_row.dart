import 'package:flutter/material.dart';
import 'package:yollararo/presentations/widgets/search_bar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:yollararo/presentations/widgets/custom_icon.dart';

class YDestinationInputRow extends StatelessWidget {
  const YDestinationInputRow({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        YSearchBar(width: MediaQuery.of(context).size.width - 113, hintText: hintText),
        const SizedBox(width: 4),
        const YIcon(
          FeatherIcons.mapPin,
          size: 50,
          iconSize: 20,
          color: Color(0xFF98A2B3),
          backgroundColor: Color(0xFFF9FAFB),
        ),
      ],
    );
  }
}
