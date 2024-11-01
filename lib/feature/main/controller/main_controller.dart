import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/model/login/LoginResponeModel.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var userData = Rxn<LoginResponseModel>();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    isLoading.value = true;
    userData.value = await getLoginData();
    isLoading.value = false;
  }

  Future<LoginResponseModel?> getLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginDataJson = prefs.getString('login_data');
    if (loginDataJson != null) {
      Map<String, dynamic> json = jsonDecode(loginDataJson);
      return LoginResponseModel.fromJson(json);
    }
    return null;
  }
}
