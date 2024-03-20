import 'package:flutter/material.dart';

import '../view/base_widget/InvoiceWidgetDesign2.dart';
import 'Invoice_widget.dart';

class InvoiceaskAgreement extends StatefulWidget {
  const InvoiceaskAgreement({Key? key}) : super(key: key);

  @override
  State<InvoiceaskAgreement> createState() => _InvoiceaskAgreementState();
}

class _InvoiceaskAgreementState extends State<InvoiceaskAgreement> {
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

        title: Text("658769876",style: TextStyle(color: Colors.blue)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(11))
              ),
              child: Center(child:
              RichText(
                text: const TextSpan(
                    text: "Status:",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Asking Agreement... ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          )
                      )
                    ]
                ),

              )
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),

                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: const InvoicewidgetDesign2(invoiceName: "Installment Information", itemCount: 7)
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),

              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(11))
              ),
              child: const InvoiceWidget(
                  invoiceName: "Bill Details",
                  itemCount: 5,
                  heNumberandThename: ".Nike",
                  theMoney: "435345",
                  Subtotal: "Subtotal",
                  Subtotalcost: 45345.0,
                  shipping: "shipping",
                  shippingCost: "43543",
                  disCount: "disCount",
                  disCountCost: "342",
                  Total: "Total",
                  TotalCost: "2345"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
