
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../Models/HomeStoresModel.dart';
class HomeStoresProvider extends ChangeNotifier {
  final Dio _dio;

  HomeStoresProvider(this._dio) {
    _dio
      ..options.connectTimeout = const Duration(milliseconds: 100000)
      ..options.responseType = ResponseType.json;
  }

  Future<List<HomeStores>> getAll() async
  {
    try {
      var response = await _dio.get("http://10.0.2.2:8000/api/home/stores");
      if (response.statusCode == 200) {
        var res = response.data['data']as List;
        print(response.data);
        var HomeStoreslist = res.map((e) => HomeStores.fromJson(e)).toList();
        return HomeStoreslist;
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