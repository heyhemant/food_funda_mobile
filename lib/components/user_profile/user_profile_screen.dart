import 'package:flutter/material.dart';
import 'package:food_funda_business/components/menu/menu_screen.dart';
import 'package:food_funda_business/components/user_profile/user_controller.dart';
import 'package:food_funda_business/services/auth_services/auth_services.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late UserController controller;

  @override
  void initState() {
    controller = Get.put(UserController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    controller.restaurant.imageUrl ??
                        Get.find<AuthServices>().user.value?.photoURL ??
                        '',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  controller.restaurant.name ?? '',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(
                height: 35,
              ),
              const Text(
                'Restaurant Details',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Restaurant Name',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.restaurant.name ?? '',
                    style:
                        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Restaurant Address',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.restaurant.location?.address ?? '',
                    style:
                        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Restaurant Phone',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.restaurant.phoneNumber ?? '',
                    style:
                        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Restaurant Email',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.restaurant.email ?? '',
                    style:
                        const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MenuScreen()));
                    }, child: 
                    const Text("View Menu")
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed:  ()async{
                        //TODO: Fix logout bug
                        await Get.find<AuthServices>().logout();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      }, child: 
                    const Text("Logout")
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
