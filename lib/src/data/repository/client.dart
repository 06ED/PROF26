import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';

class Client implements Repository {
  final Dio _dio;

  Client({required Dio dio}) : _dio = dio;

  AuthModel? _lastAuth;

  String get _usersURL => "/collections/users";

  @override
  AuthModel? get lastAuth => _lastAuth;

  Options get _options => Options(
    headers: {if (_lastAuth != null) "Authorization": _lastAuth!.token},
  );

  @override
  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    var response = await _dio.post(
      "$_usersURL/records",
      data: {
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
        "emailVisibility": true,
      },
    );

    return UserModel.fromJSON(response.data);
  }

  @override
  Future<AuthModel> login({
    required String identity,
    required String password,
  }) async {
    var response = await _dio.post(
      "$_usersURL/auth-with-password",
      data: {"identity": identity, "password": password},
    );

    _lastAuth = AuthModel.fromJSON(response.data);
    return _lastAuth!;
  }

  @override
  Future<void> logout() async {
    _lastAuth = null;
  }

  @override
  Future<UserModel> getUser({required String id}) async {
    var response = await _dio.get("$_usersURL/records/$id", options: _options);

    return UserModel.fromJSON(response.data);
  }
}
