import 'dart:async';
import 'package:get/get.dart';
import '../../helperdirectory/apihelperdirectory/check_internet_availabilty.dart';
import '../../helperdirectory/approutesdirectory/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    checkInternetConnection();
    super.onInit();
  }

  checkInternetConnection() async {
    bool isInternetAvailable =
    await CheckConnectivity.checkInternetConnection();
    if (isInternetAvailable) {
      getToken();
    } else {
      Get.snackbar('Failure', "No Internet Available");
    }
  }

  getToken() async {
    Timer(const Duration(seconds: 1), () => Get.offNamed(Routes.BOTTOM_BAR));
  }
}