import 'package:adventure_ui_demo/constant/const.dart';
import 'package:adventure_ui_demo/screen/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthRepo {
  static Future signInWithGoogleRepo(BuildContext context) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    UserCredential result = await kFirebaseAuth.signInWithCredential(credential);
    User? user = result.user;
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please sign in again"),
        ),
      );
    }
  }

  static Future googleSignOutRepo() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
    return googleUser;
  }
}
