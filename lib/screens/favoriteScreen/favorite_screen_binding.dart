import 'package:coffee_shop/screens/favoriteScreen/favorite_screen_controller.dart';
import 'package:get/get.dart';

class FavoriteScreenBindng extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteScreenController>(
          () => FavoriteScreenController(),
    );
  }
}