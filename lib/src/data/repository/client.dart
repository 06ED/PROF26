import 'package:dio/dio.dart';
import 'package:open_router_query/open_router_query.dart';

class Client implements Repository {
  final Dio _dio;
  final Storage _storage;

  Client({required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;

  @override
  Options get options =>
      Options(headers: {"Authorization": "Bearer ${_storage.apiKey}"});

  @override
  Future<List<AIModel>> getAIModelsList() async {
    Response response = await _dio.get("${_storage.apiURL}/models");
    return AIModel.fromListJSON(response.data["data"]);
  }

  @override
  Future<String> getCompletion({
    required String content,
    required String model,
  }) async {
    Response response = await _dio.post(
      "${_storage.apiURL}/chat/completions",
      data: {
        "model": model,
        "messages": [
          {"role": "user", "content": content},
        ],
      },
      options: options,
    );
    return response.data["choices"][0]["message"]["content"];
  }
}
