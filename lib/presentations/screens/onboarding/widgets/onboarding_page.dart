import 'package:flutter/material.dart';

import '../../../../cubits/onboarding_cubit.dart';

class YOnBoardingPage extends StatelessWidget {
  const YOnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.controller,
  });

  final String title, subTitle;
  final YOnBoardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),
      ],
    );
  }
}
