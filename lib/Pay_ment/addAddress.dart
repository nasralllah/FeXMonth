import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/Blue_Button.dart';
import '../Components/textWithbutton.dart';
import '../Menu_display/Address.dart';
import 'Alet_CheckOut.dart';

  List<dynamic>? Strings;
List<dynamic>? Shipp;

showDialogselect(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Adress(),
                            ));
                      },
                      icon: Icon(CupertinoIcons.plus_circle_fill,
                          color: Colors.blue, size: 50),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "My Addresses",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: myAddressModelList!.length,
                itemBuilder: (context, index) => textWithbutton(
                  title: myAddressModelList![index].name,
                  onTap: () {
                    Strings!.clear();
                    Strings!.add(myAddressModelList![index].name);
                    Strings!.add(myAddressModelList![index].id.toString());
                   print(Strings);

                  },
                  Width: 224,
                  Marginleftbuttoon: 160,
                  Margin: EdgeInsets.only(top: 15, left: 5),
                ),
              ),
              Blue_Button(
                ButtonText: "Ok",
                height: 32,
                width: 100,
                Margintop: 10,
                Marginleft: 0,
                textStyle: TextStyle(color: Colors.white),
                buttonColor: MaterialStatePropertyAll<Color>(Colors.blue),
                Marginbottom: 0,
                onTap: () => Navigator.pop(context),
                MarginRight: 0,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
