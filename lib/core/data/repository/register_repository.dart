import '../api/register.dart';
import '../model/register/register_request_model.dart';
import '../model/register/register_respone_model.dart';
import '../model/role_respone_model.dart';

class RegisterRepository {
  final List<RoleResponeModel> capcheRole = [];
  final RegiterApi api = RegiterApi();

  Future<List<RoleResponeModel>> getRole() async {
    if (capcheRole.isEmpty) {
      capcheRole.addAll(await api.getRole());
    }
    print(capcheRole);
    return capcheRole;
  }

  Future<RegisterResponeModel> register(RegisterRequestModel registerRequest) async {
    try {
      RegisterResponeModel response = await api.register(registerRequest);
      print(response);
      return response;
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

}
