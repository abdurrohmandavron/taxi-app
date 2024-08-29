import 'package:flutter/material.dart';
import '../../presentations/widgets/gradient_container.dart';

class YHeader extends StatelessWidget {
  const YHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: YGradientContainer(
        height: 284,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white)),
              const SizedBox(height: 8),
              Text(subTitle, style: Theme.of(context).textTheme.titleSmall!.apply(color: Colors.white)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
