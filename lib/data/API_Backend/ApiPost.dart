import 'dart:convert';

import 'package:fexmonths/Home_display/the_main_screen.dart';
import 'package:fexmonths/Menu_display/menu_animated.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constens.dart';
import '../../Login_display/Creat_Accounts.dart';
import '../../Login_display/login_screen.dart';
import '../../main.dart';
import '../../utils/app_constants.dart';
import 'Models/CreatAccountModel.dart';
import 'Models/LoginModel.dart';

class LoginProvider extends ChangeNotifier {
  bool isPressed = false;

  String? userName;
  String? email;
  String? pic;
  String? token;
  String? accType;

  Future<void> senddatalogin(BuildContext contextr) async {
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(AppConstants.BASE_URL + '/api/login'));

    request.fields.addAll({
      'email': mycontrolerusername.text,
      'password': mycontrolerpassword.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var responseJson = jsonDecode(responseBody);

      print(responseJson['status']);
      print(responseJson['data']['user']['email']);
      print(responseJson['data']['user']['username']);
      print(responseJson['data']['user']['profile_photo_url']);
      print(responseJson['data']['token']);

      ChildUser1 childuser = ChildUser1(
          username: responseJson['data']['user']['username'],
          name: responseJson['data']['user']['name'],
          email: responseJson['data']['user']['email'],
          phone_number: responseJson['data']['user']['phone_number'],
          updated_at: responseJson['data']['user']['updated_at'],
          created_at: responseJson['data']['user']['created_at'],
          id: responseJson['data']['user']['id'],
          profile_photo_url: responseJson['data']['user']['profile_photo_url'],
          account_type: responseJson['data']['user']['account_type'],
          current_team_id: responseJson['data']['user']['current_team_id'],
          deleted_at: responseJson['data']['user']['deleted_at'],
          email_verified_at: responseJson['data']['user']['email_verified_at'],
          phone_number_verified_at: responseJson['data']['user']['phone_number_verified_at'],
          profile_photo_path: responseJson['data']['user']['profile_photo_path'],
          two_factor_confirmed_at: responseJson['data']['user']['two_factor_confirmed_at']);
      ChildData1 childdata = ChildData1(user: childuser, remember_token: responseJson['remember_token'], token: responseJson['token']);
      LoginModel loginModel = LoginModel(
          status: responseJson['status'],
          message: responseJson['message'],
          data: childdata);

      token = responseJson['data']['token'];
      AppConstants.TOKEN ="Bearer " + "${token!}";
      TOkedns = AppConstants.TOKEN;
      print(token);

      print(AppConstants.TOKEN);
      accType = responseJson['data']['user']['account_type'] ;
      AppConstants.ACCOUNT_TYPE = accType! ;
      //print( "Token " + token!);
      userName = responseJson['data']['user']['username'];
      AppConstants.USER= userName!;
      //  print("userName" + userName!);
      email = responseJson['data']['user']['email'];
      AppConstants.USER_EMAIL=email!;
      //    print("email" + email!);
      pic = responseJson['data']['user']['profile_photo_url'];
//      print("pic" + pic!);

      Alert(
          closeFunction: () {
            Get.offAll(buld_anmated_drawer());
          },
          context: contextr,
          title: "login success",
          desc: "you are loged in",
          image: Icon(Icons.call_missed_outgoing_rounded),
          buttons: [
            DialogButton(
              child: Text(
                "cool",
                style: KTextButtonStyled,
              ),
              onPressed: () {
                Get.offAll(buld_anmated_drawer());
              },
            )
          ]).show();
    } else {
      print(response.reasonPhrase);
      Alert(
          context: contextr,
          title: "Erorr ",
          desc: "password or email is wrongn",
          image: Icon(FontAwesomeIcons.x),
          buttons: [
            DialogButton(
              child: Text(
                "OK",
                style: KTextButtonStyled,
              ),
              onPressed: () {
                Navigator.pop(contextr);
              },
            )
          ]).show();
    }
  }
}
