
import 'package:fexmonths/login_screen.dart';
import 'package:flutter/material.dart';
import 'Constens.dart';
import 'main.dart';
import 'Icons_sochail.dart';
import 'package:flutter/cupertino.dart';
import 'Creat_Account_TextFiled.dart';

class Create_Account extends StatelessWidget {
  const Create_Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      left: true,
      right: true,
      child: Scaffold(
        backgroundColor: KButtonsignColor,
        //   resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 8),
          // padding: EdgeInsets.symmetric(vertical: 100),
          physics: AlwaysScrollableScrollPhysics(),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.all(30),
            child: Container(
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //    color: Colors.red,
                    alignment: AlignmentDirectional.topEnd,
                    margin: EdgeInsets.only(right: 20),
                  /*  width: 45,
                    height: 45,*/

                    child: GestureDetector(
                      onTap: () {
                       Navigator.pop(context);
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
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already User?',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                    child: Container(
                        //    color: Colors.black,
                        ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24.0,right: 24.0),
                    child: Column(
                      children: [

                        Creat_Account_TextFiled(hintText: "UserName",obscureText: false, onchangess: (dfgkdfg) {} ),
                        SizedBox(
                          height: 10.0,),
                        Creat_Account_TextFiled(hintText: "LastName",obscureText: false, onchangess: (dfgkdfg) {} ),
                        SizedBox(
                          height: 10.0,),
                        Creat_Account_TextFiled(hintText: "Username or Email",obscureText: false, onchangess: (dfgkdfg) {} ),
                        SizedBox(
                          height: 10.0,),
                        Creat_Account_TextFiled(hintText: "Password",obscureText: true, onchangess: (dfgkdfg) {} )

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
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: KButtonsignColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: 350,
                      height: 45,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 90.0,right: 90.0,top: 10,bottom: 5),
                      child: Center(
                        child: Text("Sign Up", style: KTextButtonStyled),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:20,
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
                          fontSize: 15,
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
                    height: 10,
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

