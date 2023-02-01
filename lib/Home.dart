import 'package:flutter/material.dart';
import 'package:project2/Appabar.dart';
import 'package:project2/Navigation.dart';
import 'package:project2/Services/UserService.dart';

import 'Appabar.dart';

class Material3BottomNav extends StatefulWidget {
  final Function(int) onchanged1;

  Material3BottomNav({
    Key? key,
    required this.onchanged1,
  }) : super(key: key);
  @override
  State<Material3BottomNav> createState() => _Material3BottomNavState();
}

class _Material3BottomNavState extends State<Material3BottomNav> {
  AssetImage assetImage = AssetImage('images/jobs-3599406_1280.jpg');
  UserService _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[800],
      appBar: AppBar(
        leading: PopupMenuButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<Menu>>[
                PopupMenuItem<Menu>(
                  child: Text('Sign Out'),
                  onTap: () async {
                    await _userService.logout();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Statut()),
                        (route) => false);
                  },
                ),
              ];
            }),
        /* title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            /* const Text(
              "DailyJob",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),*/
          ]),
        ),
        actions: [
          IconButton(
              onPressed: () => null,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],*/
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Text(
                "Welcome to Daily Job!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),*/
              _gap(),
              _gap(),
              Image(
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/fluttertemplates-dev/onboarding_screen/master/assets/image3.png')),
              _gap(),
              Text(
                "copyright@DailyJob",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )),
      )),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}

class Menu {
  Menu();
  final List<String> _menuItems = <String>[
    'About',
    'Contact',
    'Settings',
    'Sign Out',
  ];
}
