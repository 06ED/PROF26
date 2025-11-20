import "package:dio/dio.dart";
import "package:prof_26_query/prof_26_query.dart";

class Client implements Repository {
  final Dio _dio;
  final Storage _storage;

  Client({required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;

  @override
  String get authURL => "${_storage.apiURL}/auth/v1";

  @override
  String get restURL => "${_storage.apiURL}/rest/v1";

  @override
  String get apiKey => _storage.apiKey;

  @override
  Options get options => Options(
    headers: {
      "apikey": apiKey,
      if (lastAuth != null)
        "Authorization": "${lastAuth!.tokenType} ${lastAuth!.accessToken}",
    },
  );

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
      "$authURL/token",
      queryParameters: {"grant_type": "password"},
      data: {"email": email, "password": password},
      options: options,
    );
    lastAuth = AuthModel.fromJSON(response.data);
    return lastAuth!;
  }

  @override
  Future<List<ItemModel>?> getItemsList() async {
    Response response = await _dio.get("$restURL/items", options: options);
    List json = response.data;
    return json.isNotEmpty ? json.map((dynamic element) => ItemModel.fromJSON(element)).toList() : null;
  }
}
