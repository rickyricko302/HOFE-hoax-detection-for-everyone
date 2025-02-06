import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  Future<bool> saveToken({required String token});
  Future<String?> getToken();
  Future<bool> removeToken();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences prefs;

  AuthLocalDatasourceImpl({required this.prefs});
  @override
  Future<String?> getToken() async {
    return prefs.getString('token');
  }

  @override
  Future<bool> saveToken({required String token}) {
    return prefs.setString('token', token);
  }

  @override
  Future<bool> removeToken() {
    return prefs.remove('token');
  }
}
