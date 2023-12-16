import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/screens/customBottomBar/custom_bottom_bar_controller.dart';
import 'package:coffee_shop/screens/favoriteScreen/favorite_screen_view.dart';
import 'package:coffee_shop/screens/orderScreen/order_screen_view.dart';
import 'package:coffee_shop/screens/profileScreen/profile_screen_view.dart';
import '../homeScreen/home_screen_view.dart';

class CustomAppBarView extends GetView<CustomAppBarController> {
  CustomAppBarView({Key? key}) : super(key: key);

  @override
  var controller = Get.put(CustomAppBarController());

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return GetBuilder<CustomAppBarController>(
      builder: (builder) => Scaffold(
        key: scaffoldKey,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(top: 1.0),
            child: Center(
              child: TabBarView(
                controller: builder.tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  HomeScreenView(),
                  OrderScreenView(),
                  FavoriteScreenView(),
                  ProfileScreenView(),
                ],
              ),
            ),
          ),
          builder.isLoader.value
              ? Positioned(
              child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.white.withOpacity(0.4),
                  child: const Center(
                      child: CircularProgressIndicator())))
              : Container()
        ]
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 5,
                  spreadRadius: 5,
                  color: Color(0xffDDDDDD)),
            ],
          ),
          height: 75,
          child: TabBar(
            controller: controller.tabController,
            padding: const EdgeInsets.only(top: 10),
            labelColor: const Color(0xff000000),
            unselectedLabelColor: const Color(0xff9B9B9B),
            labelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
            onTap: (index) async {
              controller.selectedIndex.value = index;
              builder.refresh();
            },
            tabs: [
              Tab(
                text: "Home",
                icon: Image.asset(
                    'assest/images/bottombar_store.png',
                  fit: BoxFit.scaleDown,
                  height: 30,
                  width: 30,
                  color: controller.selectedIndex.value == 0
                      ? Colors.black
                      : const Color(0xff909094),
                ),
              ),
              Tab(
                text: "Orders",
                icon: Image.asset(
                  'assest/images/bottombar_coffee_mug.png',
                  fit: BoxFit.scaleDown,
                  height: 30,
                  width: 30,
                  color: controller.selectedIndex.value == 1
                      ? Colors.black
                      : const Color(0xff909094),
                ),
              ),
              Tab(
                text: "Favorites",
                icon: Image.asset(
                  'assest/images/bottombar_heart.png',
                  fit: BoxFit.scaleDown,
                  height: 30,
                  width: 30,
                  color: controller.selectedIndex.value == 2
                      ? Colors.black
                      : const Color(0xff909094),
                ),
              ),
              Tab(
                text: "Profile",
                icon: Image.asset(
                  'assest/images/bottombar_person.png',
                  fit: BoxFit.scaleDown,
                  height: 30,
                  width: 30,
                  color: controller.selectedIndex.value == 3
                      ? Colors.black
                      : const Color(0xff909094),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}