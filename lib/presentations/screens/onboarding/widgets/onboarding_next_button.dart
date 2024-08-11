import 'package:flutter/material.dart';
import 'package:yollararo/cubits/onboarding_cubit.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key, required this.controller});

  final OnBoardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.nextPage(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text('Keyingi', style: TextStyle(fontSize: 16.0)),
    );
  }
}
