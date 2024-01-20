import 'package:flutter/material.dart';
import 'package:food_funda_business/components/home_page/home_controller.dart';
import 'package:food_funda_business/components/order_details.dart/order_details_screen.dart';
import 'package:food_funda_business/components/user_profile/user_profile_screen.dart';
import 'package:food_funda_business/services/auth_services/auth_services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomePageController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserProfileScreen()));
                    },
                    child: Image.network(
                      controller.restaurant.value?.imageUrl ??
                          Get.find<AuthServices>().user.value?.photoURL ??
                          '',
                      width: 45.0,
                      height: 45.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.restaurant.value?.name ?? '',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      Get.find<AuthServices>().user.value?.displayName ?? '',
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    //TODO: Add onTap Functionality
                  },
                  iconSize: 25,
                  icon: const Icon(Icons.help_rounded),
                ),
              ],
            )),
        ListView(shrinkWrap: true, children: [
          ...controller.orders.map((e) => ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailsScreen(order: e)));
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.customerName ?? ''),
                    Text('\u20B9 ${e.orderValue ?? ''}'),
                  ],
                ),
                subtitle: Text(e.orderDate ?? ''),
                trailing: Text(e.orderStatus ?? ''),
              ))
        ])
      ]),
    );
  }
}
