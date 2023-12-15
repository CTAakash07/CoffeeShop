import 'dart:ffi';

import 'package:coffee_shop/helperdirectory/approutesdirectory/app_pages.dart';
import 'package:coffee_shop/screens/customDialogScreen/custom_dialog_controller.dart';
import 'package:coffee_shop/screens/customDialogScreen/custom_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffee_shop/screens/placeOrderScreen/place_order_screen_controller.dart';
import '../orderScreen/order_screen_controller.dart';

class PlaceOrderScreenView extends GetView<PlaceOrderScreenController> {
  final double receivedValue;
  final data;

  PlaceOrderScreenView({required this.receivedValue, this.data});
  // PlaceOrderScreenView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(PlaceOrderScreenController());
  // var receivedValue = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.priceValue.value = receivedValue;
    controller.sizepriceValue.value = receivedValue;
    controller.productprice.value = controller.sizepriceValue.value.toStringAsFixed(controller.decimalPlaces.value);
    double result = 0.0;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
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
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              children: [
                                Obx(
                                  () => Container(
                                    margin: const EdgeInsets.all(0),
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: controller.isColdClicked ==
                                              false
                                          ? const BorderRadius.only(
                                              topLeft: Radius.circular(25.0),
                                              bottomLeft: Radius.circular(25.0),
                                            )
                                          : BorderRadius.circular(25),
                                      color: controller.isColdClicked == false
                                          ? const Color(0xfff6f6f6)
                                          : Colors.brown,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        controller.isColdClicked.toggle();
                                        controller.selectedTemprature = 'Cold'.obs;
                                      },
                                      child: Center(
                                        child: Text(
                                          "Hot",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: controller.isColdClicked ==
                                                      false
                                                  ? Colors.grey
                                                  : Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Container(
                                    margin: const EdgeInsets.all(0),
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: controller.isColdClicked ==
                                              true
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(25.0),
                                              // Circular radius for the top-left corner
                                              bottomRight: Radius.circular(
                                                  25.0), // Circular radius for the bottom-left corner
                                            )
                                          : BorderRadius.circular(25),
                                      color: controller.isColdClicked == true
                                          ? const Color(0xfff6f6f6)
                                          : Colors.brown,
                                    ),
                                    // color: controller.isColdClicked == false ? Colors.brown : Color(0xfff6f6f6),
                                    child: InkWell(
                                      onTap: () {
                                        controller.isColdClicked.toggle();
                                        controller.selectedTemprature = 'Hot'.obs;
                                      },
                                      child: Center(
                                        child: Text(
                                          "Cold",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: controller.isColdClicked ==
                                                    false
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
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
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Obx(() =>
                                Container(
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
                                          if (controller.isCupSizeChannged == true) {
                                            result = controller.sizepriceValue.value - (controller.priceValue.value + controller.sizeindexpriceValue.value);
                                          } else {
                                            result = controller.sizepriceValue.value - controller.priceValue.value;
                                          }
                                          controller.sizepriceValue.value = result;
                                          controller.productprice.value =
                                              controller
                                                  .sizepriceValue.value
                                                  .toStringAsFixed(controller
                                                      .decimalPlaces.value);
                                        }
                                      },
                                      child: Image.asset(
                                        "assest/images/minus.png",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                // ),
                                const Spacer(),
                                // Obx(() =>
                                Text(
                                  "${controller.productQuantity}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // ),
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
                                      if (controller.isCupSizeChannged == true) {
                                        result = controller.sizepriceValue.value + (controller.priceValue.value + controller.sizeindexpriceValue.value);
                                      } else {
                                        result = controller.sizepriceValue.value + controller.priceValue.value;
                                      }

                                      controller.sizepriceValue.value = result;
                                      controller.productprice.value =
                                          controller
                                              .sizepriceValue.value
                                              .toStringAsFixed(controller
                                              .decimalPlaces.value);
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
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                color: Colors.black12,
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
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
                      margin: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, left: 8.0, right: 40.0),
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xfff6f6f6),
                      ),
                      child: Center(
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton(
                              onChanged: (newValue) {
                                controller.selectedCup.value =
                                    newValue as String;
                              },
                              items: controller.numberofCups.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item["values"],
                                  child: Text(item["values"]),
                                );
                              }).toList(),
                              value: controller.selectedCup.value,
                            ),
                          ),
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
                      margin: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, left: 8.0),
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xfff6f6f6),
                      ),
                      child: Center(
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton(
                              onChanged: (newValue) {
                                final selected = controller.cupSize.firstWhere(
                                      (item) => item["values"] == newValue,
                                  orElse: () => {"values": "", "price": 0.0},
                                );
                                if (controller.selectedSize.value != selected["values"] as String) {
                                  controller.sizeindexpriceValue.value = selected["price"] as double;
                                  controller.sizepriceValue.value = controller.priceValue.value + selected["price"] as double;
                                  controller.productprice.value = controller.sizepriceValue.value.toStringAsFixed(controller.decimalPlaces.value);
                                  controller.selectedSize.value = selected["values"] as String;
                                  controller.productQuantity.value = 1;
                                  if (controller.isCupSizeChannged == false) {
                                    controller.isCupSizeChannged.toggle();
                                  }
                                }
                              },
                              items: controller.cupSize.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item["values"],
                                  child: Text(item["values"]),
                                );
                              }).toList(),
                              value: controller.selectedSize.value,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                color: Colors.black12,
                height: 2,
              ),
              Obx(() => controller.isColdClicked == true
                  ? Container(
                      // height: MediaQuery.of(context).size.height / 5,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, top: 5, bottom: 8),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color:
                                                  controller.sugarCubeCount > 0
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  if (controller.sugarCubeCount
                                                          .value >
                                                      0) {
                                                    controller
                                                        .sugarCubeCount.value--;
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color:
                                                  controller.creamNeeded == true
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  if (controller
                                                          .creamNeeded.value ==
                                                      true) {
                                                    controller.creamNeeded
                                                        .toggle();
                                                    controller.creamValue = "Without".obs;
                                                  }
                                                },
                                                child: Image.asset(
                                                  "assest/images/minus.png",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          const Spacer(),
                                          Text(
                                            controller.creamNeeded == true
                                                ? "Yes"
                                                : "No",
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
                                              color: controller.creamNeeded ==
                                                      false
                                                  ? Colors.amber
                                                  : Colors.grey,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                if (controller
                                                        .creamNeeded.value ==
                                                    false) {
                                                  controller.creamNeeded
                                                      .toggle();
                                                  controller.creamValue = "With".obs;
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color:
                                                  controller.chocoSyrupNeeded ==
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
                                                    controller.chocoSyrupValue = "Without".obs;
                                                  }
                                                },
                                                child: Image.asset(
                                                  "assest/images/minus.png",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          const Spacer(),
                                          Text(
                                            controller.chocoSyrupNeeded == true
                                                ? "Yes"
                                                : "No",
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
                                              color:
                                                  controller.chocoSyrupNeeded ==
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
                                                  controller.chocoSyrupValue = "With".obs;
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color:
                                                  controller.toppingsNeeded ==
                                                          true
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  if (controller.toppingsNeeded
                                                          .value ==
                                                      true) {
                                                    controller.toppingsNeeded
                                                        .toggle();
                                                    controller.toppingsValue = "Without".obs;
                                                  }
                                                },
                                                child: Image.asset(
                                                  "assest/images/minus.png",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          const Spacer(),
                                          Text(
                                            controller.toppingsNeeded.value ==
                                                    true
                                                ? "Yes"
                                                : "No",
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
                                              color:
                                                  controller.toppingsNeeded ==
                                                          false
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                if (controller
                                                        .toppingsNeeded.value ==
                                                    false) {
                                                  controller.toppingsNeeded
                                                      .toggle();
                                                  controller.toppingsValue = "With".obs;
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
                      // height: MediaQuery.of(context).size.height / 5,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, top: 5, bottom: 8),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color:
                                                  controller.sugarCubeCount > 0
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  if (controller.sugarCubeCount
                                                          .value >
                                                      0) {
                                                    controller
                                                        .sugarCubeCount.value--;
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color: controller.iceCubeCount > 0
                                                  ? Colors.amber
                                                  : Colors.grey,
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  if (controller
                                                          .iceCubeCount.value >
                                                      0) {
                                                    controller
                                                        .iceCubeCount.value--;
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
                                              controller.iceCubeCount.value++;
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color:
                                                  controller.creamNeeded == true
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  if (controller
                                                          .creamNeeded.value ==
                                                      true) {
                                                    controller.creamNeeded
                                                        .toggle();
                                                    controller.creamValue.value = 'Without';
                                                  }
                                                },
                                                child: Image.asset(
                                                  "assest/images/minus.png",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          const Spacer(),
                                          Text(
                                            controller.creamNeeded == true
                                                ? "Yes"
                                                : "No",
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
                                              color: controller.creamNeeded ==
                                                      false
                                                  ? Colors.amber
                                                  : Colors.grey,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                if (controller
                                                        .creamNeeded.value ==
                                                    false) {
                                                  controller.creamNeeded
                                                      .toggle();
                                                  controller.creamValue.value = 'With';
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color:
                                                  controller.chocoSyrupNeeded ==
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
                                                    controller.chocoSyrupValue.value = 'Without';
                                                  }
                                                },
                                                child: Image.asset(
                                                  "assest/images/minus.png",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          const Spacer(),
                                          Text(
                                            controller.chocoSyrupNeeded == true
                                                ? "Yes"
                                                : "No",
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
                                              color:
                                                  controller.chocoSyrupNeeded ==
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
                                                  controller.chocoSyrupValue.value = 'With';
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: Colors.grey.shade300),
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
                                              color:
                                                  controller.toppingsNeeded ==
                                                          true
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            child: InkWell(
                                                onTap: () {
                                                  if (controller.toppingsNeeded
                                                          .value ==
                                                      true) {
                                                    controller.toppingsNeeded
                                                        .toggle();
                                                    controller.toppingsValue.value = 'Without';
                                                  }
                                                },
                                                child: Image.asset(
                                                  "assest/images/minus.png",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          const Spacer(),
                                          Text(
                                            controller.toppingsNeeded == true
                                                ? "Yes"
                                                : "No",
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
                                              color:
                                                  controller.toppingsNeeded ==
                                                          false
                                                      ? Colors.amber
                                                      : Colors.grey,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                if (controller
                                                        .toppingsNeeded.value ==
                                                    false) {
                                                  controller.toppingsNeeded
                                                      .toggle();
                                                  controller.toppingsValue.value = 'With';
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
                margin: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                color: Colors.black12,
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, bottom: 0.0, left: 10.0, right: 10.0),
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        Obx(
                          () => Text(
                            "\$${controller.productprice.value}",
                            style: const TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                                color: Colors.amber),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xfff6f6f6)),
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.brown,
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.put(OrderScreenController()).placeOrder(data["coffeename"], data["images"], data["name"], controller.productQuantity.value,  controller.sizepriceValue.value.toStringAsFixed(3), controller.selectedTemprature.value, controller.sugarCubeCount.value, controller.iceCubeCount.value, controller.selectedSize.value, controller.selectedCup.value, controller.creamValue.value, controller.chocoSyrupValue.value, controller.toppingsValue.value);
                            Get.back();
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: IntrinsicHeight(
                                    child: CustomDialogView(data, controller.sizepriceValue.value),
                                  ),
                                );
                              },
                            );
                            controller.productQuantity.value = 1;
                            controller.sugarCubeCount.value = 0;
                            controller.iceCubeCount.value = 0;
                            controller.selectedSize.value = 'S';
                            controller.selectedCup.value = '1';
                            controller.creamValue.value = "Without";
                            controller.toppingsValue.value = "Without";
                            controller.chocoSyrupValue.value = "Without";
                            controller.creamNeeded.value = false;
                            controller.toppingsNeeded.value = false;
                            controller.chocoSyrupNeeded.value = false;
                          },
                          child: const Center(
                            child: Text(
                              "Place Order",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}