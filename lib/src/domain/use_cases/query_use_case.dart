import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';

class QueryUseCase {
  final QueryHelper _helper = QueryHelper();
  final Client _client;

  QueryUseCase({required Dio dio}) : _client = Client(dio: dio);

  AuthModel? get lastAuth => _client.lastAuth;
}
