import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../cubits/search_cubit.dart';
import '../../../../presentations/widgets/custom_icon.dart';

class YSearchItems extends StatelessWidget {
  const YSearchItems({
    super.key,
    required this.children,
    required this.cubit,
  });

  final YSearchCubit cubit;
  final List<String> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: children.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF2F4F7)),
          ),
          child: ListTile(
            trailing: const YIcon(FeatherIcons.arrowRight, backgroundColor: Color(0xFFF2F4F7)),
            title: Text(children[index]),
            onTap: () => cubit.getCities(children[index]),
          ),
        ),
      ),
    );
  }
}
