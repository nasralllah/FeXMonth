
// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/app_constants.dart';
import 'Models/CommentModel.dart';
class CommentsProvider extends ChangeNotifier {
  final Dio _dio;

  CommentsProvider(this._dio) {
    _dio
      ..options.connectTimeout = const Duration(milliseconds: 100000)
      ..options.responseType = ResponseType.json;
  }

  Future<Comments> getAll({required String Slug}) async
  {
    try {
      var response = await _dio.get(AppConstants.BASE_URL+"/api/products/$Slug/comments");
      if (response.statusCode == 200) {
        var res = response.data['data'];

        print(res);
        Comments SingleProductList = Comments.fromjson(res);
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