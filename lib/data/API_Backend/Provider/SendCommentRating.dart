import 'dart:convert';
import 'package:fexmonths/Constens.dart';
import 'package:http/http.dart' as http;

import '../../../Prudoct_display/CardRating.dart';
import '../../../utils/app_constants.dart';


void SendReview() async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': TOkedns
  };
  var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL+'/api/products/$Slug/rates'));
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