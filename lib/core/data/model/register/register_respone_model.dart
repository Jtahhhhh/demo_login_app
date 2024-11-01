class RegisterResponeModel {
  String errorCode;
  String message;
  String messageEn;
  UserResponseModel data;

  RegisterResponeModel({
    required this.errorCode,
    required this.message,
    required this.messageEn,
    required this.data,
  });

  factory RegisterResponeModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponeModel(
      errorCode: json['errorCode'].toString(),
      message: json['message'],
      messageEn: json['messageEn'],
      data: UserResponseModel.fromJson(json['data']),
    );
  }
}


class UserResponseModel {
  int accountId;
  String username;
  String password;
  bool? disable;
  bool? isAdministration;
  int roleId;
  DateTime createDate;
  String? createByUsername;
  bool? accountIsAllowArticle;
  bool? accountIsAllowBannerAds;
  bool? accountIsAllowPopup;
  bool? accountIsAllowAccount;
  bool? accountIsAllowGallery;
  bool? accountIsAllowSiteLinking;
  bool? accountIsForceLogout;
  String? role;

  UserResponseModel({
    required this.accountId,
    required this.username,
    required this.password,
    this.disable,
    this.isAdministration,
    required this.roleId,
    required this.createDate,
    this.createByUsername,
    this.accountIsAllowArticle,
    this.accountIsAllowBannerAds,
    this.accountIsAllowPopup,
    this.accountIsAllowAccount,
    this.accountIsAllowGallery,
    this.accountIsAllowSiteLinking,
    this.accountIsForceLogout,
    this.role,
  });

  // Factory method to create an instance from JSON
  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      accountId: json['ACCOUNT_ID'],
      username: json['USERNAME'],
      password: json['PASSWORD'],
      disable: json['DISABLE'],
      isAdministration: json['IS_ADMINISTRATION'],
      roleId: json['ROLE_ID'],
      createDate: DateTime.parse(json['CREATE_DATE']),
      createByUsername: json['CREATE_BY_USERNAME'],
      accountIsAllowArticle: json['ACCOUNT_IS_ALLOW_ARTICLE'],
      accountIsAllowBannerAds: json['ACCOUNT_IS_ALLOW_BANNER_ADS'],
      accountIsAllowPopup: json['ACCOUNT_IS_ALLOW_POPUP'],
      accountIsAllowAccount: json['ACCOUNT_IS_ALLOW_ACCOUNT'],
      accountIsAllowGallery: json['ACCOUNT_IS_ALLOW_GALLERY'],
      accountIsAllowSiteLinking: json['ACCOUNT_IS_ALLOW_SITE_LINKING'],
      accountIsForceLogout: json['ACCOUNT_IS_FORCE_LOGOUT'],
      role: json['ROLE'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'ACCOUNT_ID': accountId,
      'USERNAME': username,
      'PASSWORD': password,
      'DISABLE': disable,
      'IS_ADMINISTRATION': isAdministration,
      'ROLE_ID': roleId,
      'CREATE_DATE': createDate.toIso8601String(),
      'CREATE_BY_USERNAME': createByUsername,
      'ACCOUNT_IS_ALLOW_ARTICLE': accountIsAllowArticle,
      'ACCOUNT_IS_ALLOW_BANNER_ADS': accountIsAllowBannerAds,
      'ACCOUNT_IS_ALLOW_POPUP': accountIsAllowPopup,
      'ACCOUNT_IS_ALLOW_ACCOUNT': accountIsAllowAccount,
      'ACCOUNT_IS_ALLOW_GALLERY': accountIsAllowGallery,
      'ACCOUNT_IS_ALLOW_SITE_LINKING': accountIsAllowSiteLinking,
      'ACCOUNT_IS_FORCE_LOGOUT': accountIsForceLogout,
      'ROLE': role,
    };
  }
}

