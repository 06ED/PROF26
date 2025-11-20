import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

abstract interface class Repository {
  abstract final String authURL;
  abstract final String restURL;
  abstract final String apiKey;
  abstract final Options options;

  abstract AuthModel? lastAuth;

  Future<AuthModel> signup({required String email, required String password});

  Future<AuthModel> login({required String email, required String password});

  Future<List<ItemModel>> getItemsList();
}
