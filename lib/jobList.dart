import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:project2/Jobeurs.dart';
import 'package:project2/jobFeed.dart';
import 'package:provider/provider.dart';

import 'Models/JobModel.dart';

class JobList extends StatelessWidget {
  JobList({Key? key});

  @override
  Widget build(BuildContext context) {
    final _jobs = Provider.of<List<Job>>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate((_, index) {
        return OpenContainer(
          transitionDuration: const Duration(milliseconds: 500),
          transitionType: ContainerTransitionType.fadeThrough,
          closedColor: Colors.lightBlue.shade800,
          openColor: Colors.blue,
          closedBuilder: (_, __) => jobFeed(job: _jobs[index]),
          openBuilder: (_, __) => SecondPage(),
        );
      }, childCount: _jobs.length),
    );
  }
}
