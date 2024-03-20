
import 'package:flutter/material.dart';

class OnbordingButtons extends StatelessWidget {
  const OnbordingButtons({
    Key? key, required this.Onpressd, required this.Texts, required this.Colorss, required this.TextColor,
  }) : super(key: key);

  final VoidCallback Onpressd;
  final String Texts;
  final Color Colorss;
  final Color TextColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextButton(

        onPressed: Onpressd,
        child: Text(Texts,style: TextStyle(color:TextColor)),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colorss),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            )
        ),
      ),
    );
  }
}
