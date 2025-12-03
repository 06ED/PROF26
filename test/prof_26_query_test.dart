import "package:flutter_test/flutter_test.dart";
import "package:prof_26_query/prof_26_query.dart";

String testString = DateTime.now().microsecondsSinceEpoch.toString();

Map<String, String> get signUpCredentials => {
  "email": "$testString@yandex.ru",
  "password": "password",
};

Map<String, String> get baseCredentials => {
  "email": "email123@yandex.ru",
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
        email: signUpCredentials["email"]!,
        password: signUpCredentials["password"]!,
        onResponse: (obj) => onResponse(obj, AuthModel),
        onError: onError,
      );
    });
    test("Login", () async {
      await useCase.login(
        email: baseCredentials["email"]!,
        password: baseCredentials["password"]!,
        onResponse: (obj) => onResponse(obj, AuthModel),
        onError: onError,
      );
    });
    test("GetItemByID", () async {
      await useCase.getItemByID(
        id: 1,
        onResponse: (obj) => onResponse(obj, ItemModel),
        onError: onError,
      );
    });
    test("GetItemsList", () async {
      await useCase.getItemsList(
        onResponse: (obj) => onResponse(obj, List<ItemModel>),
        onError: onError,
      );
    });
    test("SearchItemsByTitle", () async {
      await useCase.searchItemsByTitle(
        search: "Рубашка",
        onResponse: (obj) => onResponse(obj, List<ItemModel>),
        onError: onError,
      );
    });
    test("SearchItemsByDescription", () async {
      await useCase.searchItemsByDescription(
        search: "Мягкие носки",
        onResponse: (obj) => onResponse(obj, List<ItemModel>),
        onError: onError,
      );
    });
    test("getOrderedByPriceItems", () async {
      await useCase.getOrderedByPriceItems(
        onResponse: (obj) => onResponse(obj, List<ItemModel>),
        onError: onError,
      );
    });
    test("getOrderedByCreatedItems", () async {
      await useCase.getOrderedByCreatedItems(
        onResponse: (obj) => onResponse(obj, List<ItemModel>),
        onError: onError,
      );
    });
  });
}
