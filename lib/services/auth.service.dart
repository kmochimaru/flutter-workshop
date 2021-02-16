import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthService {
  String url = 'http://192.168.1.7:3000/api/v1/auth';

  Future<String> onLogin(String username, String password) async {
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await http.post('$url/login',
        headers: headers,
        body: convert.jsonEncode({'username': username, 'password': password}));

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body)['access_token'];
    }
  }
}
