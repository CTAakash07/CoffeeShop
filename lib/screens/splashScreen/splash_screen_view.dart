import 'package:coffee_shop/screens/splashScreen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
                "assest/images/coffee_shop.png",
                height: 150,
                width: 150,
                fit: BoxFit.scaleDown,
              ))
        ],
      ),
    );
  }
}