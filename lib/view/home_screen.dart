import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locaux_motion/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 94, 85),
            title : const Text("Recherche d'itinéraire"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                // Do something when the menu icon is pressed
              },
              icon: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: controller.initialCameraPosition,
                onMapCreated: (GoogleMapController googleMapsController) {
                  controller.mapsController.complete(googleMapsController);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        // color: Colors.grey[200],
                        offset: Offset(0, 10),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Rechercher",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20, top: 15),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.route),
                label: 'Itinéraire',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Carte',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Carnet de voyage',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.eco_outlined),
                label: 'Suivi CO2',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profil',
              ),
            ],
            currentIndex: controller.selectedTabIndex,
            selectedItemColor: const Color.fromARGB(255, 0, 94, 85),
            unselectedItemColor: Colors.black,
            onTap: (index){},
          ),
        );
      }
    );
  }
}
