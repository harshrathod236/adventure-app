import 'package:adventure_ui_demo/screen/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderCompleteScreen extends StatefulWidget {
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  _OrderCompleteScreenState createState() => _OrderCompleteScreenState();
}

class _OrderCompleteScreenState extends State<OrderCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 4.5, width: size.width / 2, child: Lottie.asset("assets/lottie/4460-complete.json", fit: BoxFit.cover)),
              const Text(
                "Trip Complete",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child: const Text(
                  "Your Trip have been taken and is\n being attended to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              ElevatedButton(
                child: const Text(
                  'Continue Trip',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.orange),
                ),
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const BottomBar(),
                  //     ));

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const BottomBar(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffFCF6F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(
                    size.width / 1.5,
                    size.height * 0.070,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
