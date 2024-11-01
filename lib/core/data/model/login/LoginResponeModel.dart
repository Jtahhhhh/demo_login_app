class LoginResponseModel {
  final int errorCode;
  final String message;
  final String messageEn;
  final LoginData data;

  LoginResponseModel({
    required this.errorCode,
    required this.message,
    required this.messageEn,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      errorCode: json['errorCode'],
      message: json['message'],
      messageEn: json['messageEn'],
      data: LoginData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'errorCode': errorCode,
      'message': message,
      'messageEn': messageEn,
      'data': data.toJson(),
    };
  }
}

class LoginData {
  final int accountId;
  final String username;
  final String createDate;
  final String? createByUsername;
  final String avatar;

  LoginData({
    required this.accountId,
    required this.username,
    required this.createDate,
    this.createByUsername,
    required this.avatar,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      accountId: json['ACCOUNT_ID'],
      username: json['USERNAME'],
      createDate: json['CREATE_DATE'],
      createByUsername: json['CREATE_BY_USERNAME'],
      avatar: json['AVATAR'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ACCOUNT_ID': accountId,
      'USERNAME': username,
      'CREATE_DATE': createDate,
      'CREATE_BY_USERNAME': createByUsername,
      'AVATAR': avatar,
    };
  }
}
