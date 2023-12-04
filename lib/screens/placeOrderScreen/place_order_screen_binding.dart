import 'package:coffee_shop/screens/placeOrderScreen/place_order_screen_controller.dart';
import 'package:get/get.dart';

class PlaceOrderScreenBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<PlaceOrderScreenController>(
          () => PlaceOrderScreenController(),
    );
  }
}