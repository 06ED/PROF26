import 'package:flutter_test/flutter_test.dart';
import 'package:prof_26_query/prof_26_query.dart';

BaseUseCase useCase = BaseUseCase();

void onResponse(Object obj, Type testType) {
  assert(obj.runtimeType == testType);
}

void onError(Exception e) {
  fail(e.toString());
}

void main() {
  group("TestQuery", () {
    test("GetGoogle", () async {
      await useCase.getGoogle(
        onResponse: (obj) => onResponse,
        onError: onError,
      );
    });
  });
}
