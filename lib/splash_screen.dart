import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pingpong_counter_flutter/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedSplashScreen(
        splash: Center(
          child: LottieBuilder.asset(
            "assets/Lottie/loading.json",
            width: 200,
            height: 200,
          ),
        ),
        nextScreen: const HomePage(),
        splashIconSize: 300,
        backgroundColor: Colors.blueAccent,
      ),
    );

  }
}
