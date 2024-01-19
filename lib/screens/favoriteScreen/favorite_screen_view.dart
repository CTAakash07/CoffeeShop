import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/screens/favoriteScreen/favorite_screen_controller.dart';

class FavoriteScreenView extends GetView<FavoriteScreenController> {
   const FavoriteScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }
}