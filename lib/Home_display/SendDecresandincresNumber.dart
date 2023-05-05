import 'package:fexmonths/Constens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../API_Backend/Provider/AddQuantityProvider.dart';
class increesAndDecress extends StatefulWidget {
  const increesAndDecress({
    Key? key,
  }) : super(key: key);



  @override
  State<increesAndDecress> createState() => _increesAndDecressState();
}


class _increesAndDecressState extends State<increesAndDecress> {
  void incressNumber(){
    if(theNumber>=0){
      setState(() {
        addQuantati(Idcart);
        theNumber++;
      });
    }


  }
  void decressNumber(){
    // ignore: avoid_print
    if(theNumber>=1){
      setState(() {
        subQuantsti(Idcart);
        theNumber--;
        print("dsaklflsakdf");

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