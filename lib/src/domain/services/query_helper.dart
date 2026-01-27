import 'package:dio/dio.dart';

class QueryHelper {
  static Future<void> request<T>({
    required Future<T> Function() request,
    required Function(T) onResponse,
    required Function(String) onError,
  }) async {
    try {
      T response = await request();
      onResponse(response);
    } on Exception catch (e) {
      onError(castError(e));
    }
  }

  static String castError(Exception e) {
    if (e is! DioException) {
      return e.toString();
    }

    if (e.response == null) {
      return e.toString();
    }

    try {
      return "${e.response!.data["message"]} (${e.response!.statusCode})";
    } on Exception {
      return e.response!.statusCode.toString();
    }
  }
}
