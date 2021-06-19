import 'dart:convert';

import 'package:karma_login/models/request.dart';
import 'package:karma_login/models/respones.dart';
import 'package:http/http.dart' as http;

class LoginApiService {
  Future<LoginResponseModel> login(LoginRequestModel req) async {
    var url = Uri.parse('https://reqres.in/api/login');
    final res = await http.post(url, body: req.toJson());
    if (res.statusCode == 200 || res.statusCode == 400) {
      return LoginResponseModel.formJson(json.decode(res.body));
    } else {
      throw Exception('Failed to Login');
    }
  }
}
