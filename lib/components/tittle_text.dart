import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final Color colorText;
  final String fontType;

  TitleText(this.title, this.colorText, this.fontType);

  @override
  Widget build(BuildContext context) {
    return new Text(title,
        style: TextStyle(
            fontSize: 28,
            color: colorText,
            fontWeight: FontWeight.bold,
            fontFamily: fontType));
  }
}
