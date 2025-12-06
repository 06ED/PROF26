import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

class Client implements Repository {
  final Dio _dio;
  final Storage _storage;

  Client({required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;

  @override
  String get authURL => "${_storage.apiURL}/auth/v1";

  @override
  String get apiKey => _storage.apiKey;

  @override
  Options get options => Options(headers: {"apikey": apiKey});

  @override
  AuthModel? lastAuth;

  @override
  Future<AuthModel> signup({
    required String email,
    required String password,
  }) async {
    Response response = await _dio.post(
      "$authURL/signup",
      data: {"email": email, "password": password},
      options: options,
    );
    lastAuth = AuthModel.fromJSON(response.data);
    return lastAuth!;
  }

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    Response response = await _dio.post(
      "$authURL/token?grant_type=password",
      data: {"email": email, "password": password},
      options: options,
    );
    lastAuth = AuthModel.fromJSON(response.data);
    return lastAuth!;
  }
}
