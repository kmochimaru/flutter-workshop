import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_workshop/environment.dart' as ENV;

class AuthService {
  final _storage = FlutterSecureStorage();
  String url = '${ENV.HOST}${ENV.VERSION}/auth';

  Future<String> onLogin(String username, String password) async {
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.post(Uri.parse('$url/login'),
        headers: headers,
        body: convert.jsonEncode({'username': username, 'password': password}));

    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body)['access_token'];
    } else {
      return '';
    }
  }

  void setRemember(String check) {
    _storage.write(key: 'remember', value: check);
  }

  Future<String?> getRemember() async {
    return await _storage.read(key: 'remember');
  }

  void setToken(String token) {
    _storage.write(key: 'token', value: token);
  }

  void removeToken() {
    _storage.deleteAll();
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future decodeToken() async {
    return this._parseJwt((await this.getToken())!);
  }

  Future<String> decodeUserId() async {
    var token = await this.getToken();
    return this._parseJwt(token!)['user_id'];
  }

  Map<String, dynamic> _parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);

    final payloadMap = convert.jsonDecode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }
    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }
    return output;
  }
}
