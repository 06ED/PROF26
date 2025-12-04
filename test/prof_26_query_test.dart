import "package:flutter_test/flutter_test.dart";
import "package:prof_26_query/prof_26_query.dart";

String testString = DateTime.now().microsecondsSinceEpoch.toString();

Map<String, String> get credentials => {
  "email": "$testString@yandex.ru",
  "password": "password12",
  "passwordConfirm": "password12",
};

BaseUseCase useCase = BaseUseCase();

void onResponse(dynamic obj, Type expectedType) {
  assert(obj.runtimeType == expectedType);
}

void onError(String e) {
  fail(e);
}

void main() {
  group("TestQuery", () {
    test("SignUp", () async {
      await useCase.signup(
        email: credentials["email"]!,
        password: credentials["password"]!,
        passwordConfirm: credentials["passwordConfirm"]!,
        onResponse: (obj) => onResponse,
        onError: onError,
      );
    });
  });
}
