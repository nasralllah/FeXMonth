import 'package:fexmonths/Pay_ment/payLater.dart';
import 'package:fexmonths/Pay_ment/payNow.dart';
import 'package:fexmonths/Pay_ment/shppingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Components/textFiledwithButton.dart';
import '../Components/textWithbutton.dart';
import 'addAddress.dart';
import 'Invoice_widget.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 35, right: 20),
                child: const Text("Have a Coupon?",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
              const textFiledWithbutton(
                labelText: "Coupon Code...",
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 35, right: 20),
                child: const Text("Select Your Address?",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
               textWithbutton(
                labelText: "${Strings.toString()}", onTap: ()=> showDialogselect(context), Width: 305, Marginleftbuttoon: 240,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 35, right: 20),
                child: const Text("Shipping",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
               textWithbutton(onTap: () => shpping(context),
                labelText: "Select A shipping Method", Width: 305, Marginleftbuttoon: 240,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 40, right: 20),
                child: const Text("Note?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 30, right: 25),
                child: const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Write a note for the driver...",
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      borderSide: BorderSide(
                          style: BorderStyle.none, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 30, right: 25),
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
              Container(
                height: 10,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 80.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              border: Border.all(color: Colors.grey.shade400),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    //offset: Offset(0, -1),
                    spreadRadius: 4,
                    blurRadius: 30)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 32,
                  width: 130,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey[300]),
                        alignment: Alignment.center,
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))))),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PayLater(),
                        )),
                    child: const Center(
                        child: Text(
                      "Pay Later",
                      style: TextStyle(color: Colors.blue),
                    )),
                  ),
                ),
                Container(
                  height: 32,
                  width: 130,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        alignment: Alignment.center,
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))))),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PayNow(),
                        )),
                    child: const Center(
                        child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
