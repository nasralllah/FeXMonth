import 'package:flutter/material.dart';
import 'Constens.dart';
class homepagecontent extends StatefulWidget {
  const homepagecontent({Key? key}) : super(key: key);

  @override
  State<homepagecontent> createState() => _homepagecontentState();
}

class _homepagecontentState extends State<homepagecontent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
          flexibleSpace:
           Row(
           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
             Container(
             // alignment: Alignment.centerLeft,
               margin: EdgeInsets.only(top: 18,left: 70),
               child: Icon(
                 Icons.notifications_on_outlined,
                 color: KIconAppbarColor,
               ),
             ),
               Container(
                 margin:  EdgeInsets.only(top: 18,left: 70),
                 child: Image(
              //   alignment:Alignment.center,
                   image: AssetImage("Images/Everything Everywhere All At Once (2022).jpg"),
                 fit: BoxFit.cover,
                 ),
               ),
               Container(
               //  alignment: Alignment.centerRight,
                 margin: EdgeInsets.only(top: 18,left: 70),
                 child: Icon(
                     Icons.notifications_on_outlined,
                   color: KIconAppbarColor,

                 ),
               ),
               Container(
                // alignment: Alignment.centerRight,
                 margin: EdgeInsets.only(top: 18,left: 70),
                 child: Icon(
                     Icons.notifications_on_outlined,
                   color: KIconAppbarColor,

                 ),
               ),
             ],
           )
       ),
   body: Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(colors: [Colors.lightBlue,Colors.lightBlue.shade900])
     ),
   ),

    );
  }
}
