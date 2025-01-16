import 'dart:io';

class ApiService {
  static Map<String, String> headerWithoutToken() {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  static String baseUrl = 'https://api-cc-hofe-production.up.railway.app';

  static String urlRegister = '$baseUrl/register';
  static String urlLogin = '$baseUrl/login';
}
