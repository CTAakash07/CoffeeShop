import 'package:coffee_shop/screens/orderDetailScreen/orderdetail_screen_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailScreenView extends GetView<OrderDetailScreenController> {
  OrderDetailScreenView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(OrderDetailScreenController());
  var coffeeShopDetail = Get.arguments;

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
            SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1.75,
                    // color: Colors.blue,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                          height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text(
                                 coffeeShopDetail["coffeename"],
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    fontFamily: "Roboto",
                                    color: Colors.white,
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: InkWell(
                                    onTap: () {
                                      controller.productlike.toggle();
                                    },
                                    child: Obx(
                                          () => Container(
                                          height: 40,
                                          width: 40,
                                          decoration:
                                          BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Icon(
                                            Icons.favorite,
                                            color: controller.productlike == true ? Colors.red : Colors.grey,
                                          )
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
                          height: 130,
                          child: Text(
                              coffeeShopDetail["description"],
                            maxLines: 5,
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 1,left: 10,right: 5,bottom: 15),
                          height: 100,
                          color: Colors.blue,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.yellow
                                ),
                                child: Center(
                                  child: Text(
                                    "${coffeeShopDetail["rating"]}/5",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8.0,top: 5,bottom: 5.0,right: 5.0),
                                padding: const EdgeInsets.all(1),
                                color: Colors.red,
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: Column(
                                  children: [
                                      Container(
                                        margin: const EdgeInsets.all(1),
                                        color: Colors.green,
                                        height: 52,
                                        child: Stack(
                                          children: [

                                          ],
                                        ),
                                      ),
                                    Container(
                                      margin: const EdgeInsets.all(1),
                                      color: Colors.green,
                                      height: 32,
                                      child: Center(
                                        child: Text(
                                            coffeeShopDetail["views"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: Image.asset(
                          coffeeShopDetail["images"],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 20,
                    child: Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width / 1.95,
                        child: const Column(
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
            ),
          ],
        ),
      ),
    );
  }
}