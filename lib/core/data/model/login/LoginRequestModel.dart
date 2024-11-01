class LoginRequestModel{
  String userName;
  String passWord;

  LoginRequestModel({
    required this.userName,
    required this.passWord
  });

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'password': passWord,
    };
  }
}