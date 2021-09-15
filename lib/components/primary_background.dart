import 'package:flutter/material.dart';
import 'package:tabersa_project/constant/constants.dart';

class PrimaryBG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.tightForFinite(),
      decoration: BoxDecoration(
        color: kBackgroundColor,
      ),
    );
  }
}
