




import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constens.dart';
import '../../../Login_display/Creat_Accounts.dart';
import '../../../Menu_display/menu_animated.dart';
import '../../../main.dart';
import '../../../utils/app_constants.dart';
import '../Models/CreatAccountModel.dart';
import '../Models/LoginModel.dart';

class SignUpProvider extends ChangeNotifier {
  bool isPressed = false;

  void getUserData() async {
    try {
      dynamic data = await fetchData( AppConstants.BASE_URL+'/api/user');
      // Process the retrieved data here
      print(data);
    } catch (e) {
      // Handle any errors that occur during the GET request
      print('Error: $e');
    }
  }



  Future<dynamic> fetchData(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Successful GET request
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      // Failed to fetch data
      throw Exception('Failed to fetch data');
    }
  }



  Future<void> onButtonPressedFalse() async {

    isPressed = false; // set the value to false
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPressed', isPressed);
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
        print(token);

        print(responseJson);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => buld_anmated_drawer(),), (route) => true);
         ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(backgroundColor: Colors.green , content: Text('Successfully Regestered ')),
      );
      }
      else{
        Alert(
          context: context,
          title: "Error",
          desc: "Please enter the verification Number",
          image: Icon(Icons.verified_user),
        ).show();

      }
      // prints "18|hXriL8AtASsL6mmBV4GsBDMFrCv7mlfJxCd4KcMD"

    } catch(e){
      logger.e(e);
    }
  }















}