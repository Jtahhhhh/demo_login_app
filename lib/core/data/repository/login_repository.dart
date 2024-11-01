import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Import for JSON encoding/decoding

import '../api/login.dart';
import '../model/login/LoginRequestModel.dart';
import '../model/login/LoginResponeModel.dart';

class LoginRepository {
  final LoginApi loginApi = LoginApi();

  Future<LoginResponseModel> login(LoginRequestModel loginRequest) async {
    try {

      LoginResponseModel response = await loginApi.Login(loginRequest);
      print(response);

      if (response.errorCode == 0) {
        await _saveLoginData(response);
      }

      return response;
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
  }

  Future<void> _saveLoginData(LoginResponseModel response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginDataJson = jsonEncode(response.toJson());
    await prefs.setString('login_data', loginDataJson);
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

  Future<void> clearLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('login_data');
  }
}
