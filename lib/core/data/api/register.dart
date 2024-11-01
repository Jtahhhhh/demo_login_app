import 'dart:convert';

import 'package:demo_test/core/data/model/register/register_request_model.dart';
import 'package:demo_test/core/data/model/register/register_respone_model.dart';
import 'package:demo_test/core/data/model/role_respone_model.dart';
import 'package:http/http.dart' as http;

import '../../config/slug_config/slug.dart';

class RegiterApi {
  //[Get] /Role
  Future<List<RoleResponeModel>> getRole() async {
    List<RoleResponeModel> listRole = [];
    final response = await http.get(Uri.parse('${SlugConfig.baseUrl}${SlugConfig.roleSlug}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      listRole = List<RoleResponeModel>.from(
        data['data'].map((item) => RoleResponeModel.fromJson(item)),
      );
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
    print(listRole);
    return listRole;
  }

  //[Post] /Register
  Future<RegisterResponeModel> register(RegisterRequestModel registerRequest) async {

    final response = await http.post(
      Uri.parse('${SlugConfig.baseUrl}${SlugConfig.registerSlug}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(registerRequest.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return RegisterResponeModel.fromJson(data);
    } else {
      throw Exception('Failed to register. Status code: ${response.statusCode}');
    }
  }

}