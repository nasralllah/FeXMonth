import 'package:fexmonths/Components/textWithbutton.dart';
import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/textFiledwithButton.dart';

shpping(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
               textWithbutton(labelText: "Economical: \$1.00", onTap: ()=>null, Width: 224, Marginleftbuttoon: 160),
                  textWithbutton(labelText: "Fast :\$4.00", onTap: ()=>null, Width: 224, Marginleftbuttoon: 160),
                  textWithbutton(labelText: "Taxi :\$7.00", onTap: ()=>null, Width: 224, Marginleftbuttoon: 160),
                  textWithbutton(labelText: "track :\$12.00", onTap: ()=>null, Width: 224, Marginleftbuttoon: 160),
                  textWithbutton(labelText: "External:\$30.00", onTap: ()=>null, Width: 224, Marginleftbuttoon: 160),


                  Blue_Button(ButtonText: "Ok", height: 32, width: 100, Margintop: 10, Marginleft: 0, textStyle: TextStyle(color: Colors.white), buttonColor: MaterialStatePropertyAll<Color>(Colors.blue), Marginbottom: 0,onTap: ()=>Navigator.pop(context), MarginRight: 0,)

                ],
              ),
            ),
          )),
    ),
  );
}
