import 'package:food_funda_business/components/common/models/menu_model.dart';
import 'package:food_funda_business/components/common/models/restruant_model.dart';
import 'package:get/get.dart';

class MenuScreenController extends GetxController{
  final Restaurant restaurant;
  late Menu menu;
  bool isMenuUpdated = false;
  MenuScreenController({required this.restaurant}){
    menu = restaurant.menu ?? Menu(restaurantId: restaurant.uuid, menuItems: []);
    menu.menuItems = [
      MenuItem(
        itemId: '1',
        itemName: 'Daal Bati',
        itemDescription: 'Daal Bati is a traditional Rajasthani dish. It is a hard bread made up of wheat flour, cooked in a tandoor (oven) and served with ghee and panchmel daal.',
        itemImage: 'https://picsum.photos/250?image=9',
        itemPrice: 100,
        isVeg: true,
        isAvailable: true,
      ),
      MenuItem(
        itemId: '2',
        itemName: 'Daal Bati',
        itemDescription: 'Daal Bati is a traditional Rajasthani dish. It is a hard bread made up of wheat flour, cooked in a tandoor (oven) and served with ghee and panchmel daal.',
        itemImage: 'https://picsum.photos/250?image=9',
        itemPrice: 100,
        isVeg: false,
        isAvailable: true,
      ),
      MenuItem(
        itemId: '3',
        itemName: 'Daal Bati',
        itemDescription: 'Daal Bati is a traditional Rajasthani dish. It is a hard bread made up of wheat flour, cooked in a tandoor (oven) and served with ghee and panchmel daal.',
        itemImage: 'https://picsum.photos/250?image=9',
        itemPrice: 100,
        isVeg: true,
        isAvailable: false,
      ),
      MenuItem(
        itemId: '4',
        itemName: 'Daal Bati',
        itemDescription: 'Daal Bati is a traditional Rajasthani dish. It is a hard bread made up of wheat flour, cooked in a tandoor (oven) and served with ghee and panchmel daal.',
        itemImage: 'https://picsum.photos/250?image=9',
        itemPrice: 100,
        isVeg: false,
        isAvailable: false,
      ),
      MenuItem(
        itemId: '5',
        itemName: 'Daal Bati',
        itemDescription: 'Daal Bati is a traditional Rajasthani dish. It is a hard bread made up of wheat flour, cooked in a tandoor (oven) and served with ghee and panchmel daal.',
        itemImage: 'https://picsum.photos/250?image=9',
        itemPrice: 100,
        isVeg: true,
        isAvailable: true,
      ),
      MenuItem(
        itemId: '6',
        itemName: 'Daal Bati',
        itemDescription: 'Daal Bati is a traditional Rajasthani dish. It is a hard bread made up of wheat flour, cooked in a tandoor (oven) and served with ghee and panchmel daal.',
        itemImage: 'https://picsum.photos/250?image=9',
        itemPrice: 100,
        isVeg: true,
        isAvailable: true,
      ),
      MenuItem(
        itemId: '7',
        itemName: 'Daal Bati',
        itemDescription: 'Daal Bati is a traditional Rajasthani dish. It is a hard bread made up of wheat flour, cooked in a tandoor (oven) and served with ghee and panchmel daal.',
        itemImage: 'https://picsum.photos/250?image=9',
        itemPrice: 100,
        isVeg: true,
        isAvailable: true,
      ),
    ];
  }
}