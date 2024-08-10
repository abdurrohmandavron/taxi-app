import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/router/router.gr.dart';
import 'package:yollararo/screens/home/home_screen.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);

  final pageController = PageController();
  final storage = Hive.box('onBoarding');

  void updatePageIndicator(int index) => emit(index);

  void dotNavigationClick(int index) {
    emit(index);
    pageController.jumpToPage(index);
  }

  void nextPage(BuildContext context) {
    if (state == 2) {
      storage.put("isFirstTime", false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      int page = state + 1;
      emit(page);
      pageController.jumpToPage(page);
    }
  }

  void skipPage(BuildContext context) => context.router.replace(const HomeRoute());
}
