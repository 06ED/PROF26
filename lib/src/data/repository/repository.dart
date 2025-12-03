import 'package:dio/dio.dart';
import 'package:prof_26_query/prof_26_query.dart';

abstract interface class Repository {
  abstract final String usersURL;
  abstract final String itemsURL;
  abstract final Options options;

  abstract AuthModel? lastAuth;

  Future<void> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  });

  Future<AuthModel> login({required String identity, required String password});

  Future<ItemModel> getItemByID({required String id});

  Future<List<ItemModel>> getItemsList();

  Future<List<ItemModel>> searchItemsByTitle({required String search});

  Future<List<ItemModel>> searchItemsByDescription({required String search});

  Future<List<ItemModel>> getOrderedByPriceItems();

  Future<List<ItemModel>> getOrderedByCreatedItems();
}
