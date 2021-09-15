import 'package:flutter/material.dart';
import 'package:tabersa_project/constant/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback press;

  PrimaryButton({required this.title, required this.press});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(30.0),

      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        onPrimary: Colors.black,
        elevation: 15.0,
        shadowColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        minimumSize: Size(MediaQuery. of(context). size. width, 50),
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
      onPressed: press,
      child: Text(
        title,
        style: TextStyle(
          color: kTextSecondaryColor,
          fontSize: 16,
          fontFamily: 'Asap',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    );
    
  }
}
