import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Components/Bottom_Menu_Icons.dart';
import '../Constens.dart';
import '../Login_display/login_screen.dart';
import '../Components/menu_card_layout.dart';
import '../Pay_ment/addAddress.dart';
import 'Fevaroit_Page.dart';
import 'MyInstallment.dart';
import 'myOrders.dart';

class menu_animated extends StatefulWidget {
  const menu_animated({Key? key}) : super(key: key);
  @override
  State<menu_animated> createState() => _menu_animatedState();
}

class _menu_animatedState extends State<menu_animated> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        // color: Colors.red,
        height: 166.h,
        //  color: Colors.red,
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => login_screen(),
                  ));
            },
            child: SizedBox(
              child: Container(
                margin: EdgeInsets.only(
                    top: 130.h, right: 250.w, bottom: 10.h, left: 5.w),
                //color: Colors.blue,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Center(
                    child: Text(
                  "Sing in",
                  style: KTextButtonStyled,
                )),
              ),
            )
            /*child: Container(
            //  margin: EdgeInsets.only(right: 300,bottom: 50),
            //  padding: EdgeInsets.only(top: 10 ),
              decoration: BoxDecoration(
                color: KButtonsignColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),

              ),
              child: Center(child: Text("Sign in",style: KTextButtonStyled)),
            )*/
            ),
      ),
      Container(
        //  color: Colors.white,
        //padding: EdgeInsets.only(top: 440),
        height: 410.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Menu_Cards(
              onpress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Faevirot_Page(),));

                print("Favorite");
              },
              CardName: "Favorite",
              Icons: FontAwesomeIcons.heart,
            ),
            Menu_Cards(
              onpress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => myOreders(),));
                print("Oreders");
              },
              CardName: "Orders",
              Icons: FontAwesomeIcons.fileInvoice,
            ),
            Menu_Cards(
              onpress: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => MyInstallment(),));
                print("Question");
              },
              CardName: "Installment",
              Icons: Icons.payments_outlined,
            ),
            Menu_Cards(
              onpress: () {
                showDialogselect(context);
                print("Help");
              },
              CardName: "Adress",
              Icons: FontAwesomeIcons.solidAddressCard,
            ),
          ],
        ),
      ),
      Container(
        //  color: Colors.red,

        padding: EdgeInsets.only(top: 15.h),
        margin: EdgeInsets.only(left: 25.w, right: 110.w, top: 10.h),
        child: Image(
            height: 130.h,
            image: AssetImage(
                "Images/Group 5.png")),
      ),
      Container(
        //  color: Colors.black,
        padding: EdgeInsets.only(top: 10.h, left: 10.w),
        margin: EdgeInsets.only(top: 0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            bottom_menu_Icons(
              onpress: () {
                print("hiii");
              },
              iconassetImage: AssetImage("Images/google (1).png"),
              Size: 30,
            ),
            SizedBox(
              width: 25.w,
            ),
            bottom_menu_Icons(
              onpress: () {
                print("hiii");
              },
              iconassetImage: AssetImage("Images/facebook.png",),
              Size: 50,
            ),
            SizedBox(
              width: 25.w,
            ),
            bottom_menu_Icons(
              onpress: () {
                print("hiii");
              },
              iconassetImage: AssetImage("Images/google (1).png"),
              Size: 30,
            ),
            SizedBox(
              width: 25.w,
            ),
            bottom_menu_Icons(
              onpress: () {
                print("hiii");
              },
              iconassetImage: AssetImage("Images/google (1).png"),
              Size: 30,
            ),
          ],
        ),
      )
    ]);
  }
}
