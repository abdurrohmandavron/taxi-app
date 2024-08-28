import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../cubits/search_cubit.dart';

class YSearchBar extends StatelessWidget {
  const YSearchBar({super.key, required this.width, required this.hintText});

  final double width;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YSearchCubit, YSearchState>(
      builder: (context, state) {
        final cubit = context.read<YSearchCubit>();

        return GestureDetector(
          onTap: () => cubit.initScreen(context),
          child: Container(
            height: 50,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const Icon(FeatherIcons.search, color: Color(0xFF98A2B3)),
                const SizedBox(width: 16),
                Text(
                  hintText,
                  style: Theme.of(context).textTheme.labelLarge!.apply(color: const Color(0xFFD0D5DD)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
