import 'package:coffee_shop/screens/orderDetailScreen/orderdetail_screen_controller.dart';
import 'package:get/get.dart';

class OrderdetailScreenBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<OrderDetailScreenController>(
          () => OrderDetailScreenController(),
    );
  }
}