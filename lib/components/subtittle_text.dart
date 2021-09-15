import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String subtitle;
  final Color colorText;
  final String fontType;

  SubtitleText(this.subtitle, this.colorText, this.fontType);

  @override
  Widget build(BuildContext context) {
    return new Text(subtitle,
        style: TextStyle(
            fontSize: 16,
            color: colorText,
            fontWeight: FontWeight.bold,
            fontFamily: fontType));
  }
}
