import 'package:get/state_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CommonController extends GetxController {
  RxBool isUserLoggedIn = false.obs;
  String? authToken;
  FlutterSecureStorage? secureStorage;

  @override
  void onInit() async{
    secureStorage = const FlutterSecureStorage();
    await updateLoginStatus();
    super.onInit();
  }

  Future<void> updateLoginStatus() async {
    secureStorage ??= const FlutterSecureStorage();
    authToken = await secureStorage!.read(key: 'auth_token');
    if (authToken != null) {
      isUserLoggedIn.value = true;
    } else {
      isUserLoggedIn.value = false;
    }
  }

  Future<void> logout() async {
    secureStorage ??= const FlutterSecureStorage();
    try{
      await secureStorage!.delete(key: 'auth_token');
    }
    catch(e){
      // ignore: avoid_print
      print('ha bhai error $e');
    }
    authToken = null;
    isUserLoggedIn.value = false;
  }

  Future<bool> updateAuthToken(String? token) async {
    if(token == null) {
      logout();
      return false;
    }
    secureStorage ??= const FlutterSecureStorage();
    await secureStorage!.write(key: 'auth_token', value: token);
    authToken = token;
    isUserLoggedIn.value = true;
    return true;
  }
}
