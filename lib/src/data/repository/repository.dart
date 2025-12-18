import 'package:dio/dio.dart';
import 'package:open_router_query/open_router_query.dart';

abstract interface class Repository {
  abstract final Options options;

  Future<List<AIModel>> getAIModelsList();

  Future<String> getCompletion({
    required String content,
    String model = "openrouter/auto",
  });
}
