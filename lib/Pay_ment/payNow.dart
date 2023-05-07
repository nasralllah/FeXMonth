import 'package:fexmonths/Components/textFiledwithButton.dart';
import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/Text_filedd_widget.dart';
import '../Components/textWithbutton.dart';
import 'Invoice_widget.dart';
import 'PaymentMoethod.dart';

bool payMethodsvisible = true;

class PayNow extends StatefulWidget {
  const PayNow({Key? key}) : super(key: key);

  @override
  State<PayNow> createState() => _PayNowState();
}

class _PayNowState extends State<PayNow> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title:
            const Text("Payment Process", style: TextStyle(color: Colors.blue)),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  Subtotalcost: 45345.0,
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
              child: const Text("Payment Method",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ),
            textWithbutton(
              title: 'Select Payment Method',
              onTap: () {
                setState(() {});
                onnavgatortapeds(context);
              },
              Width: 305,
              Marginleftbuttoon: 240, Margin:  EdgeInsets.only(top: 15,left: 5),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 25),
              child: const Text(
                  'Please send the cost for this account : 54798075  in Al-Kuraimi Bank, and record the transferring number in the next input.',
                  style: TextStyle(color: Colors.blue)),
            ),
            Visibility(
              visible: payMethodsvisible,
              child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 30, right: 25),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(30.0),
                              left: Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        labelText: "Transferring Number"),
                  )),
            ),
            Blue_Button(
              ButtonText: 'Pay',
              height: 32,
              width: 160,
              Margintop: 20,
              Marginleft: 100,
              textStyle: const TextStyle(color: Colors.white),
              buttonColor: const MaterialStatePropertyAll<Color>(Colors.blue),
              onTap: () => setState(() {}),
              Marginbottom: 10,
              MarginRight: 0,
            ),
          ],
        ),
      ),
    );
  }
}
