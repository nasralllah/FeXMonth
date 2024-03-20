
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/app_constants.dart';
import '../Models/StorsDisplayModel.dart';

class StoresDetailsProvider extends ChangeNotifier {
  final Dio _dio;

  StoresDetailsProvider(this._dio) {
    _dio
      ..options.connectTimeout = Duration(milliseconds: 10000)
      ..options.responseType = ResponseType.json;
  }

  Future<List<StoresDisplay>> getAll() async
  {
    try {
      var response = await _dio.get(AppConstants.BASE_URL+"/api/stores");
      if (response.statusCode == 200) {
        var res = response.data['data']as List;
        var StoresDisplaylist = res.map((e) => StoresDisplay.fromjson(e)).toList();
        return StoresDisplaylist;
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