import 'package:get/get.dart';

class OrderScreenController extends GetxController {

  RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;
  // List orders = [];
  // RxList orders = [].obs;

  @override
  void onInit() async {
    initializeOrdersList();
    super.onInit();
  }

  RxList<Map<String, dynamic>> initializeOrdersList() {
    // RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;
    return orders;
  }

  void placeOrder(String itemName, String imageName, String productShopName, int productQuantity, String price, String temperature, int sugarCount, int iceCount, String productSize, String cupCount, String cream, String syrup, String topping) {

    print("The order count before adding was ${orders.length}");
    var order = {'productName': itemName, 'productShopName': productShopName, 'productQuantity': productQuantity, 'imageName': imageName, 'price': price, 'temperature': temperature, 'sugarCount': sugarCount, 'iceCount': iceCount, 'productSize': productSize, 'cupCount': cupCount, 'cream': cream, 'syrup': syrup, 'topping': topping};
    orders.add(order);
    update();
    print("The order count after adding was ${orders.length}");
    print("The total data added was $orders");

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
      // orders.removeAt(index);
      // update(); // Trigger the update to refresh the UI
    }
  }

}