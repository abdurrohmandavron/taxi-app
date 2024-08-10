import 'package:flutter/material.dart';
import 'package:yollararo/utils/constants/texts.dart';
import 'package:yollararo/cubits/onboarding_cubit.dart';
import 'package:yollararo/screens/onboarding/widgets/onboarding_page.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.controller});

  final OnBoardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: PageView(
        controller: controller.pageController,
        onPageChanged: controller.updatePageIndicator,
        children: [
          OnBoardingPage(title: YTexts.onBoardingTitle1, subTitle: YTexts.onBoardingSubTitle1, controller: controller),
          OnBoardingPage(title: YTexts.onBoardingTitle2, subTitle: YTexts.onBoardingSubTitle2, controller: controller),
          OnBoardingPage(title: YTexts.onBoardingTitle3, subTitle: YTexts.onBoardingSubTitle3, controller: controller),
        ],
      ),
    );
  }
}
