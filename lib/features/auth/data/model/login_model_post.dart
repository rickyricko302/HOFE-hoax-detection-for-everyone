import 'dart:convert';

class LoginModelPost {
  final String email;
  final String password;

  LoginModelPost({required this.email, required this.password});

  String toJson() {
    return jsonEncode({'email': email, 'password': password});
  }
}
