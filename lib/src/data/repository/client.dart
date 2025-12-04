import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

class Client implements Repository {
  final Dio _dio;
  final Storage _storage;

  Client({required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;

  @override
  String get usersURL => "${_storage.apiURL}/collections/users";

  @override
  String get itemsURL => "${_storage.apiURL}/collections/items";

  @override
  Options get options => Options(
    headers: {if (lastAuth != null) "Authorization": lastAuth!.token},
  );

  @override
  AuthModel? lastAuth;

  @override
  Future<void> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    await _dio.post(
      "$usersURL/records",
      data: {
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
      },
    );
  }

  @override
  Future<AuthModel> login({
    required String identity,
    required String password,
  }) async {
    Response response = await _dio.post(
      "$usersURL/auth-with-password",
      data: {"identity": identity, "password": password},
    );
    lastAuth = AuthModel.fromJSON(response.data);
    return lastAuth!;
  }

  @override
  Future<ItemModel> getItemByID({required String id}) async {
    // TODO: implement getItemByID
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> getItemsList() async {
    // TODO: implement getItemsList
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> searchItemsByTitle({required String search}) async {
    // TODO: implement searchItemsByTitle
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> searchItemsByDescription({
    required String search,
  }) async {
    // TODO: implement searchItemsByDescription
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> getOrderedByPriceItems() async {
    // TODO: implement getOrderedByPriceItems
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> getOrderedByCreatedItems() async {
    // TODO: implement getOrderedByCreatedItems
    throw UnimplementedError();
  }
}
