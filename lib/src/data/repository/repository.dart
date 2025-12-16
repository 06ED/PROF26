import 'package:dio/dio.dart';
import 'package:open_router_query/open_router_query.dart';

abstract interface class Repository {
  final String apiKey;

  Repository({required this.apiKey});

  abstract final Options options;

  Future<List<AIModel>> getAIModelsList();

  Future<String> doRequest({
    required String content,
    String model = "openrouter/auto",
  });
}
