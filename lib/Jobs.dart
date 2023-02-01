import 'package:flutter/material.dart';
import 'package:project2/jobList.dart';
import 'package:provider/provider.dart';

import 'Models/JobModel.dart';
import 'Profil.dart';
import 'jobeurList.dart';

class Jobs extends StatelessWidget {
  //final Function(int) onChanged1;

  String term = "";
  //final List<String> items;

  Jobs({
    Key? key,
    //required this.onChanged1,
    required this.term,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _jobs = Provider.of<List<Job>>(context);
    return Scaffold(
        backgroundColor: Colors.lightBlue[800],
        appBar: AppBar(title: Text("Listes Jobs")),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              JobList(),
            ],
          ),
        ));
  }
}
