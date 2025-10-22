import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

class BaseUseCase {
  final Client _client = Client(Dio());

  Future<void> getGoogle({
    required void Function(void) onResponse,
    required void Function(Exception) onError,
  }) async {
    await queryHelper(
      request: () => _client.getGoogle(),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
