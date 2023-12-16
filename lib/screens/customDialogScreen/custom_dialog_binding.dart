import 'package:get/get.dart';
import 'package:coffee_shop/screens/customDialogScreen/custom_dialog_controller.dart';

class CustomDialogBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<CustomDialogController>(
          () => CustomDialogController(),
    );
  }
}