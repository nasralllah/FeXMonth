


import 'package:fexmonths/Constens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_constants.dart';
import '../ApiPost.dart';
import 'CreatAccountProvider.dart';
void addToCart(context) async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': TOkedns
  };
  var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/api/products/$Slug/mycart/add'));
  request.fields.addAll({
    'quantity': "$theNumber"
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context ).showSnackBar(

      const SnackBar(backgroundColor: Colors.green , content: Text('Successfully added to cart ')),
    );
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}
