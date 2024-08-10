import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yollararo/cubits/onboarding_cubit.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key, required this.controller});

  final OnBoardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller.pageController,
      onDotClicked: controller.dotNavigationClick,
      count: 3,
      effect: const ExpandingDotsEffect(activeDotColor: Color(0xFF0085FF), dotHeight: 6, dotWidth: 6),
    );
  }
}
