class RoleResponeModel {
  String roleId;
  String roleName;

  RoleResponeModel({
    required this.roleId,
    required this.roleName,
  });

  factory RoleResponeModel.fromJson(Map<String, dynamic> json) {
    return RoleResponeModel(
      roleId: json['ROLE_ID'].toString(),
      roleName: json['ROLE_NAME'],
    );
  }
}