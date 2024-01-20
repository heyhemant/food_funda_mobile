

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:food_funda_business/components/common/models/restruant_model.dart';
import 'package:food_funda_business/components/common/models/menu_model.dart';
import 'package:food_funda_business/components/order_details.dart/order_model.dart' as UserOrder;


class DatabaseServices {
  static final DatabaseServices _instance = DatabaseServices._internal();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  factory DatabaseServices() {
    return _instance;
  }

  DatabaseServices._internal();


  Future<bool> createDoc({required String collection, required String id, required Map<String, dynamic> data}) async {
    try{
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

  Future<bool> updateDoc({required String collection, required String id, required Map<String, dynamic> data}) async {
    try{
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

  Future<bool> deleteDoc({required String collection, required String id}) async {
    try{
    await _db.collection(collection).doc(id).delete();
    return true;
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return false;
    }
  }

  Future<Map<String, dynamic>?> readDoc({required String collection, required String docId}) async {
    try{
    final DocumentSnapshot doc = await _db.collection(collection).doc(docId).get();
    return doc.data() as Map<String, dynamic>;
    }
    catch (e){
      if (kDebugMode) {
        print('Food Funda error ${e.toString()}');
      }
      return null;
    }
  }


    // Create User
  Future<bool> createUser({required Restaurant restaurant}) async {
    bool result = await createDoc(collection: 'restaurants', id: restaurant.uuid!, data: restaurant.toJson());
    return result;
  }
  Future<bool> updateUserProfile({required Restaurant restaurant}) async {
    final Map<String, dynamic> data = restaurant.toJson();
    final String? id = restaurant.uuid;
    if(id == null) {
      return false;
    }
    bool result = await updateDoc(collection: 'restaurants', id: id, data: data);
    return result;
  }

  Future<bool> deleteUserProfile({required String uuid}) async {
    bool result = await deleteDoc(collection: 'restaurants', id: uuid);
    return result;
  }

  Future<bool> createMenu({required Menu menu})async{
    final data = menu.toJson();
    final String? id = menu.restaurantId;
    if(id == null){
      return Future.value(false);
    }
    return await createDoc(collection: 'menus', id: id, data: data);
  }

  Future<bool> deleteMenu({required String uuid}) async {
    const String collection = 'menus';
    bool result = await deleteDoc(collection: collection, id: uuid);
    return result;
  }

  // Future<Menu?> readMenu({required String uuid}) async {
  //   const String collection = 'menus';
  //   Future<Map<String, dynamic>?> response = readDoc(collection: collection, docId: uuid);
  //   Menu? menu = Menu.fromJson(await response);
  //   return menu;
  // }

  //update menu
  Future<bool> updateMenu({required Menu menu})async{
    final data = menu.toJson();
    final String? id = menu.restaurantId;
    if(id == null){
      return Future.value(false);
    }
    return await updateDoc(collection: 'menus', id: id, data: data);
  }

//  Future<List<UserOrder.Order>> readOrder({required String uuid}) async {
//   try{
//     final String collection = 'orders-$uuid';
//   final response = await readDoc(collection: collection, docId: uuid);
//   final List<UserOrder.Order> orders = <UserOrder.Order>[];
//   for (final order  in response[0]) {
//     orders.add(UserOrder.Order.fromJson(order as Map<String, dynamic>));
//   }
//   return orders;
//   }
//   catch (e){
//     if (kDebugMode) {
//       print('Food Funda error ${e.toString()}');
//     }
//     return <UserOrder.Order>[];
//   }
//  }

}
