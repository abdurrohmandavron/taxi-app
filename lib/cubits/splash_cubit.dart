import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenState {
  final double logoOpacity;
  final double nameOpacity;
  final String text;

  SplashScreenState({required this.logoOpacity, required this.nameOpacity, required this.text});
}

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState(logoOpacity: 0.0, nameOpacity: 0.0, text: ''));

  void startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 700));
    emit(SplashScreenState(logoOpacity: 1.0, nameOpacity: state.nameOpacity, text: state.text));

    await Future.delayed(const Duration(seconds: 1));
    emit(SplashScreenState(logoOpacity: state.logoOpacity, nameOpacity: 1.0, text: state.text));

    await Future.delayed(const Duration(seconds: 1));
    emit(SplashScreenState(logoOpacity: state.logoOpacity, nameOpacity: state.nameOpacity, text: "Sifatli va qulay taksi xizmati"));

    await Future.delayed(const Duration(seconds: 2));
  }
}
