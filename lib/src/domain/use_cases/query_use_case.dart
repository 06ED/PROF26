import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';

class QueryUseCase {
  final QueryHelper _helper = QueryHelper();
  final Client _client;

  QueryUseCase({required Dio dio}) : _client = Client(dio: dio);

  AuthModel? get lastAuth => _client.lastAuth;

  Future<void> signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required void Function(UserModel) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.signup(
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
      ),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> login({
    required String identity,
    required String password,
    required void Function(AuthModel) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.login(identity: identity, password: password),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> logout({
    required void Function(void) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: _client.logout,
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getUser({
    required String id,
    required void Function(UserModel) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.getUser(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
