import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helperdirectory/apihelperdirectory/check_internet_availabilty.dart';

class CustomAppBarController extends GetxController with GetSingleTickerProviderStateMixin {

  TabController? tabController;
  RxInt selectedIndex = 0.obs;
  RxBool isLoader = false.obs;

  @override
  void onInit() async {
    tabController = TabController(vsync: this, length: 4);
    checkInternetConnection();
    super.onInit();

  }

  checkInternetConnection()async{
    bool isInternetAvailable = await CheckConnectivity.checkInternetConnection();
    if(isInternetAvailable){

    }else{
      Get.snackbar('Failure', "No Internet Available");
    }
  }

}