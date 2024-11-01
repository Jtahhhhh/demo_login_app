import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/model/register/register_request_model.dart';
import '../../../core/data/model/role_respone_model.dart';
import '../../../core/data/repository/register_repository.dart';
import '../../../core/routers/routes.dart';
import '../../../core/widget/snack_bar.dart';

class RegisterController extends GetxController {
  final RegisterRepository repository = Get.put(RegisterRepository());
  var roles = <RoleResponeModel>[].obs;
  var choosenRole = Rx<RoleResponeModel?>(null);
  var isLoading = false.obs;

  String fullName = '';
  String password = '';

  @override
  void onInit() {
    super.onInit();
    fetchRoles();
  }

  Future<void> fetchRoles() async {
    isLoading.value = true;
    try {
      roles.value = await repository.getRole();
      print("Roles fetched: $roles");
    } catch (e) {
      print('Failed to fetch roles: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register() async {
    if (!_validateInputs()) return;

    final request = RegisterRequestModel(
      key: 'mydtu.duytan.edu.vn',
      userName: fullName.trim(),
      passWord: password.trim(),
      roleId: choosenRole.value!.roleId.toString(),
      createDate: DateTime.now(),
    );

    try {
      final response = await repository.register(request);

      if (response.errorCode == "0") {
        Get.toNamed(Routes.login);
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
        message: 'Registration error',
        color: Colors.redAccent,
      );
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
    if (choosenRole.value == null) {
      SnackbarWidget.show(
        title: 'Error',
        message: 'Please select a role before proceeding',
        color: Colors.redAccent,
      );
      return false;
    }
    return true;
  }
}

