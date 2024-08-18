import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/router/router.gr.dart';

class SplashScreenState {
  final double logoOpacity;
  final double nameOpacity;
  final String text;

  SplashScreenState({required this.logoOpacity, required this.nameOpacity, required this.text});
}

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState(logoOpacity: 0.0, nameOpacity: 0.0, text: ''));

  void startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));
    emit(SplashScreenState(logoOpacity: 1.0, nameOpacity: state.nameOpacity, text: state.text));

    await Future.delayed(const Duration(milliseconds: 600));
    emit(SplashScreenState(logoOpacity: state.logoOpacity, nameOpacity: 1.0, text: state.text));

    await Future.delayed(const Duration(milliseconds: 900));
    emit(SplashScreenState(logoOpacity: state.logoOpacity, nameOpacity: state.nameOpacity, text: "Sifatli va qulay taksi xizmati"));

    await Future.delayed(const Duration(seconds: 2));
  }

  void redirect(BuildContext context, SplashScreenState state) {
    if (state.text.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 700), () {
        final bool isFirstTime = Hive.box('onBoarding').get('isFirstTime');
        final bool signedIn = Hive.box('authentication').get('signedIn');

        return context.router.replace(isFirstTime
            ? const OnBoardingRoute()
            : signedIn
                ? const HomeRoute()
                : const SigninRoute());
      });
    }
  }
}
