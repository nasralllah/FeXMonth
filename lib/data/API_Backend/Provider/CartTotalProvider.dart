
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Constens.dart';
import '../../../utils/app_constants.dart';
import '../ApiPost.dart';
import 'CreatAccountProvider.dart';
Future<dynamic> CartTotalProvider() async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': TOkedns
  };
  var request = http.MultipartRequest('GET', Uri.parse(AppConstants.BASE_URL+'/api/user/mycart/total'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    String responseBody = await response.stream.bytesToString();
    var data = json.decode(responseBody);
    var itemCount = data['data']['total'];
    return itemCount;
  }
  else {
    print(response.reasonPhrase);
    return 0;
  }

}