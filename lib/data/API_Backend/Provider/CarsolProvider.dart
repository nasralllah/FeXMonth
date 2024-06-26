import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import '../../../utils/app_constants.dart';
import '../Models/news.dart';



class carsoleProvider extends ChangeNotifier{

  final Dio _dio;

  carsoleProvider(this._dio){

    _dio
    ..options.connectTimeout = Duration(milliseconds: 10000)
        ..options.responseType = ResponseType.json;

  }


  Future<List<News>> getAll()async
  {
    try{
        var respnse = await _dio.get(AppConstants.BASE_URL+AppConstants.NEWS);
        if(respnse.statusCode == 200)
        {
          var res = respnse.data['data'] as List;
         var carsullist = res.map((e) => News.fromJson(e)).toList();
         return carsullist;
        }
        throw Exception("__ Erorr in get ALl Products __");
    }
    on DioError catch(err){
      throw Exception("__Dio Erorr:${err.error}");

    }
    on Exception catch(ex){
      throw Exception("__ Exception Erorr ${ex.toString()}");
    }
  }



}