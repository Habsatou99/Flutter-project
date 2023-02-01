import 'package:flutter/material.dart';

import 'jobeurList.dart';

class SecondPage extends StatelessWidget {
  //final int heroTag;
  SecondPage({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.lightBlue[800],
          appBar: AppBar(title: Text("Workers")),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                JobeurList(),
              ],
            ),
          )),
    );
  }
}
