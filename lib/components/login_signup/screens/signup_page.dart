import 'package:flutter/material.dart';
import 'package:food_funda_business/components/login_signup/controllers/signup_controller.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late SignupPageController controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = Get.put(SignupPageController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Obx(
                () => TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                        labelText: 'Resturant',
                        errorText: controller.nameError.value)),
              ),
              Obx(() => TextFormField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        counterText: '',
                        errorText: controller.phoneError.value),
                  )),
              Obx(
                () => TextFormField(
                    controller: controller.addresssController,
                    decoration: InputDecoration(
                        labelText: 'Address',
                        errorText: controller.addressError.value)),
              ),
              Obx(
                () => TextFormField(
                    controller: controller.cityController,
                    decoration: InputDecoration(
                        labelText: 'City',
                        errorText: controller.cityError.value)),
              ),
              Obx(
                () => TextFormField(
                    controller: controller.pincodeController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                        labelText: 'Pincode',
                        counterText: '',
                        errorText: controller.pincodeError.value)),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  _formKey.currentState!.save();
                  final res = await controller.registerRestaurant();
                  if (res.first) {
                    await Get.dialog(
                      AlertDialog(
                        title: const Text('Success'),
                        content: const Text('Restaurant Registered'),
                        actions: [
                          TextButton(
                            onPressed: () {
                             
                            },
                            child: const Text('Ok'),
                          )
                        ],
                      ),
                    );
                  } else {
                    Get.snackbar('Error', res.second);
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
