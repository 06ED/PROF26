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
  Future<ItemModel?> getItemByID({required int id}) async {
    Response response = await _dio.get(
      "$restURL/items",
      queryParameters: {"id": "eq.$id"},
      options: options,
    );
    List json = response.data;
    return json.isNotEmpty ? ItemModel.fromJSON(json[0]) : null;
  }

  @override
  Future<List<ItemModel>> getItemsList() async {
    Response response = await _dio.get("$restURL/items", options: options);
    List json = response.data;
    return json.map((dynamic element) => ItemModel.fromJSON(element)).toList();
  }

  @override
  Future<List<ItemModel>> searchItemsByTitle({required String search}) async {
    Response response = await _dio.get(
      "$restURL/items",
      queryParameters: {"title": "ilike.*$search*"},
      options: options,
    );
    List json = response.data;
    return json.map((dynamic element) => ItemModel.fromJSON(element)).toList();
  }

  @override
  Future<List<ItemModel>> searchItemsByDescription({
    required String search,
  }) async {
    Response response = await _dio.get(
      "$restURL/items",
      queryParameters: {"description": "ilike.*$search*"},
      options: options,
    );
    List json = response.data;
    return json.map((dynamic element) => ItemModel.fromJSON(element)).toList();
  }

  @override
  Future<List<ItemModel>> getOrderedByPriceItems() async {
    Response response = await _dio.get(
      "$restURL/items",
      queryParameters: {"order": "price.asc"},
      options: options,
    );
    List json = response.data;
    return json.map((dynamic element) => ItemModel.fromJSON(element)).toList();
  }

  @override
  Future<List<ItemModel>> getOrderedByCreatedItems() async {
    Response response = await _dio.get(
      "$restURL/items",
      queryParameters: {"order": "created.desc"},
      options: options,
    );
    List json = response.data;
    return json.map((dynamic element) => ItemModel.fromJSON(element)).toList();
  }
}
