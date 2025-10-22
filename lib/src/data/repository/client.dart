import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

class Client implements Repository {
  final Dio _dio;

  Client(this._dio);

  @override
  String get baseEndpoint => "https://www.google.com/";
}
