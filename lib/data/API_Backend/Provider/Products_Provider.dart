
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/app_constants.dart';
import '../Models/Products_Model.dart';
import 'package:logger/logger.dart';


class ProductsProvider extends ChangeNotifier{
  final Dio _dio;

  ProductsProvider(this._dio){
    _dio
    ..options.connectTimeout = Duration(milliseconds: 10000)
    ..options.responseType = ResponseType.json;

  }

  Future<List<prducts>> getAll(int id)async
  {
var logger = Logger();
    try{
      var response = await _dio.get(AppConstants.BASE_URL+"/api/home/products/categories/$id");
      if(response.statusCode == 200)
      {
        logger.w(
           "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
         logger.w(response.data);
        var res = response.data['data'] as List;
        var productList = res.map((e) => prducts.fromJson(e)).toList();
        // print(response.data);
        logger.d(" ${response.requestOptions.method} ${response.requestOptions.path}");
        logger.d(" ${response.requestOptions.headers.toString()}/${response.requestOptions.path}");
        logger.d("body: ${response.requestOptions.data.toString()}");


        logger.w("<-- END HTTP");
        return productList;
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
