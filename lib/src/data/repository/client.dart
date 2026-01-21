import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';

class Client implements Repository {
  final Dio _dio;

  Client({required Dio dio}) : _dio = dio;

  AuthModel? _lastAuth;

  @override
  AuthModel? get lastAuth => _lastAuth;

  Options get _options => Options(
    headers: {if (_lastAuth != null) "Authorization": _lastAuth!.token},
  );
}
