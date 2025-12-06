import "package:prof_26_query/prof_26_query.dart";
import "package:flutter_test/flutter_test.dart";

String testString = DateTime.now().microsecondsSinceEpoch.toString();

Map<String, String> get credentials => {
  "email": "$testString@yandex.ru",
  "password": "password",
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
        onResponse: (obj) => onResponse(obj, AuthModel),
        onError: onError,
      );
    });
    test("Login", () async {
      await useCase.login(
        email: credentials["email"]!,
        password: credentials["password"]!,
        onResponse: (obj) => onResponse(obj, AuthModel),
        onError: onError,
      );
    });
  });
}
