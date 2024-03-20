
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/app_constants.dart';
import '../Models/Catogry_Models.dart';


class CategoryProvider extends ChangeNotifier {
  final Dio _dio;

  CategoryProvider(this._dio) {
    _dio
      ..options.connectTimeout = Duration(milliseconds: 10000)
      ..options.responseType = ResponseType.json;
  }

  Future<List<Cateogory>> getAll() async
  {
    try {
      var response = await _dio.get(AppConstants.BASE_URL+"/api/home/categories");
      if (response.statusCode == 200) {
        var res = response.data['data'] as List;
        var catogeryList = res.map((e) => Cateogory.fromjson(e)).toList();
        return catogeryList;
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