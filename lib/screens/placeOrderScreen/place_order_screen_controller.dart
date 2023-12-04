import 'package:get/get.dart';

class PlaceOrderScreenController extends GetxController {

  RxInt productQuantity = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isColdClicked = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

}