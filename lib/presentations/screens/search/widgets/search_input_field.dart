import 'package:flutter/material.dart';
import 'package:yollararo/cubits/search_cubit.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class YSearchInputField extends StatelessWidget {
  const YSearchInputField({
    super.key,
    required this.cubit,
  });

  final YSearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      width: double.infinity,
      child: TextField(
        onChanged: (query) => cubit.search(query),
        decoration: InputDecoration(
          icon: const Icon(FeatherIcons.search, color: Color(0xFF98A2B3)),
          hintText: "Chilonzor t...,",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.apply(color: const Color(0xFFD0D5DD)),
        ),
        style: Theme.of(context).textTheme.bodyLarge!.apply(color: const Color(0xFF667085)),
      ),
    );
  }
}
