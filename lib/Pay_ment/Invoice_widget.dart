import 'package:flutter/material.dart';
class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({
    Key? key, required this.invoiceName, required this.itemCount, required this.heNumberandThename, required this.theMoney, required this.Subtotal, required this.Subtotalcost, required this.shipping, required this.shippingCost, required this.disCount, required this.disCountCost, required this.Total, required this.TotalCost,
  }) : super(key: key);

 final String invoiceName ;
 final int itemCount ;
 final String heNumberandThename;
 final String theMoney;
 final String Subtotal;
  final String Subtotalcost;
  final String shipping;
  final String shippingCost;
  final String disCount;
  final String disCountCost;
  final String Total;
  final String TotalCost;




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.only(top: 15, left: 20,bottom: 13),
          child: Text(
            invoiceName,
            style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder:(context, index) {
            return Row(
              children:  [
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    heNumberandThename,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    theMoney,
                    style: const TextStyle(
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
          children:  [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 40),
              child: Text(
                Subtotal,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 30),
              child: Text(
                Subtotalcost,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children:  [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 40),
              child: Text(
                shipping,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 30),
              child: Text(
                shippingCost,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children:  [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 40),
              child: Text(
               disCount,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 80,
            ),
             Padding(
              padding: EdgeInsets.only(top: 5, left: 30),
              child: Text(
                disCountCost,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Divider(
          endIndent: 30,
          indent: 30,
          color: Colors.grey.shade900,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 50),
              child: Text(
                Total,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 40),
              child: Text(
                TotalCost,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
