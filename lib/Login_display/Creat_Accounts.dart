import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constens.dart';
import '../data/API_Backend/ApiPost.dart';
import '../data/API_Backend/Models/CreatAccountModel.dart';
import '../data/API_Backend/Provider/CreatAccountProvider.dart';
import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_constants.dart';
import '../view/base_widget/Creat_Account_TextFiled.dart';
import '../view/base_widget/Icons_sochail.dart';

final myControllername = TextEditingController();
final myControllerEmail = TextEditingController();
final myControllerpassword = TextEditingController();
final myControllerrepassword = TextEditingController();
final myControllerUserName = TextEditingController();
final codeController = TextEditingController();
final myControllerPhoneNumber = TextEditingController();

final formKeyEmail = GlobalKey<FormState>();
final formKeyName = GlobalKey<FormState>();
final formKeyPassword = GlobalKey<FormState>();
final formKeyRe_Password = GlobalKey<FormState>();
final formKeyUserName = GlobalKey<FormState>();
final formKeyCode = GlobalKey<FormState>();
final formKeyPhoneNumber = GlobalKey<FormState>();
var password = '';
var re_password = '';
String? token ;
late String userName ;
late String email;
late String pass;
bool checkbox = false;
List<CreatAccountModel>? CreatAccountList;


void loginVerf(String userName , String email,String pass ){
  userName= userName;
  email = email;
  pass = pass;

}
Future<void> phoneNumberVerify(BuildContext context, String code) async {
  var logger = Logger();
  try{

    final response = await http.post(
      Uri.parse(AppConstants.BASE_URL+'/api/phoneNumberVerify'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email ,
        'password': pass,
        'phone_number_code': code,
      }),
    );


    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // then parse the JSON.

      var responseJson = jsonDecode(response.body);
      print(responseJson['status']);
      print(responseJson['data']['user']['email']);
      print(responseJson['data']['token']);
      // LoginModel loginModel = LoginModel(status: responseJson['status'],
      //     message: responseJson['message'],
      //     data: responseJson['data'] );
      //
      token = responseJson['data']['token'];
  print("ssssss");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => buld_anmated_drawer(),), (route) => true);
      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(backgroundColor: Colors.green , content: Text('Successfully Regestered ')),
      );
    }
    else{
      Alert(
        context: context,
        title: "failed",
        desc: "fa",
        image: Icon(FontAwesomeIcons.x),
      );

    }
    // prints "18|hXriL8AtASsL6mmBV4GsBDMFrCv7mlfJxCd4KcMD"

  } catch(e){
    logger.e(e);
  }
}
Future<CreatAccountModel> senddata({required BuildContext context}) async {
  // var headers = {
  //   'Accept': 'application/vnd.api+json',
  //   'Content-Type': 'application/vnd.api+json',
  //   'Authorization': TOkedns
  // };
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json'
  };
  var request = http.MultipartRequest(
      'post', Uri.parse(AppConstants.BASE_URL + '/api/register'));
  request.fields.addAll({
    'username': myControllerUserName.text,
    'name': myControllername.text,
    'phone_number': myControllerPhoneNumber.text,
    'email': myControllerEmail.text,
    'password': myControllerpassword.text,
    'password_confirmation': myControllerrepassword.text,
    'hasRemmberToken': '$checkbox'
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseBody = await response.stream.bytesToString();
    print("Response: $responseBody"); // add this line to print the response
    Map<String, dynamic> jsoresponse = json.decode(responseBody);
    CreatAccountModel creatAccount = CreatAccountModel.fromJson(jsoresponse);
     email= creatAccount.data.user.email;
    userName= creatAccount.data.user.username;
    pass = myControllerpassword.text;
    print(email);
    print(userName);
    AppConstants.USER_EMAIL = email;
    AppConstants.USER = userName;


   loginVerf( myControllerEmail.text,myControllerUserName.text ,myControllerpassword.text );
    print(jsoresponse);


  Alert(
      context: context,
      title: "Error",
      desc: "you are not lodged in,the email is already exists",
      image: const Icon(FontAwesomeIcons.x),
      content: Column(
        children: [
          SizedBox(height: 10.h),
          TextField(
            controller: codeController,
            decoration: InputDecoration(
              isDense: true,
              hintText: "Enter the verfcation Code",
              fillColor: Color(0xFFF2F4F8),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0.r),
                  borderSide: BorderSide(
                      color: KGreyColor1,
                      style: BorderStyle.none
                  )),
            ),
          )
        ],

      ),
      buttons: [
        DialogButton(
            child: Text("Send", style: TextStyle(
                color: Colors.white
            )
            ),
            onPressed: () {
             phoneNumberVerify(
                  context, codeController.text);

            })
      ],

    ).show();
    return creatAccount;
  }
  else {
    print(response.statusCode);

    Alert(
      context: context,
      title: "Error",
      desc: "you are not lodged in,the email is already exists",
      image: Icon(FontAwesomeIcons.x),
    ).show();
  }
  throw Exception("dsfjlskfjlskdf");
}


class Create_Account extends StatefulWidget {

  const Create_Account({Key? key}) : super(key: key);

  @override
  State<Create_Account> createState() => _Create_AccountState();


}
class _Create_AccountState extends State<Create_Account> {
   Onsubmet(BuildContext context)async{
    if (formKeyEmail.currentState == null) {
      print("_formKey.currentState is null!");
    } else if (formKeyEmail.currentState!.validate()&&formKeyName.currentState!.validate()&&formKeyPassword.currentState!.validate()&&formKeyRe_Password.currentState!.validate()) {


      // phoneNumberVerify(Provider.of<SignUpProvider>(context).myControllerEmail.text, Provider.of<SignUpProvider>(context).myControllerpassword.text, Provider.of<SignUpProvider>(context).codeController.text);

      senddata(context: context).then((value) => (value) {

        CreatAccountList = [];
        CreatAccountList!.addAll(value);
        print(CreatAccountList![0].data);
      });



    }
  }
  @override
  void initState() {

    super.initState();
  }


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
            child: SizedBox(
              height: 769.h,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //    color: Colors.red,
                      alignment: AlignmentDirectional.topEnd,
                      margin: EdgeInsets.only(right: 20.w),
                      /*  width: 45,
                      height: 45,*/



                      child:  GestureDetector(
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Creat_Account_TextFiled(
                              hintText: "User Name",
                              obscureText: false,
                              controlers:myControllerUserName,
                              Globelhey: formKeyUserName, Validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Your User Name';
                              }
                              return null;
                            }, onChange: (string ) {  },
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ), Creat_Account_TextFiled(
                              hintText: "Name",
                              obscureText: false,
                              controlers:myControllername,
                              Globelhey:formKeyName, Validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Your Name';
                              }
                              return null;
                            }, onChange: (String ) {  },
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ), Creat_Account_TextFiled(
                              hintText: "PhoneNumber",
                              obscureText: false,
                              controlers:myControllerPhoneNumber,
                              Globelhey: formKeyPhoneNumber, Validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Your PhoneNumber';
                              }
                              return null;
                            }, onChange: (String ) {  },
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Creat_Account_TextFiled(
                              hintText: "Email",
                              obscureText: false,
                              controlers: myControllerEmail,
                              Globelhey: formKeyEmail, Validator: (value)
                            {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Your Email';
                              }
                              return null;

                            }, onChange: (String ) {  },
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Creat_Account_TextFiled(
                              hintText: "password",
                              obscureText: false,
                              controlers: myControllerpassword,
                              onChange: (String) {
                                password = String;
                              },
                              Globelhey: formKeyPassword, Validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Please Enter Your Password';
                              }
                              else if(value.length <=8){
                                return 'The Password must be More than 8 Numbers';
                              }
                              return null;
                            },
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Creat_Account_TextFiled(
                              hintText: "re-Password",
                              obscureText: false,
                              controlers: myControllerrepassword,
                              Globelhey: formKeyRe_Password,
                              onChange: (String ) {
                                re_password = String;
                              },
                              Validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Please Enter Your Name';
                                }
                                else if(value.length <= 8){
                                  print(value.hashCode);
                                  return 'The Password must be More than 8 Numbers';
                                }
                                else if(password != re_password ){
                                  return 'The passwords doesn\'t Match';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
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
                            onChanged: (value) {
                              setState(() {
                                checkbox = value!;
                                print('$checkbox');
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
                        // senddata(context: context, email: myControllerEmail.text);
                        Onsubmet(context);


                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: KBlueColor,
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
      ),
    );

  }
}
