class Menu{
  String? restaurantId;
  List<MenuItem>? menuItems;

  Menu({
    this.restaurantId,
    this.menuItems,
  });

  Menu.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    if (json['menu_items'] != null) {
      menuItems = <MenuItem>[];
      json['menu_items'].forEach((v) {
        menuItems!.add(MenuItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant_id'] = restaurantId;
    if (menuItems != null) {
      data['menu_items'] = menuItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuItem{
  String? itemId;
  String? itemName;
  String? itemDescription;
  num? itemPrice;
  String? itemImage;
  bool isVeg = false;
  bool isAvailable = false;

  MenuItem({
    this.itemId,
    this.itemName,
    this.itemDescription,
    this.itemPrice,
    this.itemImage,
    this.isVeg = false,
    this.isAvailable = false,
  });

  MenuItem.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemDescription = json['item_description'];
    itemPrice = json['item_price'];
    itemImage = json['item_image'];
    isVeg = json['is_veg'];
    isAvailable = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_description'] = itemDescription;
    data['item_price'] = itemPrice;
    data['item_image'] = itemImage;
    data['is_veg'] = isVeg;
    data['available'] = isAvailable;
    return data;
  }
}