
import 'package:dio/dio.dart';
import 'package:fexmonths/Constens.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../../../../Prudoct_display/CardRating.dart';
import '../../../../utils/app_constants.dart';
import '../../Models/CommentRatingModel.dart';

class CommentsRatingProvider extends ChangeNotifier {
  final Dio _dio;


  var logger = Logger();
  CommentsRatingProvider(this._dio) {
    _dio
      ..options.connectTimeout = const Duration(milliseconds: 100000)
      ..options.responseType = ResponseType.json;
  }

  Future<SendDataRating> getAll({required String Slug}) async
  {
    try {
      var response = await _dio.get("${AppConstants.BASE_URL}/api/products/$Slug/rates");
      if (response.statusCode == 200) {
        logger.w(
            "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
        logger.w(response.data);
       var res = response.data;
        logger.d(" ${response.requestOptions.method} ${response.requestOptions.path}");
        logger.d(" ${response.requestOptions.headers.toString()}/${response.requestOptions.path}");

         logger.w(res["data"][0]['id']);
         logger.w(res['data'][0]['writer']['id']);

         return response.data;

      }  else{
        print(response.statusCode);
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