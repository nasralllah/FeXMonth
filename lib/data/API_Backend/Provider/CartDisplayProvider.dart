// 8|i9NGiO8jZU2hRgq2FpD20I4ty9kDEXLWmQibPiHy

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../Constens.dart';
import '../../../utils/app_constants.dart';
import '../ApiPost.dart';
import '../Models/CartDisplayModel.dart';
import '../Models/Products_Model.dart';
import 'CreatAccountProvider.dart';

class CartDisplayProviders extends ChangeNotifier {
  final Dio _dio;

  CartDisplayProviders(this._dio) {
    _dio
      ..options.connectTimeout = Duration(milliseconds: 10000)
      ..options.responseType = ResponseType.json
      ..options.headers = {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
        'Authorization': TOkedns
      };
  }

  Future<List<CartDisplayModel>> getAll() async {
    try {
      var response = await _dio.get(AppConstants.BASE_URL+"/api/user/mycart");
      if (response.statusCode == 200) {
        var res = response.data['data']  as List;
        var productList = res.map((e) => CartDisplayModel.fromJson(e)).toList();
        print(response.data);
        print(productList);
        return productList;
      }
      throw Exception("__ Erorr in get ALl Products __");
    } on DioError catch (err) {
      throw Exception("__Dio Erorr:${err.error}");
    } on Exception catch (ex) {
      throw Exception("__ Exception Erorr ${ex.toString()}");
    }
  }
}
