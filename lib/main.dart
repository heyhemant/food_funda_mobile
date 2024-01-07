import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_funda_business/components/common/auth_controller.dart';
import 'package:food_funda_business/components/home_page/home_page.dart';
import 'package:food_funda_business/components/login_signup/screens/login_screen.dart';
import 'package:food_funda_business/firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Obx(
          () => Get.find<AuthController>().isUserLoggedIn.value
              ? const HomePage()
              : const LoginPage(),
        ));
  }
}
