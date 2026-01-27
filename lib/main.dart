import 'package:ai_notes_app/presentation/widgets/application.dart';
import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var mainUseCase = QueryUseCase(
  dio: Dio(.new(baseUrl: "http://10.0.2.2:8090/api")),
);

void main() {
  runApp(Application());
}
