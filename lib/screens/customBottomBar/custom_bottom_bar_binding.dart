import 'package:get/get.dart';
import 'package:coffee_shop/screens/customBottomBar/custom_bottom_bar_controller.dart';

class CustomAppBarBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<CustomAppBarController>(
          () => CustomAppBarController(),
    );
  }
}