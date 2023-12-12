import 'package:coffee_shop/screens/customDialogScreen/custom_dialog_controller.dart';
import 'package:get/get.dart';

class CustomDialogBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<CustomDialogController>(
          () => CustomDialogController(),
    );
  }
}