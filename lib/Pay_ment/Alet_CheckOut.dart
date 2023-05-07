import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fexmonths/Pay_ment/payLater.dart';
import 'package:fexmonths/Pay_ment/payNow.dart';
import 'package:fexmonths/Pay_ment/shppingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

import '../API_Backend/Models/MyAddressModel.dart';
import '../API_Backend/Models/SelectShippingModel.dart';
import '../API_Backend/Models/chekingCodeModel.dart';
import '../API_Backend/Provider/CartTotalProvider.dart';
import '../API_Backend/Provider/ChekingCode.dart';
import '../API_Backend/Provider/CreateOrdersProvider.dart';
import '../API_Backend/Provider/SelectShippingProvider.dart';
import '../API_Backend/Provider/myAddressProvider.dart';
import '../Components/textFiledwithButton.dart';
import '../Components/textWithbutton.dart';
import '../Home_display/CartDisplay.dart';
import 'addAddress.dart';
import 'Invoice_widget.dart';
import 'package:http/http.dart' as http;

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

List<ShippingOption> ShippingOptionList = [];
List<myAddressModel>? myAddressModelList;
List<CheekingCodeModel> CheekingCodeList = [];
TextEditingController CooController = TextEditingController();
TextEditingController noteConroller = TextEditingController();

class _CheckOutState extends State<CheckOut> {
  Timer? _timer;
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _counter++;
      });
    });
    getAll();

    /* ChekingCode(Dio()).getAll(CooController.text).then((value) {
      setState((){});
      CheekingCodeList.addAll(value);
      print("======CheekingCodeList==========CheekingCodeList=================CheekingCodeList");
      print(value);
      print("=======CheekingCodeList============CheekingCodeList===================mvCheekingCodeList");
    });*/
    myAddressProvider(
      Dio(),
    ).getAll().then((value) {
      setState(() {});
      myAddressModelList = [];
      myAddressModelList!.addAll(value);
      print(
          "=======myAddressModelList============myAddressModelList===================myAddressModelList");
      print(value);
      print(
          "=======myAddressModelList============myAddressModelList===================myAddressModelList");
    });
    // SelectShippingProvider(Dio()).getAll().then((value){
    //   setState((){});
    //     ShippingOptionList = [];
    //     ShippingOptionList!.addAll(value);
    //   print("=================ShippingOptionList=======================ShippingOptionList====================ShippingOptionList");
    //   print(value);
    //   print("=================ShippingOptionList=======================ShippingOptionList====================ShippingOptionList");
    // });
  }
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }

  Future<void> getAll() async {
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': 'Bearer 4|5oc5xYJ65zacvZoOIrqnyU0Kr6XZaSc8R7wU4Vwe'
    };
    try {
      var response = await http.get(
          Uri.parse("http://10.0.2.2:8000/api/shipping/types"),
          headers: headers);
      if (response.statusCode == 200) {
        // var res = response.data[0]as List;
        // print(response.data);
        // var ShippingOptionlist = res.map((e) => ShippingOption.fromJson(e)).toList();
        // return ShippingOptionlist;
        final List<dynamic> data = jsonDecode(response.body);
        final List<ShippingOption> shippingoption =
            data.map((e) => ShippingOption.fromJson(e)).toList();
        print(response.body);
        setState(() {
          ShippingOptionList = shippingoption;
        });
      }
      // throw Exception("__ Erorr in get ALl Products __");
    } catch (e) {
      throw Exception("__ Erorr in get ALl Products __::::::::$e");
    }
  }

  // int subtotoall =
  var item;
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
              textFiledWithbutton(
                ontap: () {
                  ChekingCode(Dio()).getAll(CooController.text).then((value) {
                    setState(() {});
                    CheekingCodeList.addAll(value);
                    print(
                        "======CheekingCodeList==========CheekingCodeList=================CheekingCodeList");
                    print(value);
                    print(
                        "=======CheekingCodeList============CheekingCodeList===================mvCheekingCodeList");
                  });
                },
                controller: CooController,
                labelText: "Coupon Code...",
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 35, right: 20),
                child: const Text("Select Your Address?",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
              textWithbutton(
                title: Addrss.isEmpty ? "Select Your Address" : Addrss[0],
                onTap: () {
                  Addrss.clear();
                  showDialogselect(context);
                },
                Width: 305,
                Marginleftbuttoon: 240,
                Margin: EdgeInsets.only(top: 15, left: 5),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 35, right: 20),
                child: const Text("Shipping",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
              textWithbutton(
                onTap: () {
                  shpping(context);
                  shpp.clear();
                },
                title: shpp.isEmpty ? "Select Shipping Method" : shpp[0],
                Width: 305,
                Marginleftbuttoon: 240,
                Margin: EdgeInsets.only(top: 15, left: 5),
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
                child: TextField(
                  controller: noteConroller,
                  maxLines: 5,
                  decoration: const InputDecoration(
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
                    ],
                  )

                  /*InvoiceWidget(

                  heNumberandThename: cartDisplaylist[0].product.title??'defult',
                  theMoney: */ /*cartDisplaylist[0].product.price == null?"":"${cartDisplaylist[0].product.discount}"*/ /*"778",
                  Subtotal: 'Subtotal',
                  Subtotalcost:cartDisplaylist[0].total==null? 0: cartDisplaylist[0].total,
                  shipping: 'shipping',
                  shippingCost: ShippingOptionList[0].costPerKm==null?"":"${ShippingOptionList[0].costPerKm}",
                  disCount: 'DisCount',
                  disCountCost: '${cartDisplaylist[0].product.discount ?? 0}',
                  Total: 'Total',
                  TotalCost: "kljlk" ,
                ),*/
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
                    onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PayLater(),
                        ));
                    CreatOrder();
                    },
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PayNow(),
                          ));
                      CreatOrder();
                    },
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
