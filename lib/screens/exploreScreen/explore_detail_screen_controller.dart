import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreDetailScreenController extends GetxController  {

  late GoogleMapController mapController;
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(11.7432, 79.7666), // San Francisco coordinates
    zoom: 12.0,
  );

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

}