import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Constens.dart';
import '../../../utils/app_constants.dart';

void AddQuant(int id) async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': TOkedns
  };
  var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/api/mycart/$id/addQuantity'));
  request.fields.addAll({
    'quantity': '1'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}





void minusQuant(int id) async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization':  TOkedns
  };
  var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/api/mycart/$id/subQuantity'));
  request.fields.addAll({
    'quantity': '1'
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}

