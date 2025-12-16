import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:open_router_query/open_router_query.dart';

BaseUseCase _useCase = BaseUseCase(
  apiKey:
      "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",
);

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
      await _useCase.getAIModelsList(
        onResponse: (obj) => onResponse(obj, List<AIModel>),
        onError: onError,
      );
    });
    test("DoRequest", () async {
      await _useCase.doRequest(
        content: "TestContent",
        onResponse: (obj) => onResponse(obj, String),
        onError: onError,
      );
    });
  });
}
