import 'package:fexmonths/Constens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DecressIncressWidget extends StatefulWidget {
  DecressIncressWidget({
    Key? key, required this.cartnum,
  }) : super(key: key);

late final int cartnum;

  @override
  State<DecressIncressWidget> createState() => _DecressIncressWidgetState();
}


class _DecressIncressWidgetState extends State<DecressIncressWidget> {
  void incressNumber(){
    if(widget.cartnum>=0){
      setState(() {
        widget.cartnum++;
      });
    }}
  void decressNumber(){
    if(widget.cartnum>=1){

      setState(() {
        widget.cartnum--;
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

          child: Text('${widget.cartnum}',
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