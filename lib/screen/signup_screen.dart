import 'package:adventure_ui_demo/model/prefrence_utils.dart';
import 'package:adventure_ui_demo/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

List signUpDetails = [];

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  setValue() {
    PreferenceUtils.init();
    PreferenceUtils.setListOfString("information", [
      signUpDetails[0],
      signUpDetails[1],
      signUpDetails[2],
      signUpDetails[3],
    ]);
    print(signUpDetails[0]);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.color),
                  fit: BoxFit.cover,
                  image: const AssetImage("assets/image/sign.jpeg"),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.030,
              left: size.width * 0.060,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: size.height * 0.020,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.height * 0.023,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "set up your adventure",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: firstController,
                          validator: (value) {
                            if (firstController.text.isEmpty) {
                              return "Please enter firstname";
                            }
                          },
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "First name",
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
                          validator: (value) {
                            if (lastController.text.isEmpty) {
                              return "Please enter lastname";
                            }
                          },
                          controller: lastController,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Last name",
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
                          validator: (value) {
                            if (emailController.text.isEmpty) {
                              return "Please enter email";
                            } else {
                              if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(emailController.text)) {
                                return "please enter valid email";
                              }
                            }
                          },
                          controller: emailController,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Username",
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
                          validator: (value) {
                            if (passwordController.text.isEmpty) {
                              return "Please enter password";
                            } else {
                              if (passwordController.value.text.length < 6) {
                                return "please enter minimum 6 character";
                              }
                            }
                          },
                          obscureText: true,
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
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (confirmPasswordController.text.isEmpty) {
                              return "Please enter confirm password";
                            } else {
                              if (confirmPasswordController.text ==
                                  passwordController.text) {
                              } else {
                                return "password doesn't match ";
                              }
                            }
                          },
                          controller: confirmPasswordController,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.075,
                            vertical: size.height * 0.03),
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
                            if (_formKey.currentState!.validate()) {
                              signUpDetails.addAll([
                                firstController.text,
                                lastController.text,
                                emailController.text,
                                passwordController.text,
                              ]);
                              setValue();
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: const LoginScreen(),
                                    inheritTheme: true,
                                    ctx: context),
                              );
                            }

                            // Navigator.push(
                            //   context,
                            //   PageTransition(
                            //       type: PageTransitionType.leftToRight,
                            //       child: const LoginScreen(),
                            //       inheritTheme: true,
                            //       ctx: context),
                            // );
                          },
                          child: const Text("REGISTER"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
