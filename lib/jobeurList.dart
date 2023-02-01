import 'package:flutter/material.dart';
import 'package:project2/Models/JobeurModel.dart';
import 'package:project2/jobFeed.dart';
import 'package:provider/provider.dart';

import 'Models/JobModel.dart';
import 'jobeurFeed.dart';

class JobeurList extends StatelessWidget {
  JobeurList({Key? key});

  @override
  Widget build(BuildContext context) {
    final _jobeurs = Provider.of<List<Jobeur>>(context);
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
      return jobeurFeed(jobeur: _jobeurs[index]);
    }, childCount: _jobeurs.length));
  }
}
