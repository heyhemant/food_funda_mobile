
class Order{
  String? customerName;
  String? customerPhone;
  String? restaurantId;
  String? restaurantName;
  String? orderId;
  num? orderValue;
  String? orderStatus;
  String? orderDate;
  List<OederItem>? orderItems;

  Order({
    this.customerName,
    this.customerPhone,
    this.restaurantId,
    this.restaurantName,
    this.orderId,
    this.orderValue,
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
    orderValue = json['order_vlaue'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    if (json['order_items'] != null) {
      orderItems = <OederItem>[];
      json['order_items'].forEach((v) {
        orderItems!.add(OederItem.fromJson(v));
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
    data['order_vlaue'] = orderValue;
    data['order_status'] = orderStatus;
    data['order_date'] = orderDate;
    if (orderItems != null) {
      data['order_items'] = orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OederItem{
  String? itemName;
  String? variation;
  num? itemPrice;
  num? itemQuantity;


  OederItem({
    this.itemName,
    this.variation,
    this.itemPrice,
    this.itemQuantity,
  });

  OederItem.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    variation = json['variation'];
    itemPrice = json['item_price'];
    itemQuantity = json['item_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_name'] = itemName;
    data['variation'] = variation;
    data['item_price'] = itemPrice;
    data['item_quantity'] = itemQuantity;
    return data;
  }
}