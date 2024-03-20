import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Constens.dart';
import '../../../Prudoct_display/CardCommnents.dart';
import '../../../utils/app_constants.dart';


void SendCommment() async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': TOkedns
  };
  var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/api/products/$Slug/comments'));
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