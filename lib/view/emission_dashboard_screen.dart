import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmissionDashboardScreen extends StatelessWidget {
  const EmissionDashboardScreen({Key? key}) : super(key: key);

  static const green = Color.fromARGB(255, 0, 94, 85);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: SizedBox(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.eco_outlined,
                              size: 80,
                              color: const Color.fromARGB(255, 0, 94, 85),
                            ),
                            title: RichText(
                              text: TextSpan(
                                text: "Votre consommation s'élève à ",
                                style: TextStyle(fontSize: 20, color: Colors.black87),
                                children: const <TextSpan>[
                                  TextSpan(text: '26kg de CO2', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: ' en ce mois de Mars. Bravo, vous respectez votre objectif !'),
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    )),
              ),
              Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: SizedBox(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Mon seuil mensuel", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                  Spacer(),
                                  Icon(Icons.remove_red_eye, color: green,)
                                ],
                              ),
                              Text("Dernière modification le 28 novembre 2022", style: TextStyle(fontSize: 10),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Container(
                                    color: Colors.grey.shade200,
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("99 Kg de CO2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(width: Get.width - 200, child: Text("Soit l'équivalent de 455 km en voiture.", style: TextStyle(fontSize: 11),),),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  )),
            ],
          )
        ),
      ),
    );
  }
}

