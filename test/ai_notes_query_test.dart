import 'dart:io';

import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:flutter_test/flutter_test.dart';

final _useCase = QueryUseCase(
  dio: .new(.new(baseUrl: "http://188.127.227.228:8080/api")),
);

final email = "${DateTime.now().microsecondsSinceEpoch}@ya.ru";
final password = r"Pa$$w0rd";

void onResponse(dynamic obj, Type expectedType) {
  stdout.writeln(obj.toString());

  assert(obj.runtimeType == expectedType);
}

void onError(String e) => fail(e);

void main() {
  late NoteModel noteModel;

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
    test("createNote", () async {
      await _useCase.createNote(
        userId: _useCase.lastAuth!.record.id,
        name: "Sample Note",
        text: "Some text...",
        onResponse: (obj) {
          onResponse(obj, NoteModel);

          noteModel = obj;
        },
        onError: onError,
      );
    });
    test("getNote", () async {
      await _useCase.getNote(
        id: noteModel.id,
        onResponse: (obj) => onResponse(obj, NoteModel),
        onError: onError,
      );
    });
    test("getNotesList", () async {
      await _useCase.getNotesList(
        onResponse: (obj) => onResponse(obj, List<NoteModel>),
        onError: onError,
      );
    });
    test("updateNote", () async {
      await _useCase.updateNote(
        id: noteModel.id,
        userId: _useCase.lastAuth!.record.id,
        name: noteModel.name,
        text: "Some updated text...",
        onResponse: (obj) => onResponse(obj, NoteModel),
        onError: onError,
      );
    });
    test("deleteNote", () async {
      await _useCase.deleteNote(
        id: noteModel.id,
        onResponse: (_) {},
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
