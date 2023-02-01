import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/Home.dart';
import 'package:project2/Jobs.dart';
import 'package:project2/Profil.dart';
import 'package:project2/Services/BDService.dart';

import 'Authentification.dart';

class Statut2 extends StatefulWidget {
//  final Function(int) onchan;
  Statut2({
    Key? key,
    // required this.onchan,
  }) : super(key: key);

  _Statut2State createState() => _Statut2State();
}

class _Statut2State extends State<Statut2> {
  BdService _bdService = BdService();
  List<Widget> _widgets = [];
  int _indexSelected = 0;

  static const _navBarItems = [
    NavigationDestination(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.white,
      ),
      selectedIcon: Icon(Icons.home_rounded, color: Colors.white),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(
        Icons.work_outline,
        color: Colors.white,
      ),
      selectedIcon: Icon(Icons.work, color: Colors.white),
      label: 'Jobs',
    ),
  ];
  void initState() {
    super.initState();
    _bdService.term.then((term) => setState(() => _widgets.addAll([
          Material3BottomNav(
              onchanged1: (index) => setState(() => _indexSelected = index)),
          Jobs(
            ///items: List<String>.generate(10000, (index) => 'Item $index'),
            //onChanged1: (index) => setState(() => _indexSelected = index),
            term: term,
          ),
        ])));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _widgets.length != 0
            ? Scaffold(
                // appBar: AppBar(title: const Text('Material3 Bottom Navbar')),
                body: Center(child: _widgets.elementAt(_indexSelected)),
                bottomNavigationBar: NavigationBar(
                  backgroundColor: Colors.blue,
                  animationDuration: const Duration(seconds: 1),
                  selectedIndex: _indexSelected,
                  onDestinationSelected: (index) {
                    setState(() {
                      _indexSelected = index;
                    });
                  },
                  destinations: _navBarItems,
                ),
              )
            : SafeArea(
                child: Scaffold(
                body: Center(child: Text('Loading...')),
              )));

    /*return Scaffold(
      // appBar: AppBar(title: const Text('Material3 Bottom Navbar')),
      body: Center(child: _widgets.elementAt(_indexSelected)),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.blue,
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _indexSelected,
        onDestinationSelected: (index) {
          setState(() {
            _indexSelected = index;
          });
        },
        destinations: _navBarItems,
      ),
    );*/
  }
}
