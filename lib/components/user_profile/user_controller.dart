import 'package:food_funda_business/components/common/models/restruant_model.dart';
import 'package:food_funda_business/components/home_page/home_controller.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  late Restaurant restaurant;

  @override
  void onInit() {
    restaurant = Get.find<HomePageController>().restaurant.value!;
    super.onInit();
  }
}