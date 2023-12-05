import 'package:get/get.dart';

class PlaceOrderScreenController extends GetxController {

  RxInt productQuantity = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxBool isColdClicked = false.obs;

  RxList numberofCups = [
    {"values" : "1"},
    {"values" : "2"},
    {"values" : "3"},
    {"values" : "4"},
    {"values" : "5"},
    {"values" : "6"},
    {"values" : "7"},
    {"values" : "8"},
    {"values" : "9"},
    {"values" : "10"},
  ].obs;

  RxList cupSize = [
    {"sizes" : "S"},
    {"sizes" : "M"},
    {"sizes" : "XM"},
    {"sizes" : "L"},
    {"sizes" : "XL"},
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

}