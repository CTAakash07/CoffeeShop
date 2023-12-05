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
        insetPadding: const EdgeInsets.all(0),
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
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      height: 35,
                      width: 25,
                      decoration: const BoxDecoration(
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
                                      color: const Color(0xfff6f6f6)),
                                  margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    Obx(() => Container(
                                        margin: const EdgeInsets.all(0),
                                        width: 50,
                                      decoration: BoxDecoration(
                                            borderRadius: controller
                                                        .isColdClicked ==
                                                    false
                                                ? const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25.0),
                                                    bottomLeft: Radius.circular(
                                                        25.0),
                                                  )
                                                : BorderRadius.circular(25),
                                            color: controller.isColdClicked ==
                                                    false
                                                ? const Color(0xfff6f6f6)
                                                : Colors.brown,
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
                                           borderRadius: controller.isColdClicked == true ? const BorderRadius.only(
                                             topRight: Radius.circular(25.0), // Circular radius for the top-left corner
                                             bottomRight: Radius.circular(25.0), // Circular radius for the bottom-left corner
                                           ) : BorderRadius.circular(25),
                                           color: controller.isColdClicked == true ? const Color(0xfff6f6f6) : Colors.brown,
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
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.productQuantity > 1
                                              ? Colors.amber
                                              : Colors.grey,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.productQuantity > 1) {
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
                                    const Spacer(),
                                    Obx(
                                      () => Text(
                                        "${controller.productQuantity}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 25,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.amber,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          controller.productQuantity += 1;
                                        },
                                        child: const Icon(Icons.add),
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
                    Container(
                      margin: const EdgeInsets.only(top: 5.0,bottom: 5.0,left: 10.0,right: 10.0),
                      color: Colors.black12,
                      height: 2,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0,bottom: 5.0,left: 10.0,right: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            "Select Cup",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto",
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0,bottom: 5.0,left: 8.0,right: 40.0),
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xfff6f6f6),
                            ),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "1",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down_sharp),
                                ],
                              ),
                            ),
                          ),
                          const Text(
                            "Select Size",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto",
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0,bottom: 5.0,left: 8.0),
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xfff6f6f6),
                            ),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "M",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down_sharp),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0,bottom: 5.0,left: 10.0,right: 10.0),
                      color: Colors.black12,
                      height: 2,
                    ),
                    Obx(() => controller.isColdClicked == true
                        ? Container(
                            height: MediaQuery.of(context).size.height / 5,
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 5),
                            child: ListView(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_sugar.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Sugar",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                    Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Obx(
                                                    () => Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .sugarCubeCount >
                                                        0
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller
                                                            .sugarCubeCount
                                                            .value >
                                                            0) {
                                                          controller
                                                              .sugarCubeCount
                                                              .value--;
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                              ),
                                              const Spacer(),
                                              Obx(
                                                    () => Text(
                                                      "${controller.sugarCubeCount} cubes",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                width: 25,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.amber,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .sugarCubeCount.value++;
                                                  },
                                                  child: const Icon(Icons.add),
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
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_cream.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Cream",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                    Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Obx(
                                                () => Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .creamNeeded ==
                                                        true
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller
                                                            .creamNeeded
                                                            .value ==
                                                            true) {
                                                          controller.creamNeeded
                                                              .toggle();
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  controller.creamNeeded == true ? "Yes" : "No",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .creamNeeded ==
                                                        false
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (controller.creamNeeded
                                                          .value ==
                                                          false) {
                                                        controller.creamNeeded
                                                            .toggle();
                                                      }
                                                    },
                                                    child: const Icon(Icons.add),
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
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_syrup.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Syrup",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                    Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Obx(
                                                () => Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .chocoSyrupNeeded ==
                                                        true
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller
                                                            .chocoSyrupNeeded
                                                            .value ==
                                                            true) {
                                                          controller.chocoSyrupNeeded
                                                              .toggle();
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  controller.chocoSyrupNeeded == true ? "Yes" : "No",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .chocoSyrupNeeded ==
                                                        false
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (controller.chocoSyrupNeeded
                                                          .value ==
                                                          false) {
                                                        controller.chocoSyrupNeeded
                                                            .toggle();
                                                      }
                                                    },
                                                    child: const Icon(Icons.add),
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
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_topping.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Topping",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                    Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Obx(
                                                () => Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .toppingsNeeded ==
                                                        true
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller
                                                            .toppingsNeeded
                                                            .value ==
                                                            true) {
                                                          controller.toppingsNeeded
                                                              .toggle();
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  controller.toppingsNeeded.value == true ? "Yes" : "No",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .toppingsNeeded ==
                                                        false
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (controller.toppingsNeeded
                                                          .value ==
                                                          false) {
                                                        controller.toppingsNeeded.toggle();
                                                      }
                                                    },
                                                    child: const Icon(Icons.add),
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
                              ],
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height / 5,
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 5),
                            child: ListView(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_sugar.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Sugar",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                                .sugarCubeCount >
                                                            0
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller.sugarCubeCount.value > 0) {
                                                          controller.sugarCubeCount.value--;
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                              ),
                                              const Spacer(),
                                              Obx(
                                                () => Text(
                                                  "${controller.sugarCubeCount} cubes",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                width: 25,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.amber,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.sugarCubeCount.value++;
                                                  },
                                                  child: const Icon(Icons.add),
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
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_ice.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Ice",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                                .iceCubeCount >
                                                            0
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller
                                                                .iceCubeCount
                                                                .value >
                                                            0) {
                                                          controller
                                                              .iceCubeCount
                                                              .value--;
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                              ),
                                              const Spacer(),
                                              Obx(
                                                () => Text(
                                                  "${controller.iceCubeCount} cubes",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                width: 25,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.amber,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .iceCubeCount.value++;
                                                  },
                                                  child: const Icon(Icons.add),
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
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_cream.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Cream",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Obx(
                                            () => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                                .creamNeeded ==
                                                            true
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller
                                                                .creamNeeded
                                                                .value ==
                                                            true) {
                                                          controller.creamNeeded
                                                              .toggle();
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  controller
                                                      .creamNeeded ==
                                                      true ? "Yes" : "No",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .creamNeeded ==
                                                        false
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (controller.creamNeeded
                                                              .value ==
                                                          false) {
                                                        controller.creamNeeded
                                                            .toggle();
                                                      }
                                                    },
                                                    child: const Icon(Icons.add),
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
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_syrup.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Syrup",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                    Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Obx(
                                                () => Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .chocoSyrupNeeded ==
                                                        true
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller
                                                            .chocoSyrupNeeded
                                                            .value ==
                                                            true) {
                                                          controller.chocoSyrupNeeded
                                                              .toggle();
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  controller.chocoSyrupNeeded == true ? "Yes" : "No",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .chocoSyrupNeeded ==
                                                        false
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (controller.chocoSyrupNeeded
                                                          .value ==
                                                          false) {
                                                        controller.chocoSyrupNeeded
                                                            .toggle();
                                                      }
                                                    },
                                                    child: const Icon(Icons.add),
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
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 8),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8, right: 12),
                                          // height: 65,
                                          width: 60,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assest/images/ingredients_topping.png",
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "Topping",
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                    Colors.grey.shade300),
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                              top: 10, bottom: 10, left: 15),
                                          child: Obx(
                                                () => Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .toppingsNeeded ==
                                                        true
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        if (controller
                                                            .toppingsNeeded
                                                            .value ==
                                                            true) {
                                                          controller.toppingsNeeded
                                                              .toggle();
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        "assest/images/minus.png",
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  controller.toppingsNeeded == true ? "Yes" : "No",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                        .toppingsNeeded ==
                                                        false
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (controller.toppingsNeeded
                                                          .value ==
                                                          false) {
                                                        controller.toppingsNeeded.toggle();
                                                      }
                                                    },
                                                    child: const Icon(Icons.add),
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
                              ],
                            ),
                          )),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0,bottom: 5.0,left: 10.0,right: 10.0),
                      color: Colors.black12,
                      height: 2,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0,bottom: 5.0,left: 10.0,right: 10.0),
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                                ),
                              ),
                              Text(
                                "\$9,50",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.amber
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xfff6f6f6)),
                              margin:
                              const EdgeInsets.only(top: 5, bottom: 5),
                              child: Container(
                                    margin: const EdgeInsets.all(0),
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.brown,
                                    ),
                                    child: InkWell(
                                      onTap: () {

                                      },
                                      child: const Center(
                                        child: Text(
                                          "Place Order",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.white
                                          ),
                                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}