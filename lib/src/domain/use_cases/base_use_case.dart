import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

class BaseUseCase {
  final QueryHelper _helper = QueryHelper();
  final Client _client = Client(dio: Dio(), storage: Storage());

  AuthModel? get lastAuth => _client.lastAuth;

  Future<void> signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required Function(void) onResponse,
    required Function(String) onError,
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
    required Function(AuthModel) onResponse,
    required Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.login(identity: identity, password: password),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getItemByID({
    required String id,
    required Function(ItemModel) onResponse,
    required Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.getItemByID(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getItemsList({
    required Function(List<ItemModel>) onResponse,
    required Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.getItemsList(),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> searchItemsByTitle({
    required String search,
    required Function(List<ItemModel>) onResponse,
    required Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.searchItemsByTitle(search: search),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> searchItemsByDescription({
    required String search,
    required Function(List<ItemModel>) onResponse,
    required Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.searchItemsByDescription(search: search),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
