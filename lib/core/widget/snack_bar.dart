import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarWidget {
  static void show({
    required String title,
    required String message,
    Color color = Colors.black,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
    );
  }
}
