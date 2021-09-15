import 'package:flutter/material.dart';
import 'package:tabersa_project/constant/constants.dart';
import 'responsive_ui.dart';

class CustomTextField2 extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;

  CustomTextField2({
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    this.obscureText = false,
  });

  @override
  State<CustomTextField2> createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  late double _width;

  late double _pixelRatio;

  late bool large;

  late bool medium;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      color: Colors.transparent,
      // borderRadius: BorderRadius.circular(0.0),
      // elevation: large ? 10 : (medium ? 8 : 6),
      child: new Container(
          alignment: Alignment.center,
          height: 60.0,
          child: new Theme(
            data: new ThemeData(
                primaryColor: Colors.white, hintColor: Colors.green),
            child: TextFormField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'Asap',
                fontWeight: FontWeight.bold,
              ),
              controller: widget.textEditingController,
              keyboardType: widget.keyboardType,
              cursorColor: kPrimaryColor,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[300],                  
                ),
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
          )),
    );
  }
}
