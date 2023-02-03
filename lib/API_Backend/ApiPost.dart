import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../Login_display/Creat_Accounts.dart';
import '../Login_display/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constens.dart';
import '../main.dart';

Future<void> senddata(BuildContext context) async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Bearer 22|Fj8UYSP2BdJDKYhMNtM5qZdlmTGzca75JTDMSwue'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://10.0.2.2:8000/api/register'));
  request.fields.addAll({
    /*'email': myControllerEmail.text,
    'password': myControllerpassword.text,
    'name': myControllername.text,
    'password_confirmation': myControllerrepassword.text*/
    'email': myControllerEmail.text,
    'password': myControllerpassword.text,
    'name': myControllername.text,
    'password_confirmation': myControllerrepassword.text
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    Alert(
            context: context,
            title: "login success",
            desc: "you are loged in",
            image: Icon(Icons.call_missed_outgoing_rounded))
        .show();
  } else {
    print(response.reasonPhrase);
    Alert(
      context: context,
      title: "Error",
      desc: "you are not lodged in,the email is already exists",
      image: Icon(FontAwesomeIcons.x),
    ).show();
  }
}

Future<void> senddatalogin(BuildContext contextr) async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Bearer 22|Fj8UYSP2BdJDKYhMNtM5qZdlmTGzca75JTDMSwue'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://10.0.2.2:8000/api/login'));

  request.fields.addAll({
    'email': mycontrolerusername.text,
    'password': mycontrolerpassword.text
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    Alert(
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
              Navigator.push(
                  contextr,
                  MaterialPageRoute(
                    builder: (context) => Femonths(),
                  ));
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
