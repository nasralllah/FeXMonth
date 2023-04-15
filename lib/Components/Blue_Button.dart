import 'package:flutter/material.dart';
class Blue_Button extends StatelessWidget {
   Blue_Button({
    Key? key, required this.ButtonText, required this.height, required this.width, required this.Margintop, required this.Marginleft,this.onTap
  }) : super(key: key);
 final String ButtonText;
  final double height;
  final double width;
  final double Margintop;
  final double Marginleft;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(left: Marginleft, top: Margintop),
        child: TextButton(
          onPressed: onTap,
          style:  ButtonStyle(
              elevation: MaterialStatePropertyAll(3),
              shadowColor: MaterialStatePropertyAll(Colors.blue.shade800),
              //  side: MaterialStatePropertyAll(BorderSide(color: Colors.blue)),
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
              shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30)
                      )
                  )
              )
          ),
          child:  Text(ButtonText ,style: const TextStyle(color: Colors.white)),

        ));
  }
}
