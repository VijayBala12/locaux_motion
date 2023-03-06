import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locaux_motion/controller/home_controller.dart';
import 'package:locaux_motion/view/search_place_screen.dart';
import 'package:locaux_motion/view/views.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'CustomRadioButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.grey[300],
              extendBodyBehindAppBar: true,
              appBar: controller.selectedTabIndex != 0
                  ? AppBar(
                      backgroundColor: const Color.fromARGB(255, 0, 94, 85),
                      title: Text(
                          controller.pageNames[controller.selectedTabIndex]),
                    )
                  : PreferredSize(
                      preferredSize: Size(Get.width, 50),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SafeArea(
                            child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(),
                        )),
                      )),
              body: controller.selectedTabIndex == 0 ? SlidingUpPanel(
                controller: controller.panelController,
                isDraggable: true,
                panel: bottomSheetWidget(controller),
                minHeight: 450,
                maxHeight: Get.height,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                defaultPanelState: PanelState.CLOSED,
                body: GetBuilder<HomeController>(
                    id: "body",
                    builder: (controller) {
                      return controller.pages[controller.selectedTabIndex];
                    }),
              ) : GetBuilder<HomeController>(
                  id: "body",
                  builder: (controller) {
                    return controller.pages[controller.selectedTabIndex];
                  }),
              bottomNavigationBar: GetBuilder<HomeController>(
                id: "bottom_nav_bar",
                builder: (controller) {
                  return BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.route),
                        label: 'Itinéraire',
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
                    onTap: (index) {
                      controller.updateSelectedTabIndex(index);
                    },
                  );
                },
              ));
        });
  }

  init() {}

  Widget bottomSheetWidget(HomeController homeController) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                ),
              )),
          const SizedBox(
            height: 40.0,
          ),
          const Text(
            "Chercher un lieu à visiter",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
             // Get.to(() => const SearchPlaceScreen());
            },
            child: Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
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
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  "Choisir vos modes de transports préférés",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              OptionSelector()
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
