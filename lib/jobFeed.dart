import 'package:flutter/material.dart';
import 'package:project2/Models/JobModel.dart';

import 'Jobeurs.dart';
import 'Jobs.dart';
import 'Profil.dart';

class jobFeed extends StatelessWidget {
  final Job? job;
  const jobFeed({this.job});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*Container(
          //height: MediaQuery.of(context).size.height * 0.25,
          child: Text(
            job!.JobName!,
          ),
        )*/
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    "https://raw.githubusercontent.com/fluttertemplates-dev/onboarding_screen/master/assets/image3.png",
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  job!.JobName!.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(width: 150.0),
                const Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          // onTap: () {
          //   Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (context) => SecondPage()));
          // },
        ),
        const Divider(
          color: Colors.white,
          thickness: 0,
        )
      ],
    );
  }
}
