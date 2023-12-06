import 'package:get/get.dart';
import 'package:coffee_shop/screens/orderDetailScreen/orderdetail_screen_controller.dart';

class OrderdetailScreenBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<OrderDetailScreenController>(
          () => OrderDetailScreenController(),
    );
  }
}