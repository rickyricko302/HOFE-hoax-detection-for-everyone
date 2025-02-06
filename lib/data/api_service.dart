import 'dart:io';

import 'package:hofe/features/auth/data/datasource/auth_local_datasource.dart';

import '../injection.dart';

class ApiService {
  static Map<String, String> headerWithoutToken() {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  static Future<Map<String, String>> headerWithToken() async {
    final AuthLocalDatasource authLocalDatasource = locator();
    String? token = await authLocalDatasource.getToken();
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
    };
  }

  static String baseUrl = 'https://api-cc-hofe-production.up.railway.app';

  static String urlRegister = '$baseUrl/register';
  static String urlLogin = '$baseUrl/login';
  static String urlHoaxNews = '$baseUrl/news';
  static String urlDetectHoax = '$baseUrl/detect-hoax/text';
}
