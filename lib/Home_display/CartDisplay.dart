import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fexmonths/API_Backend/Provider/CartTotalProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../API_Backend/Models/CartDisplayModel.dart';
import '../API_Backend/Models/CartTotalModel.dart';
import '../API_Backend/Provider/CartDelete.dart';
import '../API_Backend/Provider/CartDisplayProvider.dart';
import '../Components/plusAndminusWidget.dart';
import '../Components/textFiledwithButton.dart';
import '../Pay_ment/Alet_CheckOut.dart';
import '../Constens.dart';
import 'decresincresWidget.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}






int addProduct = 0;
List<CartDisplayModel>? cartDisplaylist;
class _CartState extends State<Cart> {
  Timer? _timer;
    late int _itemCount;
@override
  void initState() {
  _timer = Timer(Duration(seconds: 1), () {
    setState(() {

    });
  });
    super.initState();
    CartDisplayProviders(Dio()).getAll().then((value) {
      setState((){});
      cartDisplaylist = [];
      cartDisplaylist!.addAll(value);
      print("=================cartDisplaylist=======================cartDisplaylist====================cartDisplaylist");
      print(value);
      print("=================cartDisplaylist=======================cartDisplaylist====================cartDisplaylist");

    });

    CartTotalProvider();
  }

  @override
  Widget build(BuildContext context) {
    cartDisplaylist![0].quantity==0? 1: cartnumber = cartDisplaylist![0].quantity;
   // Idcart =cartDisplaylist[0].id;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cart'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: cartDisplaylist==null?Container(): ListView.builder(
        itemCount: cartDisplaylist!.length,
          itemBuilder: (context, index) {
           return Dismissible(
             direction: DismissDirection.endToStart,
             onDismissed: (direction) {
               setState(() {
                 cartDisplaylist!.clear();
                 CartDelete("${cartDisplaylist![index].id}");
               });

             },
             key: Key("hi"),
             background: Container(
               decoration: BoxDecoration(
                   color: Colors.red,
                   borderRadius: BorderRadius.circular(10)),
               alignment: Alignment.centerRight,
               padding: EdgeInsets.only(right: 20),
               margin: EdgeInsets.only(top: 20,),
               child: Icon(Icons.delete,color: Colors.white,),
             ),
             child: Container(
               margin: EdgeInsets.only(left: 30,right: 30,top: 20,),
               width: 300,
               height: 100,
               child: Card(
                 elevation: 4,
                 shape: RoundedRectangleBorder(
                     side: BorderSide(color: Colors.grey.shade300),
                     borderRadius: BorderRadius.all(Radius.circular(10))),
                 child: Row(
                   children: [
                     Container(
                       margin: EdgeInsets.all(5),
                       width: 80,
                       height: 80,
                       child: ClipRRect(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         child: Image.network(
                             'http://10.0.2.2:8000${cartDisplaylist![index].product.picture}',
                             fit: BoxFit.cover),
                       ),
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                             margin: EdgeInsets.only(top: 15, left: 10),
                             child: Text(cartDisplaylist![index].product.title, style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),)),
                         Container(
                             margin: EdgeInsets.only(top: 1, left: 10, bottom: 12),
                             child: Text(cartDisplaylist![index].store.name,style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic),)),
                         DecressIncressWidget(cartnum:cartDisplaylist![index].quantity ,)
                       ],
                     ),
                     Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                       /*Container(
                           height: 30,
                           width: 30,
                           margin: EdgeInsets.only(left: 60, top: 5),
                           child: IconButton(
                               highlightColor: Colors.transparent,
                               splashColor: Colors.transparent,
                               padding: EdgeInsets.all(0),
                               alignment: Alignment.topRight,
                               onPressed: () {

                                 print("hiiiiiiiiii");
                               },
                               icon: Icon(
                                 Icons.cancel,
                                 color: Colors.blue,

                               ))),*/
                 Container(
             margin: EdgeInsets.only(right: 5, top: 20, bottom: 2,left: 50),
             child:  Text(
               "${cartDisplaylist![index].product.price}",
               style: TextStyle(
                   color: Colors.grey.shade600,fontWeight: FontWeight.bold),
             ),
           ),
            cartDisplaylist![0].product.discount == null?Container():
                       Container(
                         margin: EdgeInsets.only(right: 5, top: 5, bottom: 2),
                         child: Text(
                           "${cartDisplaylist![index].product.discount}",
                           style: TextStyle(
                               decoration: TextDecoration.lineThrough,
                               color: Colors.red,fontWeight: FontWeight.bold),
                         ),
                       ),
                     ]),
                   ],
                 ),
               ),
             ),
           );
          },

      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80.h,
        decoration:  BoxDecoration(

            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            border: Border.all(
                color: Colors.grey.shade400),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  //offset: Offset(0, -1),
                  spreadRadius: 4,
                  blurRadius: 30
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15,right: 10,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Container(

               height: 30,
               width: 130,
               decoration: BoxDecoration(
                   color: Colors.grey,
                 borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: Center(
                 child:FutureBuilder<dynamic>(
                   future: CartTotalProvider(),
                   builder: ((context, snapshot) {
                     if(snapshot.hasData){
                       return Text("Total: ${snapshot.data.toString()}");
                     }
                     else if(snapshot.hasError){
                       return Text("${snapshot.error}") ;
                     }
                     else{
                       return Container();
                     }
                   }
                   ),
                 )
               ),
              ),
              Container(
                height: 30,
                width: 130,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    alignment: Alignment.center,
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))
                  ),
                  onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut(),)) ,
                  child: const Center(child: Text("Chekout",style: TextStyle(color: Colors.white),)),
                  ),
                ),

            ],
          ),
        ),
      )
    );
  }
}

