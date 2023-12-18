import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:coffee_shop/screens/exploreScreen/explore_detail_screen_controller.dart';

class ExploreDetailScreenView extends GetView<ExploreDetailScreenController> {

  ExploreDetailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: controller.onMapCreated,
        initialCameraPosition: controller.initialCameraPosition,
      ),
    );
  }

}
