import 'dart:ffi';

import 'package:coffee_shop/screens/customDialogScreen/custom_dialog_controller.dart';
import 'package:coffee_shop/screens/homeScreen/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogView extends GetView<CustomDialogController> {
  final values;
  final double Price;

  CustomDialogView(
    this.values,
    this.Price,
  );

  @override
  var controller = Get.put(CustomDialogController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(top: 10, right: 10),
              height: 35,
              width: 25,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(HomeScreenView());
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 15, left: 10, right: 10, bottom: 15),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  "Thanks For Ordering",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    color: Colors.blue.shade500,
                  ),
                ),
                Text(
                  values["coffeename"],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    color: Colors.red.shade500,
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      values["images"],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your Order Placed for",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 8), // Add space between text elements
                  ),
                  TextSpan(
                    text: "\$$Price",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 15,
            margin: const EdgeInsets.only(top: 5,bottom: 15),
          )
        ],
      ),
    );
  }
}
