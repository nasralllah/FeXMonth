import 'package:flutter/material.dart';
import '../Constens.dart';
import '../main.dart';
import 'package:fexmonths/Components/Icons_sochail.dart';
import 'package:flutter/cupertino.dart';
import '../Components/Creat_Account_TextFiled.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../API_Backend/ApiPost.dart';

final myControllername = TextEditingController();
final myControllerEmail = TextEditingController();
final myControllerpassword = TextEditingController();
final myControllerrepassword = TextEditingController();

class Create_Account extends StatelessWidget {
  const Create_Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.lightBlue, Colors.white60])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //   resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40.h),

          // padding: EdgeInsets.symmetric(vertical: 100),
          physics: AlwaysScrollableScrollPhysics(),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.r))),
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
            child: Container(
              height: 755.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //    color: Colors.red,
                    alignment: AlignmentDirectional.topEnd,
                    margin: EdgeInsets.only(right: 20.w),
                    /*  width: 45,
                    height: 45,*/

                    child: GestureDetector(
                      onTap: () {
                        myControllername.text = "";
                        myControllerEmail.text = "";
                        myControllerpassword.text = "";
                        myControllerrepassword.text = "";
                        Navigator.pop(context);
                        /*push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Femonths(showHome: true,),
                            ));*/
                      },
                      child: CircleAvatar(
                          backgroundColor: Color(0xFFF2F4F8),
                          child: Icon(
                            CupertinoIcons.xmark,
                            color: Colors.black,
                            //      color: Colors.black,
                          )),
                    ),
                  ),
                  Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(
                      //    color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already User?',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0.h,
                    child: Container(
                        //    color: Colors.black,
                        ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        Creat_Account_TextFiled(
                          hintText: "Email",
                          obscureText: false,
                          controlers: myControllerEmail,
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Creat_Account_TextFiled(
                          hintText: "password",
                          obscureText: false,
                          controlers: myControllerpassword,
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Creat_Account_TextFiled(
                          hintText: "Name",
                          obscureText: false,
                          controlers: myControllername,
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Creat_Account_TextFiled(
                          hintText: "re-Password",
                          obscureText: false,
                          controlers: myControllerrepassword,
                        )
                      ],
                    ),
                  ),
                  /* Column(
                    children: [
                     */ /* SizedBox(
                        height: 1.0,
                        child: Container(
                    //      color: Colors.black,
                        ),
                      ),*/ /*
                    ],
                  )*/
                  GestureDetector(
                    onTap: () {
                      senddata(context);

                      /* if(response.statusCode == 200){

                        Alert(
                            context: context,
                            title: "login success",
                            desc: "you are loged in",
                            image: Icon(Icons.call_missed_outgoing_rounded)
                        ).show();
                      }
*/
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: KButtonsignColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.r))),
                      //width: 310.w,
                      height: 45.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      margin: EdgeInsets.only(
                          left: 90.0.w, right: 90.0.w, top: 20.h, bottom: 5.h),
                      child: Center(
                        child: Text("Sign Up", style: KTextButtonStyled),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                    child: Container(
                        // color: Colors.red,
                        ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                        indent: 30,
                        endIndent: 30,
                        thickness: 2,
                      )),
                      Text(
                        "  or sign in with",
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                        indent: 30,
                        endIndent: 30,
                        thickness: 2,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                    //    child: Container(color: Colors.red,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: sochil_Icons(
                          image: 'Images/google (1).png',
                          onpress: () {},
                        ),
                      ),
                      Expanded(
                        child: sochil_Icons(
                          image: 'Images/google (1).png',
                          onpress: () {},
                        ),
                      ),
                      Expanded(
                        child: sochil_Icons(
                          image: 'Images/google (1).png',
                          onpress: () {},
                        ),
                      ),
                      Expanded(
                        child: sochil_Icons(
                          image: 'Images/google (1).png',
                          onpress: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
