import 'package:get/get.dart';
import 'package:coffee_shop/screens/splashScreen/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}