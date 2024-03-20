import 'package:http/http.dart' as http;

import '../../../Constens.dart';
import '../../../utils/app_constants.dart';
import '../ApiPost.dart';
import 'CreatAccountProvider.dart';

  void addQuantati(int addId) async {
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': TOkedns
    };
    var request = http.MultipartRequest('POST', Uri.parse(  AppConstants.BASE_URL+'/api/mycart/$addId/addQuantity'));
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



  void subQuantsti(int subId) async {
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': TOkedns
    };
    var request = http.MultipartRequest('POST', Uri.parse(  AppConstants.BASE_URL+'/api/mycart/$subId/subQuantity'));
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
