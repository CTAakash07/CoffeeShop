import 'package:coffee_shop/screens/profileScreen/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  ProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}