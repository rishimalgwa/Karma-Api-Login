class LoginRequestModel {
  final String email, password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email.trim(), 'password': password.trim()};
  }
}
