import 'package:adventure_ui_demo/Authantication/google_auth.dart';
import 'package:adventure_ui_demo/model/prefrence_utils.dart';
import 'package:adventure_ui_demo/screen/choice_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? loginEmail;
  String? loginPassword;

  List loginDetails = [];

  getValue() {
    print("111");
    loginDetails = PreferenceUtils.getListOfString("information");
    print("222");
    print(loginDetails);
    loginEmail = loginDetails.isEmpty ? "" : loginDetails[2];
    print(loginEmail);
    loginPassword = loginDetails.isEmpty ? "" : loginDetails[3];
    print(loginPassword);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PreferenceUtils.init();
    getValue();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.color),
                    fit: BoxFit.fill,
                    image: const AssetImage("assets/image/login.jpeg"),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.030,
                left: size.width * 0.060,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(type: PageTransitionType.leftToRight, child: const ChoiceScreen(), inheritTheme: true, ctx: context),
                    );
                  },
                  child: CircleAvatar(
                    radius: size.height * 0.020,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: size.height * 0.023,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Log in",
                      style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "set up your adventure",
                      style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      validator: (value) {
                        if (emailController.value.text.isEmpty) {
                          return "Please enter an email";
                        } else {
                          if (emailController.value.text != loginDetails[2]) {
                            return "Invalid Email";
                          }
                        }
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (passwordController.text.isEmpty) {
                          return "Please enter a password";
                        } else if (passwordController.value.text != loginDetails[3]) {
                          return "Password was incorrect";
                        }
                      },
                      controller: passwordController,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.075, vertical: size.height * 0.03),
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
                        if (_formKey.currentState!.validate() &&
                            emailController.text == loginDetails[2] &&
                            passwordController.text == loginDetails[3]) {
                          PreferenceUtils.setBoolValue("isLoggedIn", true);
                          Navigator.pushReplacement(
                            context,
                            PageTransition(type: PageTransitionType.rightToLeft, child: const BottomBar(), inheritTheme: true, ctx: context),
                          );
                        }
                      },
                      child: const Text("LOG IN"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Image(
                            image: AssetImage("assets/image/facebook.png"),
                          ),
                        ),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.6)),
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoogleAuthRepo.signInWithGoogleRepo(context);
                        },
                        child: Container(
                          height: 65,
                          width: 65,
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Image(
                              image: AssetImage("assets/image/google.png"),
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
