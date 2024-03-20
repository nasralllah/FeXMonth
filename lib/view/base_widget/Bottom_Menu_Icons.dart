import 'package:flutter/material.dart';
import 'package:fexmonths/Constens.dart';

class bottom_menu_Icons extends StatelessWidget {
  const bottom_menu_Icons({
    Key? key,
    required this.onpress,
    required this.iconassetImage, required this.Size,
  }) : super(key: key);
  final VoidCallback onpress;
  final AssetImage iconassetImage;
  final double Size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onpress,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: ImageIcon(iconassetImage, color: KIconcardColor, size: Size),
        ));
  }
}
