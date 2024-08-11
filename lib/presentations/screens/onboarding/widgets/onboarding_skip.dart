import 'package:flutter/material.dart';
import 'package:yollararo/cubits/onboarding_cubit.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key, required this.controller});

  final OnBoardingCubit controller;

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
