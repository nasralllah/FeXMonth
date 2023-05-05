import 'package:fexmonths/Pay_ment/payNow.dart';
import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/textWithbutton.dart';

dynamic Valuewe = 1;
dynamic Valuewe2 = 1;
void onnavgatortapeds(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
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
                        children: [
                          textWithbutton(
                            title: "Credt Card",
                            onTap: () {},
                            Width: 305,
                            Marginleftbuttoon: 240, Margin:  EdgeInsets.only(top: 15,left: 5),
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
                                            value: 1,
                                            groupValue: Valuewe,
                                            onChanged: (value) {
                                              payMethodsvisible = false;
                                              Valuewe = value;
                                              setState(() {});
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
                                              payMethodsvisible = true;
                                              Valuewe = value;

                                              setState(() {});
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
                                              Valuewe = value;

                                              setState(() {});
                                            },
                                          ),
                                          Text("One Cash")
                                        ],
                                      )
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
                          textWithbutton(
                            title: "Pay in Cash",
                            onTap: () {},
                            Width: 305,
                            Marginleftbuttoon: 240, Margin:  EdgeInsets.only(top: 15,left: 5),
                          ),
                          Blue_Button(
                            ButtonText: "ok",
                            height: 40,
                            width: 60,
                            Margintop: 15,
                            Marginleft: 10,
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
