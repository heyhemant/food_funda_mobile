import 'package:flutter/material.dart';
import 'package:food_funda_business/components/common/common_ui/color_funda.dart';
import 'package:food_funda_business/components/common/common_ui/text_funda.dart';
import 'package:food_funda_business/components/home_page/home_page.dart';
import 'package:food_funda_business/components/login_signup/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LogInController loginController;

  @override
  initState() {
    loginController = LogInController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: ColorFunda().secondaryBlack,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text("Let's get started",
                      style: TextStyleFunda().loginHeaderStyle),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:30.0),
                    child: ElevatedButton(
                      onPressed: () async {
                          MapEntry<bool, String?> response = await loginController.loginWithGmail();
                          if (response.key) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage()
                              ),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(response.value ?? 'Something went wrong',),
                              ),
                            );
                          }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorFunda().primaryWhite,
                        shadowColor: Colors.transparent,
                        minimumSize: const Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/logos/google_logo.png', height: 35, width: 35,),
                          const SizedBox(width: 20,),
                          Text(
                            'Sign in with Google',
                            style: TextStyleFunda().buttonTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )));
  }
}
