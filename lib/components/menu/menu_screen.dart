import 'package:flutter/material.dart';
import 'package:food_funda_business/components/common/models/restruant_model.dart';
import 'package:food_funda_business/components/menu/menu_controller.dart';
import 'package:food_funda_business/components/menu/menu_item_bs.dart';

import '../common/models/menu_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuScreenController controller = MenuScreenController(
      restaurant: Restaurant(uuid: null, name: 'Ramdev Dhaba'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.restaurant.name ?? ''} Menu",
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.menu.menuItems?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                controller.menu.menuItems?[index].itemImage ??
                                    'https://picsum.photos/250?image=9',
                                width: 55.0,
                                height: 55.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                                controller.menu.menuItems?[index].itemName ??
                                    'Daal Bati'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.menu.menuItems?[index]
                                        .itemDescription ??
                                    'Extra Ghee'),
                                Text((controller
                                            .menu.menuItems?[index].itemPrice ??
                                        150)
                                    .toString()),
                                Row(
                                  children: [
                                    Text(controller
                                                .menu.menuItems?[index].isVeg ??
                                            false
                                        ? 'Veg'
                                        : 'Non-Veg'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(controller.menu.menuItems?[index]
                                                .isAvailable ??
                                            false
                                        ? 'Available'
                                        : 'Not Available'),
                                  ],
                                )
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return MenuItemEditBS(menuItem: controller.menu.menuItems?[index] ?? MenuItem());
                                    });
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
