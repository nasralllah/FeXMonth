import 'package:flutter/material.dart';


import '../Pay_ment/InvoiceaskAgreement.dart';
import '../view/base_widget/Blue_Button.dart';
import '../view/base_widget/textWithButtonOrders.dart';
import 'InstallmentInvoiceRunning.dart';
import 'InvoiceDone.dart';
import 'invoiceOrders.dart';

class MyInstallment extends StatefulWidget {
  const MyInstallment({Key? key}) : super(key: key);

  @override
  State<MyInstallment> createState() => _MyInstallmentState();
}

class _MyInstallmentState extends State<MyInstallment> {
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

        title: Text("My Installments",style: TextStyle(color: Colors.blue)),
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
    ButtonText: 'Agreemnet',
    textStyle: TextStyle(color: Colors.blue,fontSize: 12.9,),
    textStyle1: TextStyle(color: Colors.white),
    ButtonText1: '\$1341.00',
    ButtonText2: 'Today, 12th Feb, 2018',
    textStyle2: TextStyle(color: Colors.white,fontSize: 9),
      ontapContainer: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const InsallmentDone(),))
      ,
    )

    ],
    ),
    );
  }
}
