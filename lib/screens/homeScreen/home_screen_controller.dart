import 'package:get/get.dart';

class HomeScreenController extends GetxController {

  RxList coffeeShop = [
    {"name" : "CofeeShop's", "coffeename" : "Caffè Misto", "description" : "Our dark, rich espresso balanced with steamed milk and a light layer of foam.", "price" : "\$4.99"},
    {"name" : "BrownHouse's", "coffeename" : "Caffè Light", "description" : "Rich, full-bodied espresso with bittersweat milk sauce and steamed milk", "price" : "\$3.99"}
  ].obs;

}