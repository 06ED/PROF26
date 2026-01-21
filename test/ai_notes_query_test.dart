import 'dart:io';

import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

final _useCase = QueryUseCase(
  dio: Dio(.new(baseUrl: "http://127.0.0.1:8090/api")),
);

final String email = "${DateTime.now().microsecondsSinceEpoch}@ya.ru";
final String password = r"Pa$$w0rd";

void onResponse(dynamic obj, Type expectedType) {
  stdout.writeln(obj.toString());

  assert(obj.runtimeType == expectedType);
}

void onError(String e) => fail(e);

void main() {
  group("TestQuery", () {
    test("signup", () async {
      await _useCase.signup(
        email: email,
        password: password,
        passwordConfirm: password,
        onResponse: (obj) => onResponse(obj, UserModel),
        onError: onError,
      );
    });
    test("login", () async {
      await _useCase.login(
        identity: email,
        password: password,
        onResponse: (obj) => onResponse(obj, AuthModel),
        onError: onError,
      );
    });
    test("getUser", () async {
      await _useCase.getUser(
        id: _useCase.lastAuth!.record.id,
        onResponse: (obj) => onResponse(obj, UserModel),
        onError: onError,
      );
    });
    test("logout", () async {
      await _useCase.logout(
        onResponse: (_) {
          assert(_useCase.lastAuth == null);
        },
        onError: onError,
      );
    });
  });
}
