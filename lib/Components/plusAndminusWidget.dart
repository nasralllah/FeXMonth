import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class plusAndminusWidget extends StatefulWidget {
   plusAndminusWidget({
    Key? key, required this.TheNumber,
  }) : super(key: key);

   int TheNumber;

  @override
  State<plusAndminusWidget> createState() => _plusAndminusWidgetState();
}

class _plusAndminusWidgetState extends State<plusAndminusWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
             setState(() {
               widget.TheNumber++;
              print( widget.TheNumber);
            });
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

          child: Text('${widget.TheNumber}',
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
        GestureDetector(
          onTap: () {
             setState(() {
               widget.TheNumber--;
              print( widget.TheNumber);
            });
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