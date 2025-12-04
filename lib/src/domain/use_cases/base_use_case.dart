import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

class BaseUseCase {
  final QueryHelper _helper = QueryHelper();
  final Client _client = Client(dio: Dio(), storage: Storage());

  AuthModel? get lastAuth => _client.lastAuth;
}
