import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CustomRadioButton.dart';

class SearchPlaceScreen extends StatelessWidget {
  const SearchPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 94, 85),
        title: const Text("Chercher un lieu à visiter"),
      ),
      body: Container( child: searchContentWidget(),),
    );
  }

  Widget searchContentWidget() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {

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
                enabled: false,
                decoration: InputDecoration(
                  hintText: "Rechercher",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20, top: 15),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
         /* GestureDetector(
            onTap: () {

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
                enabled: false,
                decoration: InputDecoration(
                  hintText: "Arrivée",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20, top: 15),
                ),
              ),
            ),
          ),*/
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              "Choisir vos modes de transports préférés",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          OptionSelector(),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
