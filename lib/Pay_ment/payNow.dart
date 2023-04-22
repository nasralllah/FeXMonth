import 'package:fexmonths/Components/textFiledwithButton.dart';
import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/Text_filedd_widget.dart';
import '../Components/textWithbutton.dart';
import 'Invoice_widget.dart';

class PayNow extends StatelessWidget {
  const PayNow({Key? key}) : super(key: key);

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

      title: const Text("Payment Process",style: TextStyle(color: Colors.blue)),
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

      child: const Text("Payment Method",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
      ),
      textWithbutton(labelText: 'Select Payment Method',onTap: () => onnavgatortapeds(context), Width: 305, Marginleftbuttoon: 240,),
      Container(
        margin: const EdgeInsets.only( left: 30, right: 25),

        child: const Text('Please send the cost for this account : 54798075  in Al-Kuraimi Bank, and record the transferring number in the next input.',style: TextStyle(color: Colors.blue)),
      ),
        Container(
          margin: const EdgeInsets.only(top: 20, left: 30, right: 25),
          child: const TextField(
            decoration: InputDecoration(
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(30.0),
                      left: Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                labelText: "Transferring Number"),
          )

        ),
      Blue_Button(ButtonText: 'Pay', height: 32, width: 160, Margintop: 20, Marginleft: 100, textStyle: const TextStyle(color: Colors.white), buttonColor: const MaterialStatePropertyAll<Color>(Colors.blue),onTap: () => null, Marginbottom: 10,),




      ],
      ),
    ),
    );
  }
}
dynamic Valuewe = 1;
dynamic Valuewe2 = 1;


void onnavgatortapeds(BuildContext context){

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return StatefulBuilder(builder:(BuildContext context, StateSetter setState ) =>  SingleChildScrollView(
            controller:scrollController ,
            child: Container(
              child: Column(
                children:  [
                  textWithbutton(labelText: "Credt Card", onTap: () {  }, Width: 305, Marginleftbuttoon: 240,),
                  Stack(
                    children: [
                          Container(
                        margin: EdgeInsets.only(top: 0,bottom: 15,left: 20,right: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Colors.blue)
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 30,left: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: Valuewe,
                                    onChanged: (value) {
                                      setState(() {
                                        Valuewe = value;
                                      });
                                    },
                                  ),
                                  Text("Cash")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: Valuewe,
                                    onChanged: (value) {
                                      setState(() {
                                        Valuewe = value;
                                      });
                                    },
                                  ),
                                  Text("Mobile Money")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue: Valuewe,
                                    onChanged: (value) {
                                      setState(() {
                                        Valuewe = value;
                                      });
                                    },
                                  ),
                                  Text("One Cash")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                          children:[ Stack(
                              children: [Container(
                                  width: 310,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0),left: Radius.circular(30.0))
                                  ),
                                  margin: EdgeInsets.only(top: 0,bottom: 15,left: 20,),
                                  child: Container(
                                      margin: EdgeInsets.only(left: 12,top: 11),
                                      child: Text("select",style: TextStyle(color: Colors.white,fontSize: 16),))
                              ),
                                Blue_Button(ButtonText: "Select", height: 32, width: 80, Margintop: 3.5, Marginleft: 245 ,textStyle: TextStyle(color: Colors.blue), buttonColor: MaterialStatePropertyAll<Color>(Colors.white),onTap:(){}, Marginbottom: 0 ,)

                              ]
                          ),
                          ]
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0,bottom: 15,left: 20,right: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.blue)
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 30,left: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: Valuewe2,
                                    onChanged: (value) {
                                      setState(() {
                                        Valuewe2 = value;
                                      });
                                    },
                                  ),
                                  Text("Cash")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: Valuewe2,
                                    onChanged: (value) {
                                      setState(() {
                                        Valuewe2 = value;
                                      });
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Column(
                                      children: [
                                        Text("Al-Kuraimi Express"),
                                        Text("(238399)"),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                          children:[ Stack(
                              children: [Container(
                                  width: 310,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0),left: Radius.circular(30.0))
                                  ),
                                  margin: EdgeInsets.only(top: 0,bottom: 15,left: 20,),
                                  child: Container(
                                      margin: EdgeInsets.only(left: 12,top: 11),
                                      child: Text("select",style: TextStyle(color: Colors.white,fontSize: 16),))
                              ),
                                Blue_Button(ButtonText: "Select", height: 32, width: 80, Margintop: 3.5, Marginleft: 245 ,textStyle: TextStyle(color: Colors.blue), buttonColor: MaterialStatePropertyAll<Color>(Colors.white),onTap:(){}, Marginbottom: 0 ,)

                              ]
                          ),
                          ]
                      )
                    ],
                  ),
                  textWithbutton(labelText: "Pay in Cash", onTap: () {  }, Width: 305, Marginleftbuttoon: 240,),

                ],

              ),
            ),
          ));
        },
      );
    },
  );
}
