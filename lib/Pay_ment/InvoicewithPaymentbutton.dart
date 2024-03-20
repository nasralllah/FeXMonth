import 'package:flutter/material.dart';

import '../view/base_widget/Blue_Button.dart';
class InvoicewithPayment extends StatelessWidget {
   InvoicewithPayment({Key? key, required this.invoiceName, required this.itemCount,this.ontap}) : super(key: key);

  final String invoiceName;
  final int itemCount;
   VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(top: 15, left: 10, bottom: 5),
        child: Text(
          invoiceName,
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      ListView.builder(
        padding: EdgeInsets.only(top: 5, left: 10, bottom: 13),

        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 5),
                    child: Text(
                      "Payment method",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 0),
                    child: Text(
                      "2023/1/12 15:45",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),

                ],
              ),

            ],
          );

        },

      ),
      Blue_Button(
          ButtonText: "Pay", height: 32, width: 110, Margintop: 5, Marginleft: 180, textStyle: TextStyle(color: Colors.blue), buttonColor: MaterialStatePropertyAll<Color>(Colors.white), Marginbottom: 10, MarginRight: 0,onTap:ontap ,)


    ]);
  }
}
