class LoginResponseModel {
  final String token, error;

  LoginResponseModel({required this.token, required this.error});
  factory LoginResponseModel.formJson(json) {
    String tokenData = json['token'] != null ? json['token'] : "";
    String errorData = json['error'] != null ? json['error'] : "";
    return LoginResponseModel(token: tokenData, error: errorData);
  }
}
