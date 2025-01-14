import 'dart:convert';

import 'package:hofe/data/api_service.dart';
import 'package:hofe/features/auth/data/model/register_model_post.dart';
import 'package:hofe/utils/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDatasource {
  Future<void> register({required RegisterModelPost data});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<void> register({required RegisterModelPost data}) async {
    final response = await http.post(
      Uri.parse(ApiService.urlRegister),
      body: data.toJson(),
      headers: ApiService.headerWithoutToken(),
    );
    logRequests(response: response);
    final json = jsonDecode(response.body);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw (generateException(response: response, json: json));
    }
  }
}
