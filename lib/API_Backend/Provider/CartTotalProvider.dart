
import 'dart:convert';
import 'package:http/http.dart' as http;
Future<dynamic> CartTotalProvider() async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Bearer 4|5oc5xYJ65zacvZoOIrqnyU0Kr6XZaSc8R7wU4Vwe'
  };
  var request = http.MultipartRequest('GET', Uri.parse('http://10.0.2.2:8000/api/user/mycart/total'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    String responseBody = await response.stream.bytesToString();
    var data = json.decode(responseBody);
    var itemCount = data['total'];
    return itemCount;
  }
  else {
    print(response.reasonPhrase);
    return 0;
  }

}