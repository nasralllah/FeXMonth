import 'package:flutter/material.dart';
import 'Constens.dart';

class bottom_menu_Icons extends StatelessWidget {
  const bottom_menu_Icons({
    Key? key, required this.onpress, required this.iconassetImage,
  }) : super(key: key);
  final VoidCallback onpress;
  final AssetImage iconassetImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onpress,
        child:CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: ImageIcon(iconassetImage,color: KIconcardColor),
        )
    );
  }
}
