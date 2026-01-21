import 'dart:io';

import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

QueryUseCase _useCase = QueryUseCase(
  dio: Dio(.new(baseUrl: "http://10.0.2.2:8090/api")),
);

final String email = "${DateTime.now().microsecondsSinceEpoch}@ya.ru";
final String password = r"Pa$$w0rd";

void onResponse(dynamic obj, Type expectedType) {
  stdout.writeln(obj.toString());

  assert(obj.runtimeType == expectedType);
}

void onError(String e) => fail(e);

void main() {
  group("TestQuery", () async {});
}
