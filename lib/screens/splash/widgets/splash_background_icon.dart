import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yollararo/cubits/splash_cubit.dart';
import 'package:yollararo/utils/constants/colors.dart';

class YSplashBackgroundIcon extends StatelessWidget {
  const YSplashBackgroundIcon({super.key, required this.state});

  final SplashScreenState state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -100,
      left: -65,
      child: AnimatedOpacity(
        opacity: state.logoOpacity != 1 ? state.logoOpacity : .15,
        duration: const Duration(milliseconds: 600),
        child: Transform.rotate(
          angle: 15 * (pi / 180.0),
          child: const Image(
            image: AssetImage('assets/logos/yollararo-logo.png'),
            color: YColors.primary,
          ),
        ),
      ),
    );
  }
}
