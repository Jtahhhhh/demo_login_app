class RegisterRequestModel {
  String key;
  String userName;
  String passWord;
  String roleId;
  DateTime createDate;

  RegisterRequestModel({
    required this.key,
    required this.userName,
    required this.passWord,
    required this.roleId,
    required this.createDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'KEY': key,
      'USERNAME': userName,
      'PASSWORD': passWord,
      'ROLE_ID': roleId,
      'CREATE_DATE': createDate.toIso8601String(),
    };
  }
}
