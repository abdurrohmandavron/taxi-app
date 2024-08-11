import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/cubits/onboarding_cubit.dart';
import 'package:yollararo/presentations/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:yollararo/presentations/screens/onboarding/widgets/onboarding_page_view.dart';
import 'package:yollararo/presentations/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:yollararo/presentations/screens/onboarding/widgets/onboarding_dot_navigation.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingCubit(),
      child: BlocBuilder<OnBoardingCubit, int>(
        builder: (context, currentPageIndex) {
          final controller = context.read<OnBoardingCubit>();

          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF0F0925),
                              Color(0xFF2B547A),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Page View
                            OnBoardingPageView(controller: controller),

                            OnBoardingDotNavigation(controller: controller),
                            const SizedBox(height: 50),

                            OnBoardingNextButton(controller: controller),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                /// Skip Button
                OnBoardingSkip(controller: controller),
              ],
            ),
          );
        },
      ),
    );
  }
}
