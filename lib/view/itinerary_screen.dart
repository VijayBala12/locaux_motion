import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locaux_motion/controller/home_controller.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: controller.initialCameraPosition,
          onMapCreated: (GoogleMapController googleMapsController) {
            if (!controller.mapsController.isCompleted) {
              controller.mapsController.complete(googleMapsController);
            }
          },
        )
      ],
    );
  }
}
