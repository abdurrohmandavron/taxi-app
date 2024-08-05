import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yollararo/router/router.gr.dart';
import 'package:yollararo/cubits/splash_cubit.dart';

@RoutePage()
class AnimatedSplashScreen extends StatelessWidget {
  const AnimatedSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashScreenCubit()..startAnimation(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF042A49),
                Color(0xFF042A49),
              ],
            ),
          ),
          child: BlocListener<SplashScreenCubit, SplashScreenState>(
            listener: (context, state) {
              if (state.text.isNotEmpty) {
                Future.delayed(const Duration(seconds: 2), () => context.router.replace(const HomeRoute()));
              }
            },
            child: BlocBuilder<SplashScreenCubit, SplashScreenState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    Positioned(
                      top: -100,
                      left: -65,
                      child: AnimatedOpacity(
                        opacity: state.logoOpacity != 1 ? state.logoOpacity : .15,
                        duration: const Duration(milliseconds: 600),
                        child: Transform.rotate(
                          angle: 15 * (pi / 180.0),
                          child: const Image(image: AssetImage('assets/logos/yollararo-logo.png'), color: Color(0xFF0085FF)),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        AnimatedOpacity(
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
                        ),
                        const Spacer(),
                        AnimatedOpacity(
                          opacity: state.text.isNotEmpty ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          child: Text(
                            state.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
