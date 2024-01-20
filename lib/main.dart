import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_funda_business/components/common/common_controller.dart';
import 'package:food_funda_business/components/common/remote_config/remot_config.dart';
import 'package:food_funda_business/services/auth_services/auth_services.dart';
import 'package:food_funda_business/components/home_page/app_root.dart';
import 'package:food_funda_business/components/login_signup/screens/login_screen.dart';
import 'package:food_funda_business/firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AuthServices authServices = AuthServices();
  Get.put(authServices, permanent: true);
  await authServices.updateLoginStatus();
  await RemoteConfig().fetchConfig();
  Get.put(CommonController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMaintenanceMode = false;

  @override
  void initState() {
    super.initState();
    isMaintenanceMode = Get.find<CommonController>()
            .remoteConfig
            .configModel
            .miantainanceMode ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Obx(() {
        if (isMaintenanceMode) {
          return const Scaffold(
            body: Center(
              child: Text("Maintainance"),
            ),
          );
        } else {
          return Get.find<AuthServices>().isUserLoggedIn() ? const AppRoot() : const LoginPage();
        }
      }),
    );
  }
}
