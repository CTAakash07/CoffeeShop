import 'package:coffee_shop/screens/orderDetailScreen/orderdetail_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                          margin: const EdgeInsets.only(top: 1, left: 10, right: 5, bottom: 15),
                          height: 100,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                height: 65,
                                width: 65,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff463d3c),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15,top: 17),
                                  child: RichText (
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "${coffeeShopDetail["rating"]}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            textBaseline: TextBaseline.ideographic,
                                          )
                                        ),
                                        WidgetSpan(
                                          child: Transform.translate(
                                            offset: const Offset(0, 7),
                                            child: Text(
                                              '/5',
                                              style: TextStyle(
                                                fontSize: 15,
                                                textBaseline: TextBaseline.alphabetic,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                    ),
                                  )
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8.0, top: 5, bottom: 5.0, right: 5.0),
                                padding: const EdgeInsets.all(1),
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(1),
                                      height: 52,
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    top: 8,
                                                    right: 0,
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30),
                                                        border: Border.all(
                                                          color: const Color(0xffedabb8),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: const CircleAvatar(
                                                        radius: 20,
                                                        backgroundImage: AssetImage("assest/images/modelimage1.jpg"),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 8,
                                                    right: 28,
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30),
                                                        border: Border.all(
                                                          color: const Color(0xffedabb8),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: const CircleAvatar(
                                                        radius: 20,
                                                        backgroundImage: AssetImage("assest/images/modelimage2.jpg"),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 8,
                                                    right: 58,
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30),
                                                        border: Border.all(
                                                          color: const Color(0xffedabb8),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: const CircleAvatar(
                                                        radius: 20,
                                                        backgroundImage: AssetImage("assest/images/modelimage3.jpg"),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(1),
                                      height: 32,
                                      child: Center(
                                        child: Text(
                                          coffeeShopDetail["views"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: Expanded(
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.loose,
                        children: [
                          Positioned(
                            bottom: 10,
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
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 5,
                      bottom: 5
                    ),
                    color: const Color(0xfff8f8f8),
                  ),
                  Container(
                    height: 230,
                    margin: EdgeInsets.only(top: 1,right: 15,left: 15, bottom: 5),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ingredients",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              Container(
                                // margin: EdgeInsets,
                                height: 100,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(bottom: 10,top: 5,left: 15,right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff3d3433),
                    ),
                    child: Stack(
                      children: [
                        const Center(
                          child: Text(
                            "Make Order",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: "Roboto",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                        ),
                      ],
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