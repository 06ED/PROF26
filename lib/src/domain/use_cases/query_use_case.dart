import 'package:dio/dio.dart';
import 'package:open_router_query/open_router_query.dart';

class QueryUseCase {
  final Client _client = Client(dio: Dio(), storage: Storage());
  final QueryHelper _helper = QueryHelper();

  Future<void> getAIModelsList({
    required void Function(List<AIModel>) onResponse,
    required void Function(String) onError,
    bool useShortError = true,
  }) async {
    await _helper.request(
      request: _client.getAIModelsList,
      onResponse: onResponse,
      onError: onError,
      useShortError: useShortError,
    );
  }

  Future<void> getCompletion({
    required String content,
    required String model,
    required void Function(String) onResponse,
    required void Function(String) onError,
    bool useShortError = true,
  }) async {
    await _helper.request(
      request: () => _client.getCompletion(content: content, model: model),
      onResponse: onResponse,
      onError: onError,
      useShortError: useShortError,
    );
  }
}
