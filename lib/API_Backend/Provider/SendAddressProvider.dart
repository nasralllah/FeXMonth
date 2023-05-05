import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Menu_display/Address.dart';

void SendAddressProvider() async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': 'Bearer 4|5oc5xYJ65zacvZoOIrqnyU0Kr6XZaSc8R7wU4Vwe'
  };
  var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/addresses/create'));
  request.fields.addAll({
    'lat': lat.toString(),
    'lng': lang.toString(),
    'phone_number':textEditingControllerNumber.text ,
    'address': textEditingController.text,
    'description': textEditingControllerDescreption.text,
    'name': textEditingControllerTitle.text
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    print(lat);
    print(lang);
    print(lat);
    print(lang);
  }
  else {
    print(response.reasonPhrase);
    print(response.statusCode);
    print(lat);
    print(lang);
    print(lat);
    print(lang);
  }

}
