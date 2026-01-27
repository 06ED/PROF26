import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';

class QueryUseCase {
  final Client _client;

  QueryUseCase({required Dio dio}) : _client = .new(dio: dio);

  AuthModel? get lastAuth => _client.lastAuth;

  Future<void> signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required Function(UserModel) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: () => _client.signup(
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
      ),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> login({
    required String identity,
    required String password,
    required Function(AuthModel) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: () => _client.login(identity: identity, password: password),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> logout({
    required Function(void) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: _client.logout,
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getUser({
    required String id,
    required Function(UserModel) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: () => _client.getUser(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> createNote({
    required String userId,
    required String name,
    required String text,
    required Function(NoteModel) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: () => _client.createNote(userId: userId, name: name, text: text),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getNote({
    required String id,
    required Function(NoteModel) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: () => _client.getNote(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getNotesList({
    required Function(List<NoteModel>) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: _client.getNotesList,
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> updateNote({
    required String id,
    required String userId,
    required String name,
    required String text,
    required Function(NoteModel) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: () =>
          _client.updateNote(id: id, userId: userId, name: name, text: text),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> deleteNote({
    required String id,
    required Function(void) onResponse,
    required Function(String) onError,
  }) async {
    await QueryHelper.request(
      request: () => _client.deleteNote(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
