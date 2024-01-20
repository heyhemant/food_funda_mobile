import 'package:food_funda_business/services/auth_services/auth_services.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  RxBool isFormValid = false.obs;
  RxnString error = RxnString(null);
  RxnString otp = RxnString(null);
  RxBool isLoading = false.obs;
  
  Future<MapEntry<bool, String?>> loginWithGmail()async{
    
    isLoading.value = true;
    await Get.find<AuthServices>().signInWithGoogle();
    isLoading.value = false;
    if(Get.find<AuthServices>().isUserLoggedIn()){
      return const MapEntry(true, null);
      }else{
      return const MapEntry(false, 'Something went wrong');
      }
  }
}
