
import 'package:flutter/material.dart';

class InvoicewidgetDesign2 extends StatelessWidget {
  const InvoicewidgetDesign2(
      {Key? key, required this.invoiceName, required this.itemCount})
      : super(key: key);

  final String invoiceName;
  final int itemCount;
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
          return Row(
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

          );
        },
      ),
    ]);
  }
}
