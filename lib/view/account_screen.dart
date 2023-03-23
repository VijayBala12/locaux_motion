import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'login_or_register_page.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<HomeController>(
          id: "action_icons",
          builder: (controller) {
            var dp = controller.firebaseUser.value?.photoURL;
            return ListView(
              children: [
                controller.firebaseUser.value == null ? Container() :
                Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: SizedBox(
                      height: 80,
                      child: Center(
                        child: ListTile(
                          leading: dp == null ? Icon(
                            Icons.person,
                            color: const Color.fromARGB(255, 0, 94, 85),
                          ) : Image.network(dp),

                          title: Text(controller.firebaseUser.value?.displayName ?? controller.firebaseUser.value?.email ?? "Unkown"),
                          trailing: Icon(Icons.edit, color: const Color.fromARGB(255, 0, 94, 85)),
                          onTap: () {},
                        ),
                      ),
                    )),
                Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: SizedBox(
                      height: 80,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.eco_outlined,
                            color: const Color.fromARGB(255, 0, 94, 85),
                          ),
                          title: Text("Suivi CO2"),
                          onTap: () {},
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          child: Center(
                            child: ListTile(
                              leading: Icon(Icons.book,
                                  color: const Color.fromARGB(255, 0, 94, 85)),
                              title: Text("Carnet de voyages"),
                              trailing: Icon(Icons.chevron_right_rounded),
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          child: Center(
                            child: ListTile(
                              leading: Icon(
                                Icons.favorite,
                                color: const Color.fromARGB(255, 0, 94, 85),
                              ),
                              title: Text("Favoris"),
                              trailing: Icon(Icons.chevron_right_rounded),
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                          child: Center(
                            child: ListTile(
                              leading: Icon(
                                Icons.list,
                                color: const Color.fromARGB(255, 0, 94, 85),
                              ),
                              title: Text("À visiter"),
                              trailing: Icon(Icons.chevron_right_rounded),
                              onTap: () {},
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          child: Center(
                            child: ListTile(
                              leading: Icon(Icons.settings,
                                  color: const Color.fromARGB(255, 0, 94, 85)),
                              title: Text("Paramètres du compte"),
                              trailing: Icon(Icons.chevron_right_rounded),
                              onTap: () {},
                            ),
                          ),
                        ),
                        controller.firebaseUser.value == null
                            ? SizedBox(
                                height: 80,
                                child: Center(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.login,
                                      color:
                                          const Color.fromARGB(255, 0, 94, 85),
                                    ),
                                    title: Text("Se Connecter"),
                                    onTap: () {
                                      Get.to(() => const LoginOrRegisterPage());
                                    },
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 80,
                                child: Center(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.logout,
                                      color:
                                          const Color.fromARGB(255, 0, 94, 85),
                                    ),
                                    title: Text("Se Déconnecter"),
                                    onTap: () {
                                      controller.logout();
                                    },
                                  ),
                                ),
                              ),
                      ],
                    ))
              ],
            );
          }),
    );
  }
}
