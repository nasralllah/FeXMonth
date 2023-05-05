import 'dart:convert';
import 'package:fexmonths/Constens.dart';
import 'package:http/http.dart' as http;

import '../../Prudoct_display/CardRating.dart';
import '../../Prudoct_display/Single_Product.dart';

void SendReview() async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Bearer 4|5oc5xYJ65zacvZoOIrqnyU0Kr6XZaSc8R7wU4Vwe'
  };
  var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/products/$Slug/rates'));
  request.fields.addAll({
    'review': myControllerRating.text,
    'rate': '$Ratingg'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());



  }
  else {
    print(response.reasonPhrase);
    print(myControllerRating.text);
    print(Ratingg);
  }

}