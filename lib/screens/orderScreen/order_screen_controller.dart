import 'package:get/get.dart';

class OrderScreenController extends GetxController {

  final RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;
  final RxMap<String, dynamic> order = <String, dynamic>{}.obs;


  void placeOrder(String itemName, String imageName, String productShopName, int productQuantity, String price, String temperature, int sugarCount, int iceCount, String productSize, String cupCount, String cream, String syrup, String topping) {
    order.value = {'productName': itemName, 'productShopName': productShopName, 'productQuantity': productQuantity, 'imageName': imageName, 'price': price, 'temperature': temperature, 'sugarCount': sugarCount, 'iceCount': iceCount, 'productSize': productSize, 'cupCount': cupCount, 'cream': cream, 'syrup': syrup, 'topping': topping};
    orders.add(Map.from(order));
    update();
    refresh();
    print("The data added was ${order.value}");
    print("The order count was ${orders.length}");
    print("The total data added was $orders");

  }

  void removeOrder(int index) {
    if (index >= 0 && index < orders.length) {
      orders.removeAt(index);
      update(); // Trigger the update to refresh the UI
    }
  }

}