import 'package:coffee_shop/screens/orderScreen/order_screen_controller.dart';
import 'package:get/get.dart';

class OrderScreenBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<OrderScreenController>(
          () => OrderScreenController(),
    );
  }
}