


import 'package:fexmonths/Components/Blue_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 showdailg(BuildContext context){
  return showDialog(
// the Success Dialog
    context: context,
    barrierColor: Colors.grey.withOpacity(0.8),
    builder: (BuildContext context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 95),

                    child: const Text('Success',style: TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.bold),)),
                Container(
                  margin: EdgeInsets.only(left: 48,),
                  child: IconButton(
                      onPressed: ()=>Navigator.pop(context), icon: Icon(CupertinoIcons.xmark_circle_fill,color: Colors.blue,)),
                ),

              ],
            ),
            Container(
              child: Image.asset("Images/Group 446.png"),
            ),
            Container(
              margin: EdgeInsets.only(top:10),

              child: Text("The coupon code",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,)),
            ),
            Container(
              child: Text("is Correct",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,)),
            ),
            Blue_Button(ButtonText: "Ok", height: 32, width: 100, Margintop: 10, Marginleft: 0, textStyle: TextStyle(color: Colors.white), buttonColor: MaterialStatePropertyAll<Color>(Colors.blue), Marginbottom: 0,onTap: ()=>Navigator.pop(context), MarginRight: 0,)
          ],
        ),
      ),
    ),
  );

}
