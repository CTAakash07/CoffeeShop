import 'package:get/get.dart';
import 'package:coffee_shop/screens/homeScreen/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<HomeScreenController>(
          () => HomeScreenController(),
    );
  }
}