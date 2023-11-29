import 'package:coffee_shop/screens/orderDetailScreen/orderdetail_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class OrderDetailScreenView extends GetView<OrderDetailScreenController>{
  OrderDetailScreenView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(OrderDetailScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xffedabb8),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1.75,
                    color: Colors.blue,
                    // child: ,
                  ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              // padding: const EdgeInsets.only(left: 10, right: 10, top: 105, bottom: 10),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.loose,
                children: [
                  Positioned(
                    bottom: 350,
                    right: 10,
                    child: SizedBox(
                      height: 275,
                      width: MediaQuery.of(context).size.width / 2.75,
                      child: Center(
                          child: Container(
                            color: Colors.red,
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 20,
                    child: Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width / 1.95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Preparation Time",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text(
                                  "5min",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),
                ],
              ),
              // child:
            ),
          ],
        ),
      ),
    );
  }

}