import 'package:flutter/material.dart';
import 'package:yollararo/cubits/splash_cubit.dart';

class YSplashText extends StatelessWidget {
  const YSplashText({super.key, required this.state});

  final SplashScreenState state;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: state.text.isNotEmpty ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      child: Text(
        state.text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
