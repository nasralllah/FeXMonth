
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../Models/HomeStoresModel.dart';
import '../Models/chekingCodeModel.dart';
class ChekingCode extends ChangeNotifier {
  final Dio _dio;

  ChekingCode(this._dio) {
    _dio
      ..options.connectTimeout = const Duration(milliseconds: 100000)
      ..options.responseType = ResponseType.json
      ..options.headers ={
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': 'Bearer jFEaaTImCRv0tjjEMjQaankcif7rNatQZ6I63CrW'
      };
  }

  Future<List<CheekingCodeModel>> getAll(String coo) async
  {
    try {
      var response = await _dio.get("http://10.0.2.2:8000/api/coupons/$coo/check");
      if (response.statusCode == 200) {
        var res = response.data;
        print(response.data);
      final json = jsonDecode(res);
      return json;
      }
      throw Exception("__ Erorr in get ALl Products __");
    }
    on DioError catch (err) {
      throw Exception("__Dio Erorr:${err.error}");
    }
    on Exception catch (ex) {
      throw Exception("__ Exception Erorr ${ex.toString()}");
    }
  }
}