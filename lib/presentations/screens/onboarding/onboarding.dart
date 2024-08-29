import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/onboarding_cubit.dart';
import '../../../presentations/widgets/gradient_container.dart';
import '../../../presentations/screens/onboarding/widgets/onboarding_skip.dart';
import '../../../presentations/screens/onboarding/widgets/onboarding_page_view.dart';
import '../../../presentations/screens/onboarding/widgets/onboarding_next_button.dart';
import '../../../presentations/screens/onboarding/widgets/onboarding_dot_navigation.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YOnBoardingCubit(),
      child: BlocBuilder<YOnBoardingCubit, int>(
        builder: (context, currentPageIndex) {
          final controller = context.read<YOnBoardingCubit>();

          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    /// Gradient
                    const Expanded(child: YGradientContainer(child: SizedBox())),

                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Page View
                            YOnBoardingPageView(controller: controller),

                            /// Navigation Indicator
                            YOnBoardingDotNavigation(controller: controller),
                            const SizedBox(height: 50),

                            /// Next Button
                            YOnBoardingNextButton(controller: controller),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                /// Skip Button
                YOnBoardingSkip(controller: controller),
              ],
            ),
          );
        },
      ),
    );
  }
}
