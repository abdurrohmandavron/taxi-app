import 'package:flutter/material.dart';
import 'package:yollararo/cubits/onboarding_cubit.dart';

class YOnBoardingNextButton extends StatelessWidget {
  const YOnBoardingNextButton({super.key, required this.controller});

  final YOnBoardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.nextPage(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text('Keyingi', style: TextStyle(fontSize: 16.0)),
    );
  }
}
