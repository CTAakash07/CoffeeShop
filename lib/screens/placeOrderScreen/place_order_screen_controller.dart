import 'package:get/get.dart';

class PlaceOrderScreenController extends GetxController {

  RxInt selectedIndex = 0.obs;
  RxInt productQuantity = 1.obs;
  RxInt iceCubeCount = 0.obs;
  RxInt sugarCubeCount = 0.obs;
  RxBool creamNeeded = false.obs;
  RxBool toppingsNeeded = false.obs;
  RxBool chocoSyrupNeeded = false.obs;
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

  RxList coldAddedIngredients = [
    {"icons": "assest/images/ingredients_sugar.png", "name" : "Sugar", "id" : "1" , "value" : 0},
    {"icons": "assest/images/ingredients_cream.png", "name" : "Cream", "id" : "2" , "value" : false},
    {"icons": "assest/images/ingredients_syrup.png", "name" : "ChocoSyrup", "id" : "3" , "value" : false},
    {"icons": "assest/images/ingredients_topping.png", "name" : "Topping", "id" : "4" , "value" : false},
    {"icons": "assest/images/ingredients_ice.png", "name" : "Ice", "id" : "5" , "value" : 0},
  ].obs;

  RxList hotAddedIngredients = [
    {"icons": "assest/images/ingredients_sugar.png", "name" : "Sugar", "id" : "1" , "value" : 0},
    {"icons": "assest/images/ingredients_cream.png", "name" : "Cream", "id" : "2" , "value" : false},
    {"icons": "assest/images/ingredients_syrup.png", "name" : "ChocoSyrup", "id" : "3" , "value" : false},
    {"icons": "assest/images/ingredients_topping.png", "name" : "Topping", "id" : "4" , "value" : false},
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

}