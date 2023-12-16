import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderScreenController extends GetxController {

  RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;

  @override
  void onInit() async {
    super.onInit();
    loadOrders();
  }

  void loadOrders() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? ordersJsonList = prefs.getStringList('orders');

    if (ordersJsonList != null) {
      orders.value = ordersJsonList.map((orderJson) {
        return Map<String, dynamic>.from(json.decode(orderJson));
      }).toList();
    }

  }

  void saveOrders() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> ordersJsonList = orders.map((order) => json.encode(order)).toList();
    prefs.setStringList('orders', ordersJsonList);

  }

  void placeOrder(String itemName, String imageName, String productShopName, int productQuantity, String price, String temperature, int sugarCount, int iceCount, String productSize, String cupCount, String cream, String syrup, String topping) {

    var order = {'productName': itemName, 'productShopName': productShopName, 'productQuantity': productQuantity, 'imageName': imageName, 'price': price, 'temperature': temperature, 'sugarCount': sugarCount, 'iceCount': iceCount, 'productSize': productSize, 'cupCount': cupCount, 'cream': cream, 'syrup': syrup, 'topping': topping};
    orders.add(order);
    saveOrders();
    update();

  }

  String productSize(String size) {
    if (size == "S") {
      return "small";
    } else if (size == "M") {
      return "medium";
    } else if (size == "XM") {
      return "extra medium";
    } else if (size == "L") {
      return "large";
    } else if (size == "XL") {
      return "extra large";
    }
    return "";
  }

  void removeOrder(int index) {
    if (index >= 0 && index < orders.length) {
      orders.removeAt(index);
      update();
    }
  }

}