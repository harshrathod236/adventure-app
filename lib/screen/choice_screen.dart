import 'package:adventure_ui_demo/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login_screen.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.color),
                  fit: BoxFit.fill,
                  image: const AssetImage("assets/image/main.jpeg"),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: size.height * 0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.orange.withOpacity(0.7),
                    fixedSize: Size(size.width, size.height * 0.075),
                    textStyle: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const LoginScreen(),
                        inheritTheme: true,
                        ctx: context,
                      ),
                    );
                  },
                  child: const Text("LOG IN"),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: size.height * 0.05,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(style: BorderStyle.solid, color: Colors.orange),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.transparent,
                    fixedSize: Size(size.width, size.height * 0.075),
                    textStyle: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.rightToLeft, child: const SignupScreen(), inheritTheme: true, ctx: context),
                    );
                  },
                  child: Text("SIGN UP"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
