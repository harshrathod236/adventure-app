import 'package:adventure_ui_demo/model/prefrence_utils.dart';
import 'package:adventure_ui_demo/screen/bottom_bar.dart';
import 'package:adventure_ui_demo/screen/onboarding_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();

    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (PreferenceUtils.getBoolValue("isLoggedIn")) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomBar(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 2.5,
                  width: size.width / 1.3,
                  child: Lottie.asset(
                    'assets/lottie/90724-travel-world-usa.json',
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "The Cruiseman",
                      textStyle: TextStyle(
                          fontFamily: "Pacifico",
                          color: const Color(0xff0054ff),
                          fontSize: size.width * 0.1,
                          fontWeight: FontWeight.w300),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
