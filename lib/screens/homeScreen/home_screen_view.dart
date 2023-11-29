import 'package:coffee_shop/screens/homeScreen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helperdirectory/approutesdirectory/app_pages.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  HomeScreenView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          padding: const EdgeInsets.only(left: 15.0),
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Welcome, Nadia",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assest/images/bottombar_person.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 45.0),
              child: Text(
                "Let's select the best taste for your next coffee break!",
                style: TextStyle(
                  color: Color(0xffd7d3cd),
                  fontFamily: 'Roboto',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Taste of the week",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: Color(0xffd7d3cd),
                      fontFamily: 'Roboto',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 465,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.coffeeShop.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 105, bottom: 10),
                              child: Stack(
                                alignment: AlignmentDirectional.topCenter,
                                clipBehavior: Clip.none,
                                fit: StackFit.loose,
                                children: [
                                  Container(
                                    width: 200,
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffd6b58e),
                                    ),
                                    child: ListView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.coffeeShop[index]
                                                  ["name"],
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              controller.coffeeShop[index]
                                                  ["coffeename"],
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              controller.coffeeShop[index]
                                                  ["description"],
                                              maxLines: 3,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.coffeeShop[index]
                                                  ["price"],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isLikedList[
                                                            index] =
                                                        !controller
                                                            .isLikedList[index];
                                                    controller.isLikedList
                                                        .refresh();
                                                  },
                                                  child: Obx(
                                                    () => Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        child: Icon(
                                                          Icons.favorite,
                                                          color: controller
                                                                          .isLikedList[
                                                                      index] ==
                                                                  true
                                                              ? Colors.blue
                                                              : Colors.grey,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 200,
                                    child: SizedBox(
                                      height: 150,
                                      width: 125,
                                      child: Center(
                                        child: Image.asset(
                                          controller.coffeeShop[index]
                                              ["images"],
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xff3d3433),
                              ),
                              child: Stack(
                                children: [
                                  const Center(
                                    child: Text(
                                      "Order Now",
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
                                      Get.toNamed(Routes.ORDERDETAIL_SCREEN, arguments: controller.coffeeShop[index]);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore nearby",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: Color(0xffd7d3cd),
                      fontFamily: 'Roboto',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.restaurant.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          child: Image.asset(
                            controller.restaurant[index]["images"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
