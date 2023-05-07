import 'dart:convert';
import 'package:fexmonths/Constens.dart';
import 'package:http/http.dart' as http;

void CartDelete(String id) async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': header
  };
  var request = http.MultipartRequest(
      'DELETE', Uri.parse('http://10.0.2.2:8000/api/mycart/$id/delete'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }
}
