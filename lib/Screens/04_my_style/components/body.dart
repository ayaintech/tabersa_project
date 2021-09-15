import 'package:flutter/material.dart';
import 'package:tabersa_project/constant/constants.dart';

class Body extends StatelessWidget {
  // const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Container(
        color: kBackgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: new Text("My Style Page"),
      ),
    );
  }
}
