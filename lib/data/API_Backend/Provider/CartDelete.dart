import 'dart:convert';
import 'package:fexmonths/Constens.dart';
import 'package:fexmonths/data/API_Backend/ApiPost.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_constants.dart';
import 'CreatAccountProvider.dart';
class CartProvider extends ChangeNotifier{
  void CartDelete(String id) async {
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': TOkedns
    };
    var request = http.MultipartRequest(
        'DELETE', Uri.parse(AppConstants.BASE_URL+'/api/mycart/$id/delete'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      notifyListeners();

    }
    else {
      print(response.reasonPhrase);
    }
  }
}

