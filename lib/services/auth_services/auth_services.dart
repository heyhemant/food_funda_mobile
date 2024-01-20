import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<User?> user = Rx(null);

  bool isUserLoggedIn() {
    return user.value != null;
  }

  @override
  void onInit() async {
    await updateLoginStatus();
    super.onInit();
  }

  Future<void> updateLoginStatus() async {
    try {
      await _auth.currentUser?.reload();
      user.value = _auth.currentUser;
    } catch (e) {
      user.value = null;
      if (kDebugMode) {
        print('food funda error ${e.toString()}');
      }
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
      await updateLoginStatus();
    } catch (e) {
      if (kDebugMode) {
        print('food funda error ${e.toString()}');
      }
      await updateLoginStatus();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);
      await updateLoginStatus();
    } catch (e) {
      if (kDebugMode) {
        print('food funda error ${e.toString()}');
      }
    }
  }
}
