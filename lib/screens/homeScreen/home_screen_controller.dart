import 'package:get/get.dart';

class HomeScreenController extends GetxController {

  RxList coffeeShop = [
    {"name" : "CofeeShop's", "coffeename" : "Caffè Misto", "description" : "Our dark, rich espresso balanced with steamed milk and a light layer of foam.", "price" : "\$4.99", "images" : "assest/images/starbuck_img1.png"},
    {"name" : "BrownHouse's", "coffeename" : "Caffè Light", "description" : "Rich, full-bodied espresso with bittersweat milk sauce and steamed milk", "price" : "\$3.99", "images" : "assest/images/starbuck_img2.png"},
    {"name" : "Vegeta's", "coffeename" : "ChocolateMilkShake", "description" : "Rich, full-bodied with bittersweat cream and with chocolate syrup", "price" : "\$2.99", "images" : "assest/images/starbuck_img3.png"},
    {"name" : "Songoku's", "coffeename" : "Rosèmilk", "description" : "Rich, full-bodied with bittersweat milk sauce and steamed milk and sliced strawberry", "price" : "\$5.99", "images" : "assest/images/starbuck_img4.png"},
    {"name" : "CofeeShop's", "coffeename" : "Caffè Misto", "description" : "Our dark, rich espresso balanced with steamed milk and a light layer of foam.", "price" : "\$4.99", "images" : "assest/images/starbuck_img1.png"},
    {"name" : "BrownHouse's", "coffeename" : "Caffè Light", "description" : "Rich, full-bodied espresso with bittersweat milk sauce and steamed milk", "price" : "\$3.99", "images" : "assest/images/starbuck_img2.png"},
    {"name" : "Vegeta's", "coffeename" : "ChocolateMilkShake", "description" : "Rich, full-bodied with bittersweat cream and with chocolate syrup", "price" : "\$2.99", "images" : "assest/images/starbuck_img3.png"},
    {"name" : "Songoku's", "coffeename" : "Rosèmilk", "description" : "Rich, full-bodied with bittersweat milk sauce and steamed milk and sliced strawberry", "price" : "\$5.99", "images" : "assest/images/starbuck_img4.png"},
  ].obs;

  RxList restaurant = [
    {"images" : "assest/images/restaraunt1.png"},
    {"images" : "assest/images/restaraunt2.png"},
    {"images" : "assest/images/restaraunt3.png"},
    {"images" : "assest/images/restaraunt1.png"},
    {"images" : "assest/images/restaraunt2.png"},
    {"images" : "assest/images/restaraunt3.png"},
    {"images" : "assest/images/restaraunt1.png"},
    {"images" : "assest/images/restaraunt2.png"},
    {"images" : "assest/images/restaraunt3.png"},
  ].obs;

  RxBool isliked = false.obs;

  late RxList<bool> isLikedList;

  @override
  void onInit() {
    super.onInit();
    initializeIsLikedList();
  }

  void initializeIsLikedList() {
    isLikedList = List.generate(coffeeShop.length, (index) => false).obs;
  }

}