
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../Models/AllProductDisplayModel.dart';
class AllProductsDisplayProvider extends ChangeNotifier {
  final Dio _dio;

  AllProductsDisplayProvider(this._dio) {
    _dio
      ..options.connectTimeout = Duration(milliseconds: 10000)
      ..options.responseType = ResponseType.json;
  }

  Future<List<AllProductDisplayModel>> getAll() async
  {
    try {
      var response = await _dio.get("http://10.0.2.2:8000/api/products");
      if (response.statusCode == 200) {
        var res = response.data['data']as List;
        var productDisplaylist = res.map((e) => AllProductDisplayModel.fromjson(e)).toList();
        return productDisplaylist;
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