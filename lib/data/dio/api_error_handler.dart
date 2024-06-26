import 'package:dio/dio.dart';

import '../response/error_response.dart';


class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription ="Request to API server was cancelled";
              break;
            case DioErrorType.connectionTimeout:
             errorDescription = "Connection timeout";
             break;
            case DioErrorType.unknown:
                errorDescription = "Connection failed due to internet connection";
              break;

            case DioErrorType.receiveTimeout:
              errorDescription =
              "Receive timeout in connection";
              break;
            case DioErrorType.badResponse:
              switch (error.response?.statusCode) {
                case 404:
                case 500:
                case 503:
                  errorDescription = error.response?.statusMessage;
                  break;
                default:
                  ErrorResponse errorResponse =
                  ErrorResponse.fromJson(error.response?.data);
                  if (errorResponse.errors != null &&
                      errorResponse.errors!.length > 0)
                    errorDescription = errorResponse;
                  else
                    errorDescription =
                    "Failed to load data - status code: ${error.response?.statusCode}";
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
            case DioErrorType.badCertificate:
              // TODO: Handle this case.
              break;
            case DioErrorType.connectionError:
              // TODO: Handle this case.
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
