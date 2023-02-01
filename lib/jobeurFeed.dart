import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project2/Models/JobModel.dart';
import 'package:project2/Models/JobeurModel.dart';

import 'Jobs.dart';
import 'Profil.dart';

class jobeurFeed extends StatelessWidget {
  final Jobeur? jobeur;
  const jobeurFeed({this.jobeur});

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
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.network(
                        "https://raw.githubusercontent.com/fluttertemplates-dev/onboarding_screen/master/assets/image3.png",
                        width: 100,
                        fit: BoxFit.cover),
                  ),
                  Column(
                    children: [
                      Text(
                        jobeur!.JobeurName!.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        jobeur!.JobeurCity!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30.0),
                  Expanded(
                    child: RatingBar.builder(
                      initialRating: 3,
                      itemSize: 20.0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Profils(
                      jobeur: jobeur,
                    )));
          },
        ),
        Divider(
          color: Colors.white,
          thickness: 0,
        )
      ],
    );
  }
}
