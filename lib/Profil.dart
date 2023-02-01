import 'package:flutter/material.dart';

import 'Models/JobeurModel.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Models/ProfilModel.dart';

class Profils extends StatelessWidget {
  //final int heroTag;
  final Jobeur? jobeur;
  //final Profil? profil;
  Profils({
    this.jobeur, //this.profil
    //required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[800],
      appBar: AppBar(title: Text("Profil")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              //tag: heroTag,
              child: Image.network(
                  "https://raw.githubusercontent.com/fluttertemplates-dev/onboarding_screen/master/assets/image3.png"),
            ),
          ),
          Text(jobeur!.JobeurName!.toUpperCase() +
              " " +
              jobeur!.JobeurLastName!.toUpperCase()),
          const SizedBox(height: 16),
          Text(jobeur!.JobeurCity!),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 40.0),
              FloatingActionButton.extended(
                onPressed: () async {
                  final url = Uri.parse('tel:+${jobeur!.JobeurNumber!}');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    //throw 'could not lauch $url';
                  }
                },
                elevation: 0,
                heroTag: 'Contact',
                label: const Text("Contact"),
                icon: const Icon(Icons.contact_phone),
              ),
              const SizedBox(width: 40.0),
              FloatingActionButton.extended(
                onPressed: () async {
                  final url = Uri.parse('sms:++${jobeur!.JobeurNumber!}');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    //throw 'could not lauch $url';
                  }
                },
                label: const Text("Message"),
                elevation: 0,
                heroTag: 'Message',
                icon: const Icon(Icons.message),
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
