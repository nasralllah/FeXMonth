import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Constens.dart';
import '../../Prudoct_display/CardCommnents.dart';

void SendCommment() async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Bearer 4|5oc5xYJ65zacvZoOIrqnyU0Kr6XZaSc8R7wU4Vwe'
  };
  var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/products/$Slug/comments'));
  request.fields.addAll({
    'comment': commentController.text

  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
    print( commentController.text);
  }

}