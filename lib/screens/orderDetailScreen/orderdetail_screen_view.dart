import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helperdirectory/approutesdirectory/app_pages.dart';
import 'package:coffee_shop/screens/orderDetailScreen/orderdetail_screen_controller.dart';

import '../placeOrderScreen/place_order_screen_view.dart';

class OrderDetailScreenView extends GetView<OrderDetailScreenController> {
  OrderDetailScreenView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(OrderDetailScreenController());
  var coffeeShopDetail = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String price = coffeeShopDetail["price"];
    double convertedprice = 0.0;
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
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 2.85,
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Text(
                                   coffeeShopDetail["coffeename"],
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                    ),
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
                                  padding: const EdgeInsets.only(left: 15,top: 17),
                                  child: RichText (
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "${coffeeShopDetail["rating"]}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            textBaseline: TextBaseline.ideographic,
                                          )
                                        ),
                                        WidgetSpan(
                                          child: Transform.translate(
                                            offset: const Offset(0, 7),
                                            child: const Text(
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
                                  ),
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
                            child: SizedBox(
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
                    height: 2,
                    margin: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 5,
                      bottom: 5
                    ),
                    color: const Color(0xfff8f8f8),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    margin: const EdgeInsets.only(top: 1,right: 15,left: 15, bottom: 5),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Ingredients",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto",
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              height: 120,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.ingredientsList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 75,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                padding:
                                                    const EdgeInsets.all(15),
                                                color: Color(controller
                                                        .ingredientsList[index]
                                                    ["colour"]),
                                                child: Image.asset(
                                                  controller.ingredientsList[
                                                      index]["images"],
                                                  fit: BoxFit.cover,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            controller.ingredientsList[index]
                                                ["name"],
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Container(
                              height: 2,
                              margin: const EdgeInsets.only(
                                  left: 0, right: 0, top: 5, bottom: 5),
                              color: const Color(0xfff8f8f8),
                            ),
                            const Text(
                              "Nutrition Information",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.nutrionInformation.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: controller
                                                  .nutrionInformation[index]
                                              ["nutritionname"],
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            textBaseline:
                                                TextBaseline.ideographic,
                                          )),
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: const Offset(10, 2),
                                          child: Text(
                                            controller
                                                    .nutrionInformation[index]
                                                ["nutritioncontent"],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  );
                                }),
                          ],
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
                            price = price.replaceAll("\$", "");
                            convertedprice = double.tryParse(price) ?? 0.0;
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: PlaceOrderScreenView(receivedValue: convertedprice, data: coffeeShopDetail),
                                  );
                                });
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