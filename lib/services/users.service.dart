import 'dart:io';

import 'package:flutter_workshop/models/user.model.ts.dart';
import 'package:flutter_workshop/services/auth.service.dart';
import 'package:flutter_workshop/utillities/params_options.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UsersService {
  String className = 'UsersService';

  Future<List<UserModel>> getUsers(ParamsOption params) async {
    String _baseUrl =
        'http://192.168.1.5:3000/api/v1/users';

    if(params != null) {
      _baseUrl = '$_baseUrl${params.toParams(params.toJson())}';
    }

    var headers = {
      HttpHeaders.authorizationHeader: await AuthService().getToken(),
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return toList(response.body);
    } else {
      print(
          "$className getUsers(ParamsOption options) failed with status ${response.statusCode}. ${response.body.toString()}");
      return <UserModel>[];
    }
  }

  List<UserModel> toList(String responseBody) {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }
}