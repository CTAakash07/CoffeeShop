import 'package:coffee_shop/screens/homeScreen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          padding:  EdgeInsets.only(left: 15.0),
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Welcome, Nadia",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                // SizedBox(width: 50,),
                Padding(
                    padding: EdgeInsets.only(right: 25.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
                padding: EdgeInsets.only(right: 45.0),
              child: Text(
                "Let's select the best taste for your next coffee break!",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}