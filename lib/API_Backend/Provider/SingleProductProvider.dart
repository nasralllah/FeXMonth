
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../Models/SingleProductModel.dart';
class SingleProductProvider extends ChangeNotifier {
  final Dio _dio;

  SingleProductProvider(this._dio) {
    _dio
      ..options.connectTimeout = const Duration(milliseconds: 100000)
      ..options.responseType = ResponseType.json;
  }

  Future<SingleProductModel> getAll({required String Slug}) async
  {
    try {
      var response = await _dio.get("http://10.0.2.2:8000/api/products/${Slug.toString()}");
      if (response.statusCode == 200) {
        var res = response.data['data'];
        print(response.data);
        SingleProductModel SingleProductList = SingleProductModel.fromJson(res);
        // MapEntry<String,dynamic> entry = MapEntry(res, res['name']);
        return SingleProductList;
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