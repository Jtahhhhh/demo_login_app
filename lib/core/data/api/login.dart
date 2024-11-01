import 'dart:convert';

import 'package:demo_test/core/data/model/login/LoginRequestModel.dart';
import 'package:http/http.dart' as http;

import '../../config/slug_config/slug.dart';
import '../model/login/LoginResponeModel.dart';

class LoginApi{
  Future<LoginResponseModel> Login(LoginRequestModel loginRequest) async {

    final response = await http.post(
      Uri.parse('${SlugConfig.baseUrl}${SlugConfig.loginSlug}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return LoginResponseModel.fromJson(data);
    } else {
      throw Exception('Failed to Login. Status code: ${response.statusCode}');
    }
  }
}