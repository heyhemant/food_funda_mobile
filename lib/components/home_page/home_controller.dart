import 'package:food_funda_business/components/order_details.dart/order_model.dart';
import 'package:food_funda_business/components/common/models/restruant_model.dart';
import 'package:food_funda_business/services/auth_services/auth_services.dart';
import 'package:food_funda_business/services/database_services/database_services.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool isUserRegistered = false.obs;
  RxBool isLoading = false.obs;
  Rx<Restaurant?> restaurant = Rx<Restaurant?>(null);

  @override
  void onInit() async{
    isLoading.value = true;
    await isUserRegisteredCheck();
    super.onInit();
    isLoading.value = false;
  }

  Future<void> _readUser({required String uuid}) async {
    Map<String, dynamic>? response = await
        DatabaseServices().readDoc(collection: 'restaurants', docId: uuid);
    if (response != null && response != {}){
      restaurant.value = Restaurant.fromJson(response);
    }    
  }

  Future<void> isUserRegisteredCheck() async {
    if(Get.find<AuthServices>().user.value == null){
      return;
    }
    await _readUser(uuid: Get.find<AuthServices>().user.value?.uid ?? '');
    isUserRegistered.value = restaurant.value != null;
  }

  List<Order> orders = [
    Order(
      customerName: 'Hemant Kumar',
      customerPhone: '8094820068',
      restaurantId: '123',
      restaurantName: 'Ramdev Dhaba',
      orderValue: 800,
      orderId: '5',
      orderStatus: 'pending',
      orderDate: '12-01-2023',
      orderItems: [
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
      ]
    ),
    Order(
      customerName: 'Ali Kumar Meena',
      customerPhone: '8094820068',
      restaurantId: '123',
      restaurantName: 'Ramdev Dhaba',
      orderValue: 800,
      orderId: '5',
      orderStatus: 'approved',
      orderDate: '12-01-2023',
      orderItems: [
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
      ]
    ),
    Order(
      customerName: 'Hemant Kumar',
      customerPhone: '8094820068',
      restaurantId: '123',
      restaurantName: 'Ramdev Dhaba',
      orderValue: 800,
      orderId: '5',
      orderStatus: 'rejected',
      orderDate: '12-01-2023',
      orderItems: [
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
      ]
    ),
    Order(
      customerName: 'Ali Kumar Meena',
      customerPhone: '8094820068',
      restaurantId: '123',
      restaurantName: 'Ramdev Dhaba',
      orderValue: 800,
      orderId: '5',
      orderStatus: 'completed',
      orderDate: '12-01-2023',
      orderItems: [
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
        OederItem(
          itemName: 'Dal bati',
          variation: 'Extra Ghee',
          itemPrice: 70,
          itemQuantity: 2
        ),
      ]
    )
  ];
}
