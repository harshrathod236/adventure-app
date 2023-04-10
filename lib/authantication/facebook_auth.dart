import 'package:adventure_ui_demo/constant/const.dart';
import 'package:adventure_ui_demo/screen/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthRepo {
  Future<void> signInWithFacebookRepo(BuildContext context) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    print(loginResult.accessToken!.token);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    UserCredential result =
        await kFirebaseAuth.signInWithCredential(facebookAuthCredential);

    if (result != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ),
      );
    }
  }

  // static Future facebookLogOutRepo() async {
  //   kFacebookAuth.logOut();
  // }
}
