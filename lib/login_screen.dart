import 'package:fexmonths/menu_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constens.dart';
import 'Text_filedd_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icons_sochail.dart';
import 'main.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool checkbox = false;
  String username = "nasrallah";
  var password = "Aa14119181121218";
  String usernametext = "";
  var Password = "";
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
                    alignment: AlignmentDirectional.topEnd,
                    margin: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          backgroundColor: Color(0xFFF2F4F8),
                          child: Icon(
                            CupertinoIcons.xmark,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.black,
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
                        'New user?',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      onChanged: (vasr)
                      {
                        usernametext= vasr;
                      },
                      decoration: InputDecoration(
                        hintText: "Username or email",
                        fillColor: Color(0xFFF2F4F8),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      onChanged: (varss){
                        Password = varss;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Color(0xFFF2F4F8),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                      ),
                      obscureText: true,

                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: checkbox,
                          checkColor: Colors.white,
                          activeColor:KButtonsignColor,
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox = value!;
                            });
                          },
                          side: BorderSide(
                              color: KButtonsignColor,
                              width: 1.4,
                              style: BorderStyle.solid),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      Text("keep me signed in ")
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if(usernametext == username && Password == password )
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Femonths()));
                      }
                      else{
                        print("wrong username or Password");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: KButtonsignColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: 350,
                      height: 45,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text("Sign In",
                            style: KTextButtonStyled
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                    height: 40,
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
  }
}
