import 'package:flutter/material.dart';
import 'Components/OnbordingScreenButtons.dart';
import 'Constens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fexmonths/main.dart';



class onbordingScreen extends StatefulWidget {
  const onbordingScreen({Key? key}) : super(key: key);

  @override
  State<onbordingScreen> createState() => _onbordingScreenState();
}

class _onbordingScreenState extends State<onbordingScreen> {
final controller  = PageController();
bool isLastpage = false;
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
            setState(()=> isLastpage = index == 2);
          },
          children: [
            Container(
              color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                        color: Colors.blue,
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
                    padding: const EdgeInsets.only(top: 13),
                    child: Card(
                      child: SizedBox(
                        width: 270,
                        height: 300,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Center(child: Text("Page 2")),
            ),
            Container(
              color: Colors.black38,
              child: const Center(child: Text("Page 3")),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
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


