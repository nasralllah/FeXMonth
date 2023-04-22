import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Components/plusAndminusWidget.dart';
import '../Components/textFiledwithButton.dart';
import '../Pay_ment/Alet_CheckOut.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}
int addProduct = 0;

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cart'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context, index) {
           return Dismissible(

             direction: DismissDirection.endToStart,
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
                             'https://imglarger.com/Images/before-after/ai-image-enlarger-1-before-2.jpg',
                             fit: BoxFit.fill),
                       ),
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                             margin: EdgeInsets.only(top: 15, left: 10),
                             child: Text("Nike", style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),)),
                         Container(
                             margin: EdgeInsets.only(top: 1, left: 10, bottom: 12),
                             child: Text("StoreName",style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic),)),
                         plusAndminusWidget(
                           TheNumber: addProduct,
                         )
                       ],
                     ),
                     Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                       Container(
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
                               ))),
                       Container(
                         margin: EdgeInsets.only(right: 5, top: 5, bottom: 2),
                         child: Text(
                           "\$199.00",
                           style: TextStyle(
                               decoration: TextDecoration.lineThrough,
                               color: Colors.red,fontWeight: FontWeight.bold),
                         ),
                       ),
                       Container(
                         alignment: Alignment.bottomCenter,
                         margin: EdgeInsets.only(right: 5, top: 5, bottom: 13),
                         child: Text(
                           "\$299.00",
                           style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),
                         ),
                       )
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
                 child: Text("Total: \$1995"),
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

