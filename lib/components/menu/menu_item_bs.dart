import 'package:flutter/material.dart';
import 'package:food_funda_business/components/common/models/menu_model.dart';

// ignore: must_be_immutable
class MenuItemEditBS extends StatefulWidget {
  MenuItem menuItem;
  MenuItemEditBS({super.key, required this.menuItem});

  @override
  State<MenuItemEditBS> createState() => _MenuItemEditBSState();
}

class _MenuItemEditBSState extends State<MenuItemEditBS> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  widget.menuItem.itemImage ??
                      'https://picsum.photos/250?image=9',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item Name',
              ),
              controller: TextEditingController(text: widget.menuItem.itemName),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item Description',
              ),
              controller:
                  TextEditingController(text: widget.menuItem.itemDescription),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item Price',
              ),
              controller: TextEditingController(
                  text: widget.menuItem.itemPrice.toString()),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Is Veg'),
                const Spacer(),
                Switch(
                  value: widget.menuItem.isVeg ?? false,
                  onChanged: (value) {
                    setState(() {
                      widget.menuItem.isVeg = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text('Is Available'),
                const Spacer(),
                Switch(
                  value: widget.menuItem.isAvailable ?? false,
                  onChanged: (value) {
                    setState(() {
                      widget.menuItem.isAvailable = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
