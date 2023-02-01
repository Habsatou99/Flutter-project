import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/Home.dart';
import 'package:project2/Models/UserModel.dart';
import 'package:project2/Navigation2.dart';
import 'package:project2/Services/BDService.dart';
import 'package:project2/Services/UserService.dart';

import 'Authentification.dart';

class Statut extends StatefulWidget {
  Statut({Key? key}) : super(key: key);

  _StatutState createState() => _StatutState();
}

class _StatutState extends State<Statut> {
  UserService _userService = UserService();
  BdService _bdService = BdService();
  List<Widget> _widgets = [];
  int _indexSelected = 0;
  String _email = "";
  String _password = "";
  void initState() {
    super.initState();
    _bdService.term.then((term) => setState(() => _widgets.addAll([
          SignInPage2(
            onChanged: (index, value, value1) => setState(() {
              _indexSelected = index;
              _email = value;
              _password = value1;

              _userService
                  .auth(UserModel(uid: "", email: _email, password: _password))
                  .then((value) => print(value.toJson()));
            }),
          ),
          Statut2(/*onchan: (index)=>setState(() => _indexSelected = index),*/)
        ])));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.length == 0
          ? SafeArea(
              child: Scaffold(
              body: Center(child: Text('Loading...')),
            ))
          : _widgets.elementAt(_indexSelected),
    );
  }
}
