import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locaux_motion/controller/home_controller.dart';
import 'package:locaux_motion/view/views.dart';

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
            title : Text(controller.pageNames[controller.selectedTabIndex]),
            actions: [
             GetBuilder<HomeController>(
               id: "action_icons",
               builder: (controller) {
                 return controller.firebaseUser.value == null ? IconButton(
                   onPressed: (){
                     Get.to(() => const LoginOrRegisterPage());
                   },
                   icon: const Icon(Icons.login),
                 ) : IconButton(
                   onPressed: (){
                     controller.logout();
                   },
                   icon: const Icon(Icons.logout),
                 );
               }
             )
            ],
          ),
          body: GetBuilder<HomeController> (
            id: "body",
            builder: (controller) {
              return controller.pages[controller.selectedTabIndex];
            }
          ),
          bottomNavigationBar: GetBuilder<HomeController> (
            id: "bottom_nav_bar",
            builder: (controller) {
              return BottomNavigationBar(
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
                onTap: (index){
                  controller.updateSelectedTabIndex(index);
                },
              );
            },
          )
        );
      }
    );
  }
}
