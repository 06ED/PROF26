import 'package:dio/dio.dart';
import 'package:open_router_query/open_router_query.dart';

class Client implements Repository {
  @override
  final String apiKey;
  final Dio _dio;
  final Storage _storage;

  Client({required this.apiKey, required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;

  @override
  Options get options => Options(headers: {"Authorization": "Bearer $apiKey"});

  @override
  Future<List<AIModel>> getAIModelsList() async {
    Response response = await _dio.get("${_storage.apiURL}/models");
    List json = response.data["data"];
    return json.map((e) => AIModel.fromJSON(e)).toList();
  }

  @override
  Future<String> doRequest({
    required String content,
    String model = "openrouter/auto",
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
