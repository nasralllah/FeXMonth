import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/textFiledwithButton.dart';
import '../Components/textWithbutton.dart';
import '../Home_display/CartDisplay.dart';
import 'Alert.dart';
import 'Alet_CheckOut.dart';
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
      margin: const EdgeInsets.only(top: 15, left: 30, right: 25),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            /*border: Border.all(
                    color: Colors.grey.shade400
                  ),*/
            borderRadius:
            const BorderRadius.all(Radius.circular(11))),
        //height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 10, bottom: 5),
              child: Text(
                "Bill",
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
              itemCount: cartDisplaylist!.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        "${index + 1}-${cartDisplaylist![index].product.title}",
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
                        cartDisplaylist![index].total == null
                            ? ""
                            : "\$${cartDisplaylist![index].total}"
                            "  x ${cartDisplaylist![index].quantity}",
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              },
            ),
            Divider(
              endIndent: 20,
              indent: 20,
              color: Colors.grey.shade900,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 40),
                  child: Text(
                    "Subtotal",
                    style: TextStyle(
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
                    "${cartDisplaylist![0].total == null ? 0 : cartDisplaylist![0].total}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 40),
                  child: Text(
                    "shipping",
                    style: TextStyle(
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
                    ShippingOptionList[0].costPerKm == null
                        ? ""
                        : "${ShippingOptionList[0].costPerKm}",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 40),
                  child: Text(
                    "disCount",
                    style: TextStyle(
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
                    '${cartDisplaylist![0].product.discount ?? 0}',
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
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 50),
                  child: Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 40),
                  child: Text(
                    "19983",
                    // '${(cartDisplaylist[0].total.toDouble()+ShippingOptionList[0].costPerKm-cartDisplaylist[0].product.discount)}' ,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

    Container(
    height: 10,
    ),
          ],
      )
    )
    ),
          Container(
            margin: const EdgeInsets.only(top: 40, left: 30, right: 25),

            child: const Text("Payment Method",style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
          ),
          textWithbutton(title: 'Select installment Method',onTap: () => InstallmentPlan(context), Width: 305, Marginleftbuttoon: 240, Margin:  EdgeInsets.only(top: 15,left: 5),),
          Blue_Button(ButtonText: 'Ask the Agreement', height: 32, width: 160, Margintop: 20, Marginleft: 100, textStyle: const TextStyle(color: Colors.white), buttonColor: MaterialStatePropertyAll<Color>(Colors.blue),onTap: () => showdailg(context), Marginbottom: 0, MarginRight: 0,)

        ]
    )
    );
  }
}
