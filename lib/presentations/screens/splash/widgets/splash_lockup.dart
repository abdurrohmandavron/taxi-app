import 'package:flutter/material.dart';
import 'package:yollararo/cubits/splash_cubit.dart';

class YSplashLockup extends StatelessWidget {
  const YSplashLockup({super.key, required this.state});

  final YSplashState state;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: state.nameOpacity,
      duration: const Duration(seconds: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logos/yollararo-logo.png', width: 72),
          const Text(
            "Yo'llararo",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
