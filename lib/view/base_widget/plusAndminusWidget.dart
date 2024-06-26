import 'package:fexmonths/Constens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class plusAndminusWidget extends StatefulWidget {
   plusAndminusWidget({
    Key? key,
  }) : super(key: key);



  @override
  State<plusAndminusWidget> createState() => _plusAndminusWidgetState();
}


class _plusAndminusWidgetState extends State<plusAndminusWidget> {
  void incressNumber(){
if(theNumber>=0){
    setState(() {
      theNumber++;
    });
  }}
  void decressNumber(){
    if(theNumber>=1){

      setState(() {
      theNumber--;
    });
  }
    }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            incressNumber();
          },
          child: Container(
            margin: EdgeInsets.only(right: 8,left: 8),
            //color: Colors.red,
            child: SizedBox.square(
              dimension: 30,
              child: Icon(CupertinoIcons.plus_app,
                  size: 30, color: Colors.blue),
            ),
          ),
        ),
        Container(

          child: Text('$theNumber',
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
        GestureDetector(
          onTap: () {
            decressNumber();
          },
          child: Container(
            margin: EdgeInsets.only(right: 8,left: 8),

            //color: Colors.red,
            child: SizedBox.square(
              dimension: 30,
              child: Icon(CupertinoIcons.minus_rectangle,
                  size: 30, color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}