import 'package:http/http.dart' as http;

  void addQuantati(int addId) async {
    var headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': 'Bearer 4|5oc5xYJ65zacvZoOIrqnyU0Kr6XZaSc8R7wU4Vwe'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/mycart/$addId/addQuantity'));
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
      'Authorization': 'Bearer 4|5oc5xYJ65zacvZoOIrqnyU0Kr6XZaSc8R7wU4Vwe'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/mycart/$subId/subQuantity'));
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
