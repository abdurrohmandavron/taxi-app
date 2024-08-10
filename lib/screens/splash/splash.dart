import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/cubits/splash_cubit.dart';
import 'package:yollararo/screens/splash/widgets/splash_text.dart';
import 'package:yollararo/screens/splash/widgets/splash_lockup.dart';
import 'package:yollararo/widgets/containers/gradient_container.dart';
import 'package:yollararo/screens/splash/widgets/splash_background_icon.dart';

@RoutePage()
class AnimatedSplashScreen extends StatelessWidget {
  const AnimatedSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenCubit()..startAnimation(),
      child: Scaffold(
        body: YGradientContainer(
          /// Container with LinearGradient

          child: BlocListener<SplashScreenCubit, SplashScreenState>(
            /// State changes listener

            listener: (context, state) => BlocProvider.of<SplashScreenCubit>(context).redirect(context, state),
            child: BlocBuilder<SplashScreenCubit, SplashScreenState>(
              /// Build Widget

              builder: (context, state) => Stack(
                children: [
                  /// Large Transparent Icon
                  YSplashBackgroundIcon(state: state),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Brand Lockup
                      const Spacer(),
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
          ),
        ),
      ),
    );
  }
}
