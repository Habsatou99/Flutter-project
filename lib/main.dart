import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2/Appabar.dart';
import 'package:project2/Authentification.dart';
import 'package:project2/Home.dart';
import 'package:project2/Jobs.dart';
import 'package:project2/Models/JobeurModel.dart';
import 'package:project2/Models/ProfilModel.dart';
import 'package:project2/Navigation.dart';
import 'package:project2/Navigation2.dart';
import 'package:project2/Profil.dart';
import 'package:project2/Services/BDService.dart';
import 'package:project2/Services/UserService.dart';
import 'package:project2/jobeurList.dart';
import 'package:provider/provider.dart';

import 'Jobeurs.dart';
import 'Models/JobModel.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    StreamProvider<List<Job>>.value(value: BdService().jobs, initialData: []),
    StreamProvider<List<Jobeur>>.value(
        value: BdService().jobeurs, initialData: []),
    /* StreamProvider<List<Profil>>.value(
        value: BdService().profils, initialData: []),*/
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  //MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Statut());
  }
}
