import 'package:coffee_shop/screens/customBottomBar/custom_bottom_bar_controller.dart';
import 'package:get/get.dart';

class CustomAppBarBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<CustomAppBarController>(
          () => CustomAppBarController(),
    );
  }
}