import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  int selectedTabIndex = 0;
  final Completer<GoogleMapController> mapsController = Completer();

  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(48.692055, 6.184417),
    zoom: 15,
  );


}