import 'package:flutter/material.dart';
import 'package:food_funda_business/components/home_page/home_controller.dart';
import 'package:food_funda_business/components/home_page/home_screen.dart';
import 'package:food_funda_business/components/login_signup/screens/signup_page.dart';
import 'package:get/get.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late HomePageController controller;
  @override
  void initState() {
    controller = Get.put(HomePageController()); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Add Loader Shimmer
      body: Obx(()=>SafeArea(
          child: controller.isUserRegistered.value
              ? const HomeScreen()
              : const SignupPage())),
    );
  }
}
