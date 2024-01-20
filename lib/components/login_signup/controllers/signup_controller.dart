import 'package:flutter/material.dart';
import 'package:food_funda_business/components/common/models/pair_model.dart';
import 'package:food_funda_business/components/common/models/restruant_model.dart';
import 'package:food_funda_business/components/home_page/home_controller.dart';
import 'package:food_funda_business/services/auth_services/auth_services.dart';
import 'package:food_funda_business/services/database_services/database_services.dart';
import 'package:get/get.dart';

class SignupPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addresssController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  RxnString nameError = RxnString();
  RxnString phoneError = RxnString();
  RxnString addressError = RxnString();
  RxnString cityError = RxnString();
  RxnString pincodeError = RxnString();

  Location getLocation() {
    return Location(
      address: addresssController.text,
      city: cityController.text,
      pincode: pincodeController.text,
    );
  }

  void clearControllers() {
    nameController.clear();
    phoneController.clear();
    addresssController.clear();
    cityController.clear();
    pincodeController.clear();
  }

  void disposeControllers() {
    nameController.dispose();
    phoneController.dispose();
    addresssController.dispose();
    cityController.dispose();
    pincodeController.dispose();
  }

  void _validateName() {
    if (nameController.text.isEmpty || nameController.text.length < 3) {
      nameError.value = 'Please enter valid name';
    } else {
      nameError.value = null;
    }
  }

  void _validatePhone() {
    if (phoneController.text.isEmpty) {
      phoneError.value = 'Please enter phone number';
    } else if (phoneController.text.length != 10) {
      phoneError.value = 'Please enter valid phone number';
    } else if (!phoneController.text.isNum) {
      phoneError.value = 'Please enter valid phone number';
    } else {
      phoneError.value = null;
    }
  }

  void _validateAddress() {
    if (addresssController.text.isEmpty) {
      addressError.value = 'Please enter address';
    } else {
      addressError.value = null;
    }
  }

  void _validateCity() {
    if (cityController.text.isEmpty) {
      cityError.value = 'Please enter city';
    } else {
      cityError.value = null;
    }
  }

  void _validatePincode() {
    if (pincodeController.text.isEmpty) {
      pincodeError.value = 'Please enter pincode';
    } else if (pincodeController.text.length != 6 ||
        !pincodeController.text.isNum) {
      pincodeError.value = 'Please enter valid pincode';
    } else {
      pincodeError.value = null;
    }
  }

  void _validateForm() {
    _validatePhone();
    _validateName();
    _validateAddress();
    _validatePincode();
    _validateCity();
  }

  Future<Pair<bool, String>> registerRestaurant() async {
    _validateForm();
    if (nameError.value != null ||
        phoneError.value != null ||
        addressError.value != null ||
        cityError.value != null ||
        pincodeError.value != null) {
      return Pair(false, 'Please enter valid details');
    }
    String? uuid = Get.find<AuthServices>().user.value?.uid;
    String? email = Get.find<AuthServices>().user.value?.email;
    if (uuid == null || email == null) {
      return Pair(false, 'Please login to register your restaurant');
    }
    String name = nameController.text;
    String phone = phoneController.text;
    Location location = getLocation();

    Restaurant restaurant = Restaurant(
      uuid: uuid,
      name: name,
      phoneNumber: phone,
      location: location,
      email: email,
    );
    bool result = await DatabaseServices().createDoc(
      collection: 'restaurants',
      id: uuid,
      data: restaurant.toJson(),
    );
    if (result) {
      await Get.find<HomePageController>().isUserRegisteredCheck();
      return Pair(true, 'Restaurant registered successfully');
    } else {
      return Pair(false, 'Something went wrong');
    }
  }
}
