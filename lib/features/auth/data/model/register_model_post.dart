import 'dart:convert';

class RegisterModelPost {
  final String username;
  final String email;
  final String password;

  RegisterModelPost(
      {required this.username, required this.email, required this.password});

  String toJson() {
    return jsonEncode(
        {'username': username, 'email': email, 'password': password});
  }
}
