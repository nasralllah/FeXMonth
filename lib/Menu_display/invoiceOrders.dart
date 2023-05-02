import 'package:fexmonths/Pay_ment/Invoice_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/InvoiceWidgetDesign2.dart';

class InvoiceOrders extends StatelessWidget {
  const InvoiceOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CheckOut'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                text: TextSpan(
                  text: "Status:",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "  Shipping..",
                      style: TextStyle(
                        color: Colors.yellowAccent,
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
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: InvoicewidgetDesign2(invoiceName: 'Order Information', itemCount: 7,)
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),

                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: InvoiceWidget(
                    invoiceName: "Bill Details",
                    itemCount: 6,
                    heNumberandThename: ".Nike",
                    theMoney: "2442",
                    Subtotal: "Subtotal",
                    Subtotalcost: "425", shipping: "shipping",
                    shippingCost: "245425", disCount: "DisCount",
                    disCountCost: "55", Total: "Total",
                    TotalCost: "4433453"
                )
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: InvoicewidgetDesign2(invoiceName: 'Address Information ', itemCount: 7,)
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20 ,horizontal: 30),
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 10, bottom: 5),
                        child: Text(
                          "Shipping From",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 5, left: 10, bottom: 13),

                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder:(context, index) {
                          return Row(
                            children:  [
                              Padding(
                                padding: EdgeInsets.only(top: 5, left: 5),
                                child: Text(
                                  "${index+1}${435}",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5, left: 10),
                                child: Text(
                                  "4435",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        }, ),

                      Divider(
                        endIndent: 20,
                        indent: 20,
                        color: Colors.grey.shade900,
                      ),
                      Row(
                        children:  const [
                          Padding(
                            padding: EdgeInsets.only(top: 5, left: 40),
                            child: Text(
                              "Subtotal",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, left: 30),
                            child: Text(
                              "464546y",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ])
            ),


          ],
        ),
      ),
    );
  }
}
