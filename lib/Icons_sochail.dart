import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class sochil_Icons extends StatelessWidget {
  const sochil_Icons({
    Key? key,required this.image, required this.onpress,
  }) : super(key: key);
  final String image;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onpress,
        child: CircleAvatar(
          backgroundColor: Color(0xFFF2F4F8),
          radius: 30,
          child: ImageIcon(
            AssetImage(image),
            color: Colors.black,
          )
        )
    );
  }
}
