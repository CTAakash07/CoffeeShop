import 'package:get/get.dart';
import 'package:coffee_shop/screens/splashScreen/splash_screen_view.dart';
import '../../screens/customBottomBar/custom_bottom_bar_binding.dart';
import '../../screens/customBottomBar/custom_bottom_bar_view.dart';
import '../../screens/favoriteScreen/favorite_screen_binding.dart';
import '../../screens/favoriteScreen/favorite_screen_view.dart';
import '../../screens/homeScreen/home_screen_binding.dart';
import '../../screens/homeScreen/home_screen_view.dart';
import '../../screens/orderDetailScreen/orderdetail_screen_binding.dart';
import '../../screens/orderDetailScreen/orderdetail_screen_view.dart';
import '../../screens/orderScreen/order_screen_binding.dart';
import '../../screens/orderScreen/order_screen_view.dart';
import '../../screens/placeOrderScreen/place_order_screen_binding.dart';
import '../../screens/placeOrderScreen/place_order_screen_view.dart';
import '../../screens/profileScreen/profile_screen_binding.dart';
import '../../screens/profileScreen/profile_screen_view.dart';
import '../../screens/splashScreen/splash_screen_binding.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.BOTTOM_BAR,
      page: () => CustomAppBarView(),
      binding: CustomAppBarBinding(),
    ),
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.ORDER_SCREEN,
      page: () => OrderScreenView(),
      binding: OrderScreenBinding(),
    ),
    GetPage(
      name: Routes.FAVORITE_SCREEN,
      page: () => FavoriteScreenView(),
      binding: FavoriteScreenBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_SCREEN,
      page: () => ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: Routes.ORDER_DETAIL_SCREEN,
      page: () => OrderDetailScreenView(),
      binding: OrderdetailScreenBinding(),
    ),
    GetPage(
      name: Routes.PLACE_ORDER_SCREEN,
      page: () => PlaceOrderScreenView(),
      binding: PlaceOrderScreenBinding(),
    ),
  ];
}

abstract class Routes {

  static const SPLASH_SCREEN = '/splash_screen';
  static const BOTTOM_BAR = '/bottombar';
  static const HOME_SCREEN = '/home_screen';
  static const ORDER_SCREEN = '/order_screen';
  static const ORDER_DETAIL_SCREEN = '/orderdetail_screen';
  static const FAVORITE_SCREEN = '/favorite_screen';
  static const PROFILE_SCREEN = '/profile_screen';
  static const PLACE_ORDER_SCREEN = '/place_order_screen';

}
