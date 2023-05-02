
import 'package:flutter/material.dart';

import 'Single_Product.dart';

class CardDetels extends StatelessWidget {
  const CardDetels({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cadrVisibleDetails,

      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 330,
        constraints: const BoxConstraints(
          maxHeight: 300,
        ),
        child: Card(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius:
              BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                child: const Text("Description",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
              ),
              Container(

                margin: EdgeInsets.only(left: 22, top: 10, right: 22),

                child:  Text(
                    SingleProductModelList![0].attributes.description,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        textBaseline: TextBaseline.alphabetic
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}