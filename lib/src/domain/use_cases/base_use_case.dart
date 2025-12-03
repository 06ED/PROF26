import "package:dio/dio.dart";
import "package:prof_26_query/prof_26_query.dart";

class BaseUseCase {
  final QueryHelper _helper = QueryHelper();
  final Client _client = Client(dio: Dio(), storage: Storage());

  AuthModel? get lastAuth => _client.lastAuth;

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

  Future<void> getItemByID({
    required int id,
    required Function(ItemModel? item) onResponse,
    required Function(String error) onError,
  }) async {
    await _helper.request(
      request: () => _client.getItemByID(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getItemsList({
    required Function(List<ItemModel> items) onResponse,
    required Function(String error) onError,
  }) async {
    await _helper.request(
      request: () => _client.getItemsList(),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> searchItemsByTitle({
    required String search,
    required Function(List<ItemModel> items) onResponse,
    required Function(String error) onError,
  }) async {
    await _helper.request(
      request: () => _client.searchItemsByTitle(search: search),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> searchItemsByDescription({
    required String search,
    required Function(List<ItemModel> items) onResponse,
    required Function(String error) onError,
  }) async {
    await _helper.request(
      request: () => _client.searchItemsByDescription(search: search),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getOrderedByPriceItems({
    required Function(List<ItemModel> items) onResponse,
    required Function(String error) onError,
  }) async {
    await _helper.request(
      request: () => _client.getOrderedByPriceItems(),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getOrderedByCreatedItems({
    required Function(List<ItemModel> items) onResponse,
    required Function(String error) onError,
  }) async {
    await _helper.request(
      request: () => _client.getOrderedByCreatedItems(),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
