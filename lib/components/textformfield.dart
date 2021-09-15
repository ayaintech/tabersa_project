import 'package:flutter/material.dart';
import 'package:tabersa_project/constant/constants.dart';
import 'responsive_ui.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;

  CustomTextField({
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    required this.icon,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
      borderRadius: BorderRadius.circular(5.0),
      elevation: large ? 10 : (medium ? 8 : 6),
      child: new Container(
        alignment: Alignment.center,
        height: 50.0,
        child: TextFormField(
          controller: widget.textEditingController,
          keyboardType: widget.keyboardType,
          cursorColor: Colors.green[200],
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon, color: kTextPrimaryColor, size: 24),
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 14.0, color: Color(0xFF999999)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: kTextPrimaryColor, width: 2.0)),
          ),
        ),
      ),
    );
  }
}
