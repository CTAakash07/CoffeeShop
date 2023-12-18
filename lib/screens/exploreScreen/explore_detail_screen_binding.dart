import 'package:get/get.dart';
import 'package:coffee_shop/screens/exploreScreen/explore_detail_screen_controller.dart';

class ExploreDetailsScreenBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ExploreDetailScreenController>(
        () => ExploreDetailScreenController());
  }

}