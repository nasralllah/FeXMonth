import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 9999999999;
   var logger = Logger();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

   logger.d(" ${options.method} ${options.path}");
    // print("--> ${options.method} ${options.path}");
   logger.d(" ${options.headers.toString()}/${options.path}");
   // logger.d("url: ${options.baseUrl.toString()}");
     logger.d("body: ${options.data.toString()}");
    // print("<-- END HTTP");

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    // logger.w(
    //    "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
    //logger.w(
              // responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      // logger.w(response.data);
    }

     ///logger
    logger.w("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    logger.d("ERROR[${err?.response?.statusCode}] => PATH: ${err?.requestOptions?.path}");
    return super.onError(err, handler);
  }
}
