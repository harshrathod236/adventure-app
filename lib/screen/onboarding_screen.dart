import 'package:adventure_ui_demo/screen/choice_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Map<String, dynamic>> onBoardingList = [
    {
      "title": "Observe",
      "lottie": "assets/lottie/18517-the-travelers-walking-cycle-delivery.json",
      "subtitle":
          "The night sky has much to offer to those who seek its mystery.",
      "icon": Icons.arrow_forward_ios,
      "iconColor": Colors.white
    },
    {
      "title": "Imagine",
      "lottie": "assets/lottie/42070-travel-is-fun.json",
      "subtitle": "An endless number of galaxies means endless possibilities.",
      "icon": Icons.arrow_forward_ios,
      "iconColor": Colors.white
    },
    {
      "title": "Stargaze",
      "lottie": "assets/lottie/69849-travel.json",
      "subtitle": "The sky dome is a beautiful graveyard of stars.",
      "icon": Icons.arrow_forward_ios,
      "iconColor": Colors.white
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ConcentricPageView(
            radius: 45,
            onFinish: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChoiceScreen(),
                ),
              );
            },
            physics: const BouncingScrollPhysics(),
            colors: const [Colors.purple, Colors.orange, Colors.brown],
            itemCount: onBoardingList.length,
            itemBuilder: (int index, double value) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 3),
                        Flexible(
                          flex: 20,
                          child: SizedBox(
                            height: size.height / 3,
                            width: size.width / 1.5,
                            child: Lottie.asset(
                                "${onBoardingList[index]["lottie"]}"),
                          ),
                        ),
                        const Spacer(flex: 1),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "${onBoardingList[index]["title"]}",
                              textStyle: TextStyle(
                                  fontFamily: "Pacifico",
                                  color: Colors.white,
                                  fontSize: size.width * 0.090,
                                  fontWeight: FontWeight.w600),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                        ),
                        const Spacer(flex: 1),
                        Text(
                          "${onBoardingList[index]["subtitle"]}",
                          style: const TextStyle(
                            fontFamily: "Fredoka_One",
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        const Spacer(flex: 7),
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.093),
                          child: Icon(
                            onBoardingList[index]["icon"],
                            color: onBoardingList[index]["iconColor"],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
