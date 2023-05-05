
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../Models/HomeStoresModel.dart';
import '../Models/SelectShippingModel.dart';
class SelectShippingProvider extends ChangeNotifier {
  final Dio _dio;

  SelectShippingProvider(this._dio) {
    _dio
      ..options.connectTimeout = const Duration(milliseconds: 100000)
      ..options.responseType = ResponseType.json;
  }
  Future<void> getssAll() async
  {
    try {
      var response = await _dio.get("http://10.0.2.2:8000/api/shipping/types");
      if (response.statusCode == 200) {
        // var res = response.data[0]as List;
        // print(response.data);
        // var ShippingOptionlist = res.map((e) => ShippingOption.fromJson(e)).toList();
        // return ShippingOptionlist;
        final List<dynamic> data = response.data;
        final List<ShippingOption> shippingoption = data.map((e) => ShippingOption.fromJson(e)).toList();
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