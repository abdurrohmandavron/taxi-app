import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/cubits/splash_cubit.dart';
import 'package:yollararo/presentations/widgets/gradient_container.dart';
import 'package:yollararo/presentations/screens/splash/widgets/splash_text.dart';
import 'package:yollararo/presentations/screens/splash/widgets/splash_lockup.dart';
import 'package:yollararo/presentations/screens/splash/widgets/splash_background_icon.dart';

@RoutePage()
class AnimatedSplashScreen extends StatelessWidget {
  const AnimatedSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => YSplashCubit()..startAnimation(),
      child: BlocListener<YSplashCubit, YSplashState>(
        listener: (context, state) => context.read<YSplashCubit>().redirect(context, state),
        child: BlocBuilder<YSplashCubit, YSplashState>(
          builder: (context, state) {
            return Scaffold(
              body: YGradientContainer(
                child: Stack(
                  children: [
                    /// Large Transparent Icon
                    YSplashBackgroundIcon(state: state),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),

                        /// Brand Lockup
                        YSplashLockup(state: state),
                        const Spacer(),

                        /// Slogan
                        YSplashText(state: state),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
