import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/textFiledwithButton.dart';
import '../Components/textWithbutton.dart';
import 'Alert.dart';
import 'InstallmentPlan.dart';
import 'Invoice_widget.dart';

class PayLater extends StatelessWidget {
  const PayLater({Key? key}) : super(key: key);

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

        title: Text("Installments Process",style: TextStyle(color: Colors.blue)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 40, left: 30, right: 25),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  /*border: Border.all(
                    color: Colors.grey.shade400
                  ),*/
                  borderRadius: const BorderRadius.all(Radius.circular(11))),
              //height: 200,
              width: double.infinity,
              child: const InvoiceWidget(
                invoiceName: 'Bill',
                itemCount: 3,
                heNumberandThename: '1-Nike',
                theMoney: '242',
                Subtotal: 'Subtotal',
                Subtotalcost: '4253',
                shipping: 'shipping',
                shippingCost: '4',
                disCount: 'DisCount',
                disCountCost: '3',
                Total: 'Total',
                TotalCost: '399393',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, left: 30, right: 25),

            child: const Text("Payment Method",style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
          ),
           textWithbutton(labelText: 'Select installment Method',onTap: () => InstallmentPlan(context), Width: 305, Marginleftbuttoon: 240,),
          Blue_Button(ButtonText: 'Ask the Agreement', height: 32, width: 160, Margintop: 20, Marginleft: 100, textStyle: const TextStyle(color: Colors.white), buttonColor: MaterialStatePropertyAll<Color>(Colors.blue),onTap: () => showdailg(context), Marginbottom: 0, MarginRight: 0,)
        ],
      )
      
    );
  }
}
