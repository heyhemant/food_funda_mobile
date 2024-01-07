import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isUserLoggedIn = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onInit() async {
    await updateLoginStatus();
    super.onInit();
  }

  Future<void> updateLoginStatus() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        isUserLoggedIn.value = true;
      } else {
        isUserLoggedIn.value = false;
      }
    } catch (e) {
      isUserLoggedIn.value = false;
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
