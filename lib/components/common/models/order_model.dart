import 'package:food_funda_business/components/common/models/menu_model.dart';

class Order{
  String? customerName;
  String? customerPhone;
  String? restaurantId;
  String? restaurantName;
  String? orderId;
  num? orderVlaue;
  String? orderStatus;
  String? orderDate;
  List<MenuItem>? orderItems;

  Order({
    this.customerName,
    this.customerPhone,
    this.restaurantId,
    this.restaurantName,
    this.orderId,
    this.orderVlaue,
    this.orderStatus,
    this.orderDate,
    this.orderItems,
  });

  Order.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    restaurantId = json['restaurant_id'];
    restaurantName = json['restaurant_name'];
    orderId = json['order_id'];
    orderVlaue = json['order_vlaue'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    if (json['order_items'] != null) {
      orderItems = <MenuItem>[];
      json['order_items'].forEach((v) {
        orderItems!.add(MenuItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['restaurant_id'] = restaurantId;
    data['restaurant_name'] = restaurantName;
    data['order_id'] = orderId;
    data['order_vlaue'] = orderVlaue;
    data['order_status'] = orderStatus;
    data['order_date'] = orderDate;
    if (orderItems != null) {
      data['order_items'] = orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}