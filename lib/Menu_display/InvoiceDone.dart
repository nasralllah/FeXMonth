import 'package:fexmonths/Components/Blue_Button.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../Components/InvoiceWidgetDesign2.dart';
import '../Pay_ment/Invoice_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../Pay_ment/InvoicewithPaymentbutton.dart';
import '../Pay_ment/payNow.dart';
class InsallmentDone extends StatefulWidget {
  const InsallmentDone({Key? key}) : super(key: key);

  @override
  State<InsallmentDone> createState() => _InsallmentDoneState();
}
int value =5;
class _InsallmentDoneState extends State<InsallmentDone> {
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

        title: Text("658769876",style: TextStyle(color: Colors.blue)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(11))
              ),
              child: Center(child:
              RichText(
                text: TextSpan(
                    text: "Status:",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "  Done..",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          )
                      )
                    ]
                ),

              )
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),

                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: const InvoicewidgetDesign2(invoiceName: "Installment Information", itemCount: 7)
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),

              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(11))
              ),
              child: InvoiceWidget(
                  invoiceName: "Bill Details",
                  itemCount: 5,
                  heNumberandThename: ".Nike",
                  theMoney: "435345",
                  Subtotal: "Subtotal",
                  Subtotalcost: 45345.0,
                  shipping: "shipping",
                  shippingCost: "43543",
                  disCount: "disCount",
                  disCountCost: "342",
                  Total: "Total",
                  TotalCost: "2345"
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 190,top: 10),
              child: Text("INSTALLMENTS",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
            ),
            Container(
                child: Row(
                  children: [
                    Container(
                      //  color: Colors.blue,
                      height: 190,
                      width: 190,
                      margin: EdgeInsets.only(right: 10),
                      child: SfRadialGauge(
                          axes: <RadialAxis>[
                            // Create primary radial axis
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              showLabels: true,
                              showTicks: true,
                              startAngle: 270,
                              endAngle: 270,
                              radiusFactor: 0.7,
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.2,
                                color: const Color.fromARGB(30, 0, 169, 181),
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: 100,
                                  width: 0.05,
                                  pointerOffset: 0.07,
                                  sizeUnit: GaugeSizeUnit.factor,
                                )
                              ],
                            ),
                            // Create secondary radial axis for segmented line
                            RadialAxis(
                              minimum: 0,
                              interval: 1,
                              maximum: 4,
                              showLabels: false,
                              showTicks: true,
                              showAxisLine: false,
                              tickOffset: -0.05,
                              offsetUnit: GaugeSizeUnit.factor,
                              minorTicksPerInterval: 0,
                              startAngle: 270,
                              endAngle: 270,
                              radiusFactor: 0.7,
                              majorTickStyle: MajorTickStyle(
                                  length: 1.3,
                                  thickness: 2,
                                  lengthUnit:GaugeSizeUnit.factor,
                                  color: Colors.white),
                            )
                          ]
                      ),
                    ),
                    Column(
                      children: [
                        Container(

                          child: Text("100%",style: TextStyle(color: Colors.green,fontSize: 45)),
                          margin: EdgeInsets.only(right:50,bottom:10),),
                        Container(

                          child: Text("Done",style: TextStyle(color: Colors.green,fontSize: 45)),
                          margin: EdgeInsets.only(right:50,bottom:10),),Container(

                        /*  child: Text("2023/1/12 15:45"),
                          margin: EdgeInsets.only(right:50,bottom:10),),Container(

                          child: Text("2023/1/12 15:45"),
                          margin: EdgeInsets.only(right:50,bottom:10),),

                        Blue_Button(ButtonText: 'PAY NOW', height: 30, width: 90, Margintop: 5, Marginleft: 0, textStyle: TextStyle(color: Colors.white), buttonColor: MaterialStatePropertyAll<Color>(Colors.blue), Marginbottom: 0, MarginRight: 50,onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => PayNow(),)),)
*/
                        )
                      ],
                    )
                  ],
                )
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: InvoicewidgetDesign2(invoiceName: '1.Order Information', itemCount: 7,)
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: InvoicewidgetDesign2(invoiceName: '2.Order Information', itemCount: 7,)
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: InvoicewidgetDesign2(invoiceName: '3.Order Information', itemCount: 7,)
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(11))
                ),
                child: InvoicewidgetDesign2(invoiceName: '4.Order Information', itemCount: 7,)
            ),
          ],
        ),
      ),
    );
  }
}
