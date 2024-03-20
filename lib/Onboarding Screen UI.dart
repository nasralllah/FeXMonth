import 'package:fexmonths/view/base_widget/OnbordingScreenButtons.dart';
import 'package:flutter/material.dart';

import 'Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fexmonths/main.dart';

/*void main() {
  runApp(MaterialApp(home: onbordingScreen()));
}*/


class onbordingScreen extends StatefulWidget {
  const onbordingScreen({Key? key}) : super(key: key);

  @override
  State<onbordingScreen> createState() => _onbordingScreenState();
}

class _onbordingScreenState extends State<onbordingScreen> {
final controller  = PageController();
bool isLastpage = false;
bool isfirstpage= false;
  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            Future.delayed(Duration.zero,() => setState(()=> isfirstpage = index == 0));
            Future.delayed(Duration.zero, () => setState(()=> isLastpage = index == 2));
          },
          children: [
            Container(
              //the first page
             // color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
               //         color: Colors.blue,
                        width: 150,
                        height: 100,
                        child: Image.asset("Images/Group 5.png",fit: BoxFit.fitWidth,)
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
//  color: Colors.blue,
                        child: Text("Spilt the cost Fei-Months (in months)",style: KTextOnbordingScreenBold,) ,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Text("YOU CAN BUY NOW AND PAY LATER",style: KTextOnbordingScreen,),
                          Text("IN THE PLAN THAT YOU WILL CHOOSE IT",style: KTextOnbordingScreen,)

                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: KGreyColor1,
                      child: Container(
                        width: 250,
                        height: 300,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 3,left: 4),
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(

                                child: Text("1",style: TextStyle(color: KGreyColor4)),
                                backgroundColor: KGreyColor2,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: SizedBox(
                                height: 178,
                                width: 150,
                                child: Image(
                                    image:
                                    AssetImage(
                                        "Images/Group 47.png",
                                    )
                                ),
                              ),
                            ),
                            Text("Full Your Cart",style: KOnbordingScreenBold,),
                            Text("Shopping from any store inside ",style: KTextOnbordingScreen,),
                            Text("our",style: KTextOnbordingScreen,),
                            Text("platform and get your cart full",style: KTextOnbordingScreen,),


                          ],

                        ),
                      ),

                    ),
                  )
                ],
              ),
            ),
            Container(
              //the second page
              // color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      //         color: Colors.blue,
                        width: 150,
                        height: 100,
                        child: Image.asset("Images/Group 5.png",fit: BoxFit.fitWidth,)
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
//  color: Colors.blue,
                        child: Text("Spilt the cost Fei-Months (in months)",style: KTextOnbordingScreenBold,) ,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Text("YOU CAN BUY NOW AND PAY LATER",style: KTextOnbordingScreen,),
                          Text("IN THE PLAN THAT YOU WILL CHOOSE IT",style: KTextOnbordingScreen,)

                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: Colors.white38,
                      child: Container(
                        width: 250,
                        height: 300,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 3,left: 4),
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(

                                child: Text("2",style: TextStyle(color: Colors.grey.shade700)),
                                backgroundColor: Colors.grey.shade400,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: SizedBox(
                                height: 178,
                                width: 150,
                                child: Image(
                                    image:
                                    AssetImage(
                                      "Images/Group 48.png",
                                    )),
                              ),
                            ),
                            Text("Checkout",style: KOnbordingScreenBold,),
                            Text("Checkout from your cart than choose",style: KTextOnbordingScreen,),
                            Text("installment method as",style: KTextOnbordingScreen,),
                            Text("payment method",style: KTextOnbordingScreen,),

                          ],
                        ),
                      ),

                    ),
                  )
                ],
              ),
            ),
            Container(
              //the third page
              // color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      //         color: Colors.blue,
                        width: 150,
                        height: 100,
                        child: Image.asset("Images/Group 5.png",fit: BoxFit.fitWidth,)
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
//  color: Colors.blue,
                        child: Text("Spilt the cost Fei-Months (in months)",style: KTextOnbordingScreenBold,) ,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Text("YOU CAN BUY NOW AND PAY LATER",style: KTextOnbordingScreen,),
                          Text("IN THE PLAN THAT YOU WILL CHOOSE IT",style: KTextOnbordingScreen,)

                        ],
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 1,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: Colors.white38,
                      child: Container(
                        width: 250,
                        height: 300,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 3,left: 4),
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(

                                child: Text("3",style: TextStyle(color:Colors.grey.shade700)),
                                backgroundColor: Colors.grey.shade400,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 11),
                              child: SizedBox(
                                height: 178,
                                width: 130,
                                child: Image(
                                    image:
                                    AssetImage(
                                      "Images/Group 49.png",
                                    )),
                              ),
                            ),
                            Text("choose Your Plan",style: KOnbordingScreenBold,),
                            Text("After getting your Agreement,",style: KTextOnbordingScreen,),
                            Text("you can select the plan that you wil",style: KTextOnbordingScreen,),
                            Text("pay based it",style: KTextOnbordingScreen,),
                          ],
                        ),
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet:Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OnbordingButtons(
              Onpressd: () {
                controller.previousPage(
                    duration:const Duration(milliseconds: 500),
                    curve: Curves.easeOut);

              },
              Colorss: Colors.grey.shade300,
              Texts: "< pervios" ,
              TextColor: Colors.blue.shade600,

            ),
            isLastpage?OnbordingButtons(
              Onpressd: () async {
                final perf = await SharedPreferences.getInstance();
                perf.setBool('showHome', true);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> buld_anmated_drawer() ),);
              },
              Colorss: Colors.blue.shade600,
              Texts: " Start" ,
              TextColor: Colors.white,):
            OnbordingButtons(
              Onpressd: () {
                controller.nextPage(
                    duration:const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              Colorss: Colors.blue.shade600,
              Texts: " Next >" ,
              TextColor: Colors.white,


            )
          ],
        ),
      ),

    );
  }
}


