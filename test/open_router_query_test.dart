import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:open_router_query/open_router_query.dart';

QueryUseCase _queryUseCase = QueryUseCase();

void onResponse(dynamic obj, Type expectedType) {
  stdout.writeln(obj);
  assert(obj.runtimeType == expectedType);
}

void onError(String e) {
  fail(e);
}

void main() {
  group("TestQuery", () {
    test("GetAIModelsList", () async {
      await _queryUseCase.getAIModelsList(
        onResponse: (obj) => onResponse(obj, List<AIModel>),
        onError: onError,
        useShortError: false,
      );
    });
    test("GetCompletion", () async {
      await _queryUseCase.getCompletion(
        content: "TestContent",
        model: "openrouter/auto",
        onResponse: (obj) => onResponse(obj, String),
        onError: onError,
        useShortError: false,
      );
    });
  });
}
