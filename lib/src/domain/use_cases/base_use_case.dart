import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

class BaseUseCase {
  final Client _client = Client(dio: Dio(), storage: Storage());
  final QueryHelper _helper = QueryHelper();

  AuthModel? get _lastAuth => _client.lastAuth;

  Future<void> signup({
    required String email,
    required String password,
    required Function(AuthModel auth) onResponse,
    required Function(String error) onError,
  }) async {
    await _helper.request(
      request: () => _client.signup(email: email, password: password),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> login({
    required String email,
    required String password,
    required Function(AuthModel auth) onResponse,
    required Function(String error) onError,
  }) async {
    await _helper.request(
      request: () => _client.login(email: email, password: password),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
