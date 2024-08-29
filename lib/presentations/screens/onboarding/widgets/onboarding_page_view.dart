import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../../cubits/onboarding_cubit.dart';
import '../../../../presentations/screens/onboarding/widgets/onboarding_page.dart';

class YOnBoardingPageView extends StatelessWidget {
  const YOnBoardingPageView({super.key, required this.controller});

  final YOnBoardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: PageView(
        controller: controller.pageController,
        onPageChanged: controller.updatePageIndicator,
        children: [
          YOnBoardingPage(title: YTexts.onBoardingTitle1, subTitle: YTexts.onBoardingSubTitle1, controller: controller),
          YOnBoardingPage(title: YTexts.onBoardingTitle2, subTitle: YTexts.onBoardingSubTitle2, controller: controller),
          YOnBoardingPage(title: YTexts.onBoardingTitle3, subTitle: YTexts.onBoardingSubTitle3, controller: controller),
        ],
      ),
    );
  }
}
