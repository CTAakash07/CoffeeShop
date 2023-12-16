import 'package:get/get.dart';
import 'package:coffee_shop/screens/profileScreen/profile_screen_controller.dart';

class ProfileScreenBinding extends Bindings {

  @override
  void dependencies(){
    Get.lazyPut<ProfileScreenController>(
          () => ProfileScreenController(),
    );
  }

}