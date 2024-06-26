
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../Constens.dart';
import '../../../utils/app_constants.dart';
import '../ApiPost.dart';
import '../Models/HomeStoresModel.dart';
import '../Models/MyAddressModel.dart';
import 'CreatAccountProvider.dart';
class myAddressProvider extends ChangeNotifier {
  final Dio _dio;

  myAddressProvider(this._dio) {
    _dio
      ..options.connectTimeout = const Duration(milliseconds: 100000)
      ..options.responseType = ResponseType.json
        ..options.headers ={
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/vnd.api+json',
      'Authorization': TOkedns
    };
  }

  Future<List<myAddressModel>> getAll() async
  {
    try {
      var response = await _dio.get(AppConstants.BASE_URL+"/api/user/addresses");
      if (response.statusCode == 200) {
        var res = response.data['data']as List;
        print(response.data);
        var myAddressList = res.map((e) => myAddressModel.fromjson(e)).toList();
        return myAddressList;
      }
      throw Exception("__ Erorr in get ALl Products __");
    }
    on DioError catch (err) {
      throw Exception("__Dio Erorr:${err.message}");
    }
    on Exception catch (ex) {
      throw Exception("__ Exception Erorr ${ex.toString()}");
    }
  }
}