import 'package:dio/dio.dart';

class QueryHelper {
  Future<void> request<T>({
    required Future<T> Function() request,
    required void Function(T) onReponse,
    required void Function(String) onError,
  }) async {
    try {
      T response = await request();
      onReponse(response);
    } on Exception catch (e) {
      onError(castError(e));
    }
  }

  String castError(Exception e) {
    if (e is DioException) {
      if (e.response != null) {
        try {
          return "${e.response!.data["msg"]} (${e.response!.statusCode})";
        } on Exception {
          return e.toString();
        }
      }
    }
    return e.toString();
  }
}
