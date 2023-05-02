
import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/textWithButtonOrders.dart';
import 'invoiceOrders.dart';
class myOreders extends StatefulWidget {
  const myOreders({Key? key}) : super(key: key);

  @override
  State<myOreders> createState() => _myOredersState();
}

class _myOredersState extends State<myOreders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading:  IconButton(
          icon:Icon(Icons.arrow_back_ios_new,color: Colors.blue) ,
          onPressed:() => Navigator.pop(context) ,

        ),

        title: Text("My Orders",style: TextStyle(color: Colors.blue)),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Stack(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                  width: 300,
                  height: 40,
                 
                  child: TextField(decoration: InputDecoration(labelText: "Serch",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),) ,
                ),
                Blue_Button(ButtonText: "Search", height: 30, width: 70, Margintop: 34.5, Marginleft: 255, textStyle: TextStyle(color: Colors.white), buttonColor: MaterialStatePropertyAll<Color>(Colors.blue), Marginbottom: 0, MarginRight: 0,)

              ],
              )
            ],
          ),
          textWithButtondeleted(
            labelText: '18393849',
            MarginleftButton: 195,
            MargintopButton: 5,
            MarginbottomButton: 0,
            onTap: () {  },
            ButtonText: 'Shipping',
            textStyle: TextStyle(color: Colors.blue),
            textStyle1: TextStyle(color: Colors.white),
            ButtonText1: '\$1341.00',
            ButtonText2: 'Today, 12th Feb, 2018',
            textStyle2: TextStyle(color: Colors.white,fontSize: 9),
            ontapContainer: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const InvoiceOrders(),)),
          )

        ],
      ),
    );
  }
}

