import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Constens.dart';
import '../../../Menu_display/Address.dart';
import '../../../utils/app_constants.dart';
import '../ApiPost.dart';
import 'CreatAccountProvider.dart';


void SendAddressProvider() async {
  var headers = {
    
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': TOkedns
  };
  var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/api/addresses/create'));
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
