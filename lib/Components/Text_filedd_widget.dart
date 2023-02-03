import 'package:flutter/material.dart';

class Textfiledd_widget extends StatelessWidget {
  const Textfiledd_widget({
    Key? key,
    required this.hinttText,
    required this.obbscureText,
  }) : super(key: key);

  final String hinttText;
  final bool obbscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obbscureText,
        onChanged: ((value) => ""),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            filled: true,
            hintText: hinttText,
            fillColor: Color(0xFFF2F4F8)));
  }
}
