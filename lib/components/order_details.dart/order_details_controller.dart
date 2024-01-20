import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_funda_business/components/common/constants/constants.dart';
import 'package:food_funda_business/components/home_page/home_controller.dart';
import 'package:food_funda_business/components/order_details.dart/order_model.dart'
    as order_model;
import 'package:get/get.dart';

class OrderDetailsController {
  final order_model.Order order;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  OrderDetailsController({required this.order});

  Future<bool> updateOrderStatus(OrderStatus status) async {
    try {
      String newStatus = Const.orderStatusMap[status] ?? '';
      String uuid = Get.find<HomePageController>().restaurant.value?.uuid ?? '';
      await _firestore
          .collection(
              'orders-$uuid')
          .doc(order.orderId)
          .update({
        'status': newStatus,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
