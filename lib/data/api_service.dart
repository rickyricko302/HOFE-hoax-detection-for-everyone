import 'dart:io';

class ApiService {
  static Map<String, String> headerWithoutToken() {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  static String baseUrl = 'https://api-cc-hofe-production.up.railway.app/api';

  static String urlRegister = '$baseUrl/auth/register';
  static String urlLogin = '$baseUrl/auth/login';
}
