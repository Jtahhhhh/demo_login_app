import 'package:demo_test/core/data/model/login/LoginRequestModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/repository/login_repository.dart';
import '../../../core/routers/routes.dart';
import '../../../core/widget/snack_bar.dart';

class LoginController extends GetxController {
  final LoginRepository repository = Get.put(LoginRepository());
  var isLoading = false.obs;

  String fullName = '';
  String password = '';

  Future<void> login() async {
    if (!_validateInputs()) return;

    final request = LoginRequestModel(
      userName: fullName.trim(),
      passWord: password.trim(),
    );

    try {
      isLoading.value = true;
      final response = await repository.login(request);

      if (response.errorCode == 0) {
         Get.toNamed(Routes.main);
      } else {
        SnackbarWidget.show(
          title: 'Error',
          message: response.message,
          color: Colors.redAccent,
        );
      }
    } catch (e) {
      SnackbarWidget.show(
        title: 'Error',
        message: 'Login error: $e',
        color: Colors.redAccent,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateInputs() {
    if (fullName.trim().isEmpty) {
      SnackbarWidget.show(
        title: 'Error',
        message: 'Please enter your full name',
        color: Colors.redAccent,
      );
      return false;
    }
    if (password.trim().isEmpty || password.length < 6) {
      SnackbarWidget.show(
        title: 'Error',
        message: 'Password must be at least 6 characters long',
        color: Colors.redAccent,
      );
      return false;
    }
    return true;
  }
}
