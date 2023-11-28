import 'package:coffee_shop/screens/orderScreen/order_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreenView extends GetView<OrderScreenController> {
  OrderScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}