import 'package:fexmonths/Pay_ment/payNow.dart';
import 'package:flutter/material.dart';

import '../view/base_widget/Blue_Button.dart';



dynamic Valuewe = 1;
dynamic Valuewe2 = 1;
void InstallmentPlan(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    context: context,
    builder: (context) {
      return StatefulBuilder(
          builder: (context, StateSetter setState) => DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                        child: const Text("Installments Plan",style: TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.bold)),
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 0, bottom: 15, left: 20, right: 30),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.blue)),
                            child: Container(
                              margin: EdgeInsets.only(top: 30, left: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: Valuewe,
                                        onChanged: (value) {
                                          payMethodsvisible = false;
                                          Valuewe = value;
                                          setState(() {});
                                        },
                                      ),RichText(text: const TextSpan(
                                        text: "4 Weeks ",
                                        style: TextStyle(
                                          color: Colors.blue
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.blue
                                            ),
                                          text: "(%25 of the cost every week)"
                                          )
                                        ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 2,
                                        groupValue: Valuewe,
                                        onChanged: (value) {
                                          payMethodsvisible = true;
                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: const TextSpan(
                                          text: "8 Weeks  ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%12.50 of the cost every week)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 3,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: const TextSpan(
                                          text: "4 Months  ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%25 of the cost every months)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 4,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: const TextSpan(
                                          text: "6 Months ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%15.66 of the cost every months)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 5,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: const TextSpan(
                                          text: "8 Months ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%12.50 of the cost every months)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 6,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: const TextSpan(
                                          text: "12 Months ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%7.83 of the cost every months)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 7,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "18 Weeks",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%5.55 of the cost every months)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 8,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "24 Months  ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%3.92 of the cost every months)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(children: [
                            Stack(children: [
                              Container(
                                  width: 310,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(30.0),
                                          left: Radius.circular(30.0))),
                                  margin: EdgeInsets.only(
                                    top: 0,
                                    bottom: 15,
                                    left: 20,
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 12, top: 11),
                                      child: Text(
                                        "select",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16),
                                      ))),
                              Blue_Button(
                                ButtonText: "Select",
                                height: 32,
                                width: 80,
                                Margintop: 3.5,
                                Marginleft: 245,
                                textStyle: TextStyle(color: Colors.blue),
                                buttonColor:
                                MaterialStatePropertyAll<Color>(
                                    Colors.white),
                                onTap: () {},
                                Marginbottom: 0,
                                MarginRight: 0,
                              )
                            ]),
                          ])
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 0, bottom: 15, left: 20, right: 30),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.blue)),
                            child: Container(
                              margin: EdgeInsets.only(top: 30, left: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(

                                        value: 9,
                                        groupValue: Valuewe,
                                        onChanged: (value) {
                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "4 Weeks  ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%40 of the installment every week)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 10,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "8 Weeks ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%40 of the installment every week)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 11,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "4 Months  ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: ",(%40 of the installment every month)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 12,
                                        groupValue: Valuewe,
                                        onChanged: (value) {
                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "6 Months  ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%40 of the installment every month)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 13,
                                        groupValue: Valuewe,
                                        onChanged: (value) {
                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "8 Months  ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%40 of the installment every month)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 14,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "12 Months",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%40 of the installment every month)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 15,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "18 Months ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%40 of the installment every month)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(

                                        value: 16,
                                        groupValue: Valuewe,
                                        onChanged: (value) {

                                          Valuewe = value;

                                          setState(() {});
                                        },
                                      ),
                                      RichText(text: TextSpan(
                                          text: "24 Months ",
                                          style: TextStyle(
                                              color: Colors.blue
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue
                                                ),
                                                text: "(%40 of the installment every month)"
                                            )
                                          ]
                                      ),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(children: [
                            Stack(children: [
                              Container(
                                  width: 310,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(30.0),
                                          left: Radius.circular(30.0))),
                                  margin: EdgeInsets.only(
                                    top: 0,
                                    bottom: 15,
                                    left: 20,
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 12, top: 11),
                                      child: Text(
                                        "select",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16),
                                      ))),


                              Blue_Button(
                                ButtonText: "Select",
                                height: 32,
                                width: 80,
                                Margintop: 3.5,
                                Marginleft: 245,
                                textStyle: TextStyle(color: Colors.blue),
                                buttonColor:
                                MaterialStatePropertyAll<Color>(
                                    Colors.white),
                                onTap: () {},
                                Marginbottom: 0,
                                MarginRight: 0,
                              )
                            ]),
                          ])
                        ],
                      ),
                      Blue_Button(
                        ButtonText: "ok",
                        height: 40,
                        width: 80,
                        Margintop: 15,
                        Marginleft: 150,
                        textStyle: TextStyle(color: Colors.white),
                        buttonColor:
                        MaterialStatePropertyAll<Color>(Colors.blue),
                        Marginbottom: 10,
                        onTap: () {
                          Navigator.pop(context, setState);
                        },
                        MarginRight: 0,
                      )
                    ],
                  ),
                ),
              );
            },
          ));
    },
  );
}
