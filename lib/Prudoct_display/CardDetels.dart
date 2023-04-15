
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

                child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim venia Ut enim ad minLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniaim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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