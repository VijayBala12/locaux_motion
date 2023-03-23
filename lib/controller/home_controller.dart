import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locaux_motion/model/option.dart';
import 'package:locaux_motion/model/place.dart';
import 'package:locaux_motion/view/account_screen.dart';
import 'package:locaux_motion/view/emission_dashboard_screen.dart';
import 'package:locaux_motion/view/itinerary_screen.dart';
import 'package:locaux_motion/view/map_screen.dart';
import 'package:locaux_motion/view/travel_book_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeController extends GetxController {
  int selectedTabIndex = 0;
  final Completer<GoogleMapController> mapsController = Completer();
  final PanelController panelController = PanelController();

  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(48.692055, 6.184417),
    zoom: 15,
  );

  Rxn<User> firebaseUser = Rxn<User>();

  // Firebase user a realtime stream
  Stream<User?> get user => FirebaseAuth.instance.authStateChanges();



  List<Widget> pages = [
    ItineraryScreen(),
    TravelBookScreen(),
    EmissionDashboardScreen(),
    AccountScreen(),
  ];

  List<String> pageNames = [
    "Recherche d'itinéraire",
    "Carnet de voyages",
    "Suivi CO2",
    "Profil",
  ];

  @override
  void onReady() async {
    firebaseUser.bindStream(user);
    //listen forever the changes and handle it
    ever(firebaseUser, handleAuthChanged);
    super.onReady();
  }

  handleAuthChanged(User? _firebaseUser) async {
    if (_firebaseUser?.email != null) {
     //logged in
      print("logged in");
    } else {
      //logged out
      print("logged out");
    }
    //updates the ui with id
    update(["action_icons"]);
  }

  updateSelectedTabIndex(index) {
    selectedTabIndex = index;
    update();
  }

  logout() async {
    FirebaseAuth.instance.signOut();
  }

  List<String> getNames() {
    List<String> names = [];
    for (var element in places) {
      names.add(element.name);
    }
    return names;
  }

  Place? getPlaceByName(String name) {
    return places.firstWhereOrNull((element) => element.name == name);
  }
}