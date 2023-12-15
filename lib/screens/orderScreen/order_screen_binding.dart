import 'package:get/get.dart';
import 'package:coffee_shop/screens/orderScreen/order_screen_controller.dart';

class OrderScreenBinding extends Bindings {
  @override
  // void dependencies(){
  //   Get.lazyPut<OrderScreenController>(
  //         () => OrderScreenController(),
  //   );
  // }
  void dependencies() {
    Get.lazyPut<OrderScreenController>(() {
      return OrderScreenController();
    }, fenix: true); // The fenix parameter ensures that the controller is not overridden if it already exists.
  }
}