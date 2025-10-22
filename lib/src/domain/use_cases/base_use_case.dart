import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

class BaseUseCase {
  final Client _client = Client(Dio());
}
