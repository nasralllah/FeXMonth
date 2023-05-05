
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/NotifcationCartNumberModel.dart';

Future<CartNumber> CartnumberNotifcation() async {

  try{
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Bearer 4|5oc5xYJ65zacvZoOIrqnyU0Kr6XZaSc8R7wU4Vwe'};


  var request = http.MultipartRequest('GET', Uri.parse('http://10.0.2.2:8000/api/user/mycart/count'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {

    var jsonString = await response.stream.bytesToString();
    var jsonData = jsonDecode(jsonString);
    var cartNumber = CartNumber.fromJson(jsonData);
    print(cartNumber);
    return cartNumber;
  }
  throw Exception("__ Erorr in CartnumberNotifcation() __");
  }
  on Exception catch(ex){
    throw Exception("__ Exception Erorr ${ex.toString()}");
  }


}
