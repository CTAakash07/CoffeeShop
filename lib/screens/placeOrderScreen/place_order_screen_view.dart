import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../orderDetailScreen/orderdetail_screen_view.dart';
import 'package:coffee_shop/screens/placeOrderScreen/place_order_screen_controller.dart';

class PlaceOrderScreenView extends GetView<PlaceOrderScreenController> {
  PlaceOrderScreenView({Key? key}) : super(key: key);

  var controller = Get.put(PlaceOrderScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(0),
        child:
        Stack(
          children: [
            Positioned(
              bottom: 0,
              height: MediaQuery.of(context).size.height / 1.53,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      height: 35,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle
                      ),
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
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                  "Temperature",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xfff6f6f6)),
                                  margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    Obx(() => Container(
                                        margin: const EdgeInsets.all(0),
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: controller.isColdClicked == false ? BorderRadius.only(
                                            topLeft: Radius.circular(25.0), // Circular radius for the top-left corner
                                            bottomLeft: Radius.circular(25.0), // Circular radius for the bottom-left corner
                                          ) : BorderRadius.circular(25),
                                            color: controller.isColdClicked == false ? Color(0xfff6f6f6) : Colors.brown,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.isColdClicked.toggle();
                                          },
                                          child: Center(
                                            child: Text(
                                              "Hot",
                                              style: TextStyle(
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: controller.isColdClicked == false ? Colors.grey : Colors.white
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Obx(() =>
                                       Container(
                                        margin: const EdgeInsets.all(0),
                                        width: 50,
                                         decoration: BoxDecoration(
                                           borderRadius: controller.isColdClicked == true ? BorderRadius.only(
                                             topRight: Radius.circular(25.0), // Circular radius for the top-left corner
                                             bottomRight: Radius.circular(25.0), // Circular radius for the bottom-left corner
                                           ) : BorderRadius.circular(25),
                                           color: controller.isColdClicked == true ? Color(0xfff6f6f6) : Colors.brown,
                                         ),
                                        // color: controller.isColdClicked == false ? Colors.brown : Color(0xfff6f6f6),
                                        child: InkWell(
                                          onTap: () {
                                            controller.isColdClicked.toggle();
                                          },
                                          child: Center(
                                            child: Text(
                                              "Cold",
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: controller.isColdClicked == false ? Colors.white : Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Quantity",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 75,
                                margin: const EdgeInsets.only(top: 10,bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Container(
                                        width: 25,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.productQuantity > 0
                                              ? Colors.amber
                                              : Colors.grey,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.productQuantity > 0) {
                                              controller.productQuantity -= 1;
                                            }
                                          },
                                          child: Image.asset(
                                              "assest/images/minus.png",
                                            fit: BoxFit.cover,
                                          )
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Obx(
                                      () => Text(
                                        "${controller.productQuantity}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.amber,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          controller.productQuantity += 1;
                                        },
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}