import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constens.dart';
import '../data/API_Backend/ApiPost.dart';
import '../view/base_widget/Icons_sochail.dart';
import 'Creat_Accounts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final mycontrolerusername = TextEditingController();
final mycontrolerpassword = TextEditingController();
final _formKeyUsername = GlobalKey<FormState>();
final _formKeyPassword = GlobalKey<FormState>();

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {


  void Onsubmet(){
    if (_formKeyUsername.currentState == null) {
      print("_formKey.currentState is null!");
    } else if (_formKeyUsername.currentState!.validate()&&_formKeyPassword.currentState!.validate()) {
      LoginProvider().senddatalogin(context);
     /* ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );*/
    }
  }

  bool checkbox = false;
  String usernametext = "";
  var Password = "";
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
          padding: EdgeInsets.only(top: 70.h),
          // padding: EdgeInsets.symmetric(vertical: 100),
          physics: AlwaysScrollableScrollPhysics(),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              margin: EdgeInsets.only(
                  top: 30.h, bottom: 30.h, right: 30.w, left: 30.w),
              child: Container(
                height: 680.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.topEnd,
                      margin: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          mycontrolerusername.text = "";
                          mycontrolerpassword.text = "";
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
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New user?',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Create_Account(),
                                ));
                          },
                          child: Text(
                            "Create an account",
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Form(
                          key: _formKeyUsername,
                          child: TextFormField(
                            controller: mycontrolerusername,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Username or Email",
                              fillColor: Color(0xFFF2F4F8),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0.r),
                                borderSide: BorderSide(
                                    color: KGreyColor1,
                                    style: BorderStyle.none
                                )),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the Username or Email ';
                              }

                              return null;
                            },
                          ),
                        )),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                      child: Form(
                        key: _formKeyPassword,
                        child: TextFormField(
                          controller: mycontrolerpassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: Color(0xFFF2F4F8),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0.r),
                                borderSide: BorderSide(
                                  color: KGreyColor1,
                                  style: BorderStyle.none
                                )),
                          ),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the Password';
                            }
                            return null;
                          },
                        ),
                      )
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5.0.w,
                        ),
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            value: checkbox,
                            checkColor: Colors.white,
                            activeColor: KBlueColor,
                            onChanged: (bool? value) {
                              setState(() {
                                checkbox = value!;
                              });
                            },
                            side: BorderSide(
                                color: KBlueColor,
                                width: 1.0.w,
                                style: BorderStyle.solid),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)),
                          ),
                        ),
                        Text("keep me signed in ")
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Onsubmet();
                        /*if(response.statusCode == 200){
                          Alert(
                            context: context,
                            title: "login success",
                            desc: "you are loged in",
                            image: Icon(Icons.call_missed_outgoing_rounded)
                          ).show();
                        }*/
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: KBlueColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.r))),
                        width: 350.w,
                        height: 45.h,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                        margin: EdgeInsets.only(
                            left: 90.0.w, right: 90.0.w, top: 20.h, bottom: 5.h),
                        child: Center(
                          child: Text("Sign In", style: KTextButtonStyled),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
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
                      height: 15.h,
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
      ),
    );
  }
}
