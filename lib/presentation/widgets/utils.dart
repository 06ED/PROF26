import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showError(String error) {
  Get.defaultDialog(title: "Возникла ошибка!", content: Text(error));
}
