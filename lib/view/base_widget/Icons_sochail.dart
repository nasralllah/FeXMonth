import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class sochil_Icons extends StatelessWidget {
  const sochil_Icons({
    Key? key,
    required this.image,
    required this.onpress,
  }) : super(key: key);
  final String image;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onpress,
        child: CircleAvatar(
            backgroundColor: Color(0xFFF2F4F8),
            radius: 35.r,
            child: ImageIcon(
              AssetImage(image),
              color: Colors.black,
            )));
  }
}
