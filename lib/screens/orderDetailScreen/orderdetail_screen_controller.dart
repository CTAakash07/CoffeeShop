import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailScreenController extends GetxController {

  RxBool productlike = false.obs;

  RxList ingredientsList = [
    {"name" : "Water", "images" : "assest/images/ingredient_water.png", "colour" : 0xff79cad9},
    {"name" : "Browed Espresso", "images" : "assest/images/ingredients_coffee_syrup.png", "colour" : 0xff605756},
    {"name" : "Sugar", "images" : "assest/images/ingredients_sugar.png", "colour" : 0xffe78695},
    {"name" : "Toffee Nut Syrup", "images" : "assest/images/ingredients_syrup.png", "colour" : 0xff91c68a},
    {"name" : "Natural Flavors", "images" : "assest/images/ingredients_natural_flavour.png", "colour" : 0xff428675},
    {"name" : "Vanila Syrup", "images" : "assest/images/ingredients_flavour.png", "colour" : 0xffeab472},
  ].obs;

  RxList nutrionInformation = [
    {"nutritionname" : "Calories", "nutritioncontent" : "250"},
    {"nutritionname" : "Protiens", "nutritioncontent" : "10g"},
    {"nutritionname" : "Caffeine", "nutritioncontent" : "150mg"},
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

}