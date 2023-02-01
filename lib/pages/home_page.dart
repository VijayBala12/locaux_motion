import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 94, 85),
        leading: IconButton(
          onPressed: () {
            // Do something when the menu icon is pressed
          },
          icon: Icon(Icons.menu),
          ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
          child: Text(
        "Connecté en tant que: " + user.email!,
        style: TextStyle(fontSize: 20),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'Itinéraire',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 100, 143, 122),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}