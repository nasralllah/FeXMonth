
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../Models/Products_Model.dart';


class ProductsProvider extends ChangeNotifier{
  final Dio _dio;

  ProductsProvider(this._dio){
    _dio
    ..options.connectTimeout = Duration(milliseconds: 10000)
    ..options.responseType = ResponseType.json;

  }

  Future<List<prducts>> getAll(int id)async
  {

    try{
      var response = await _dio.get("http://10.0.2.2:8000/api/home/products/categories/$id");
      if(response.statusCode == 200)
      {
        var res = response.data['data'] as List;
        var productList = res.map((e) => prducts.fromJson(e)).toList();
        print(response.data);
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
