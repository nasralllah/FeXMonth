
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../Constens.dart';
import '../../../Pay_ment/Alert.dart';
import '../../../utils/app_constants.dart';
import '../ApiPost.dart';
import '../Models/HomeStoresModel.dart';
import '../Models/chekingCodeModel.dart';
import 'CreatAccountProvider.dart';
class ChekingCode extends ChangeNotifier {
  final Dio _dio;

  ChekingCode(this._dio) {
    _dio
      ..options.connectTimeout = const Duration(milliseconds: 100000)
      ..options.responseType = ResponseType.json
      ..options.headers ={
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': TOkedns
      };
  }

  Future<List<CheekingCodeModel>> getAll(String coo,BuildContext context) async
  {
    try {
      var response = await _dio.get(AppConstants.BASE_URL+"/api/coupons/$coo/check");
      if (response.statusCode == 200) {
        showdailg(context,'Success',"Images/Group 446.png","The coupon code","is correct");
        var res = response.data;
        print(response.data);
      final json = jsonDecode(res);
      return json;

      }
      throw Exception("__ Erorr in get ALl Products __");
    }
    on DioError catch (err) {
      showdailg(context,'fiald',"Images/invodcoo.png","The coupon code is not","correct, try another code");
      throw Exception("__Dio Erorr:${err.error}");
    }
    on Exception catch (ex) {
      showdailg(context,'fiald',"Images/invodcoo.png","The coupon code is not","correct, try another code");

      throw Exception("__ Exception Erorr ${ex.toString()}");
    }
  }
}