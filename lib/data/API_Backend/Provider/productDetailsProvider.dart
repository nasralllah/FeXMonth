
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/app_constants.dart';
import '../Models/productsDetails.dart';

class productDetailsProvider extends ChangeNotifier {
  final Dio _dio;

  productDetailsProvider(this._dio) {
    _dio
      ..options.connectTimeout = Duration(milliseconds: 10000)
      ..options.responseType = ResponseType.json;
  }

  Future<List<productsDetails>> getAll() async
  {
    try {
      var response = await _dio.get(AppConstants.BASE_URL+"/api/products/voluptatem-error-sunt-et-vitae-corrupti-quisquam");
      if (response.statusCode == 200) {
        var res = response.data['data']as List;
        var productDetailsList = res.map((e) => productsDetails.fromjson(e)).toList();
        return productDetailsList;
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