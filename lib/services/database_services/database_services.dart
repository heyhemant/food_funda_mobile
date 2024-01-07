

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_funda_business/components/common/models/restruant_model.dart';
import 'package:food_funda_business/components/common/models/menu_model.dart';
import 'package:food_funda_business/components/common/models/order_model.dart' as UserOrder;


class DatabaseServices {
  static final DatabaseServices _instance = DatabaseServices._internal();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  factory DatabaseServices() {
    return _instance;
  }

  DatabaseServices._internal();

    // Create User
  Future<bool> createUser({required Restaurant restaurant}) async {
    try{
      const String collection = 'restaurants';
    final String id = restaurant.uuid!;
    final Map<String, dynamic> data = restaurant.toJson();
    await _db.collection(collection).doc(id).set(data);
    return true;
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return false;
    }
  }

  // Read User
  Future<Restaurant?> readUser({required String uuid}) async {
    try{
      const String collection = 'restaurants';
    final DocumentSnapshot doc = await _db.collection(collection).doc(uuid).get();
    return Restaurant.fromJson(doc.data() as Map<String, dynamic>);
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return null;
    }
  }

  // Update User
  Future<bool> updateUser({required Restaurant restaurant}) async {
    try{
      const String collection = 'restaurants';
    final String id = restaurant.uuid!;
    final Map<String, dynamic> data = restaurant.toJson();
    await _db.collection(collection).doc(id).update(data);
    return true;
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return false;
    }
  }

  // Delete User
  Future<bool> deleteUser({required String uuid}) async {
    try{
      const String collection = 'restaurants';
    await _db.collection(collection).doc(uuid).delete();
    return true;
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return false;
    }
  }

  // Create Menu
  Future<bool> createMenu({required Menu menu}) async {
    try{
      const String collection = 'menus';
    final String id = menu.restaurantId!;
    final Map<String, dynamic> data = menu.toJson();
    await _db.collection(collection).doc(id).set(data);
    return true;
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return false;
    }
  }

  // Read Menu
  Future<Menu?> readMenu({required String uuid}) async {
    try{
      const String collection = 'menus';
    final DocumentSnapshot doc = await _db.collection(collection).doc(uuid).get();
    return Menu.fromJson(doc.data() as Map<String, dynamic>);
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return null;
    }
  }

  // Update Menu
  Future<bool> updateMenu({required Menu menu}) async {
    try{
      const String collection = 'menus';
    final String id = menu.restaurantId!;
    final Map<String, dynamic> data = menu.toJson();
    await _db.collection(collection).doc(id).update(data);
    return true;
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return false;
    }
  }

  //read orders
  Future<List<UserOrder.Order>> readOrder({required String uuid}) async {
    try{
    final String collection = 'orders-$uuid';
    final QuerySnapshot querySnapshot = await _db.collection(collection).get();
    final List<UserOrder.Order> orders = <UserOrder.Order>[];
    for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
      orders.add(UserOrder.Order.fromJson(doc.data() as Map<String, dynamic>));
    }
    return orders;
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return <UserOrder.Order>[];
    }
  }
}
