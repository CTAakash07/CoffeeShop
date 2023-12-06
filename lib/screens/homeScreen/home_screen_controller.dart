import 'package:get/get.dart';

class HomeScreenController extends GetxController {

  RxList coffeeShop = [
    {"name" : "CofeeShop's", "coffeename" : "Caffè Misto", "description" : "Our dark, rich espresso balanced with steamed milk and a light layer of foam.", "price" : "\$4.99", "images" : "assest/images/starbuck_img1.png", "rating" : "3.2", "views" : "+27more"},
    {"name" : "BrownHouse's", "coffeename" : "Caffè Light", "description" : "Rich, full-bodied espresso with bittersweat milk sauce and steamed milk", "price" : "\$3.99", "images" : "assest/images/starbuck_img2.png", "rating" : "3.7", "views" : "+15more"},
    {"name" : "Vegeta's", "coffeename" : "ChocolateMilkShake", "description" : "Rich, full-bodied with bittersweat cream and with chocolate syrup", "price" : "\$2.99", "images" : "assest/images/starbuck_img3.png", "rating" : "3.5", "views" : "+20more"},
    {"name" : "Songoku's", "coffeename" : "Rosèmilk", "description" : "Rich, full-bodied with bittersweat milk sauce and steamed milk and sliced strawberry", "price" : "\$5.99", "images" : "assest/images/starbuck_img4.png", "rating" : "3.0", "views" : "+22more"},
    {"name" : "Beerus's", "coffeename" : "Capachino", "description" : "Our dark, rich espresso balanced with steamed milk and a light layer of foam with the thick top covered with coffe powder", "price" : "\$2.50", "images" : "assest/images/starbuck_img1.png", "rating" : "2.9", "views" : "+30more"},
    {"name" : "Naruto's", "coffeename" : "Herbal Tea", "description" : "Japanese style herbal strong tea", "price" : "\$6.99", "images" : "assest/images/starbuck_img2.png", "rating" : "4.9", "views" : "+25more"},
    {"name" : "HinataHouse", "coffeename" : "OreoMilkshake", "description" : "Rich milk with full-bodied creamed with the cracked oreo biscut", "price" : "\$5.00", "images" : "assest/images/starbuck_img3.png", "rating" : "4.3", "views" : "+24more"},
    {"name" : "HancookHouse's", "coffeename" : "KitkatMilkshake", "description" : "Rich milk with full-bodied creamed with the cracked Kitkat chocolate", "price" : "\$4.50", "images" : "assest/images/starbuck_img4.png", "rating" : "4.2", "views" : "+32more"},
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