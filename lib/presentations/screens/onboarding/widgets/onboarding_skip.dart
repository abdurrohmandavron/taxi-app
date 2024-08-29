import 'package:flutter/material.dart';

import '../../../../cubits/onboarding_cubit.dart';

class YOnBoardingSkip extends StatelessWidget {
  const YOnBoardingSkip({super.key, required this.controller});

  final YOnBoardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight,
      right: 24,
      child: TextButton(
        onPressed: () => controller.skipPage(context),
        child: const Text("O'tkazib yuborish", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
