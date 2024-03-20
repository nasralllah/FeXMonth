import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Constens.dart';
import '../../../Pay_ment/Alet_CheckOut.dart';
import '../../../Pay_ment/addAddress.dart';
import '../../../Pay_ment/shppingWidget.dart';
import '../../../utils/app_constants.dart';
import '../Models/CreatOrderModel.dart';
import '../Models/CreatOrderModel.dart';
import '../Models/CreatOrderModel.dart';
import '../Models/CreatOrderModel.dart';
import '../Models/CreatOrderModel.dart';
import '../Models/CreatOrderModel.dart';
import '../Models/CreatOrderModel.dart';

Future CreatOrder() async {
  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization':TOkedns,
  };
  // http.Response response = await http.post(Uri.parse('http://10.0.2.2:8000/api/orders/create'),
  //   headers: headers,
  //   body: {
  //     'address': '${Addrss[1]}',
  //     'shipping type': '${shpp[1]}',
  //     'coupon': CooController.text,
  //     'note': noteConroller.text
  //   }
  //
  // )
  // ;
  var cobons = CooController.text == ""? null:CooController.text;
  var request = await  http.MultipartRequest('post', Uri.parse(AppConstants.BASE_URL+'/api/orders/create'));
  request.fields.addAll({
    'address': '${Addrss[1]}',
         'shipping type': '${shpp[1]}',
         'coupon': "$cobons" ?? " ",
         'note': noteConroller.text ?? " "
  });
  request.headers.addAll(headers);
  http.StreamedResponse response= await request.send();
  if (response.statusCode == 200) {

    String responseBody =await response.stream.bytesToString();
    var jsoresponse= json.decode(responseBody);
    CreatOrderModel creatOrder =CreatOrderModel.fromjson(jsoresponse);
    print(creatOrder.data);

  }



}
