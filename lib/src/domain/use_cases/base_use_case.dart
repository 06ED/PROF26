import 'package:dio/dio.dart';
import 'package:open_router_query/open_router_query.dart';

class BaseUseCase {
  final String apiKey;
  final Client _client;
  final QueryHelper _helper = QueryHelper();

  BaseUseCase({required this.apiKey})
    : _client = Client(apiKey: apiKey, dio: Dio(), storage: Storage());

  Future<void> getAIModelsList({
    required void Function(List<AIModel>) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: _client.getAIModelsList,
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> doRequest({
    required String content,
    required void Function(String) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.doRequest(content: content),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
