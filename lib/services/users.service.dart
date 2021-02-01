import 'package:flutter_workshop/models/user.model.ts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UsersService {
  String url = 'http://192.168.1.2:3000/api/v1/users';

  Future<List<UserModel>> getUsers() async {
    var response = await http.get(url);
    if (response.statusCode == 200){
      return toList(response.body);
    }
  }

  List<UserModel> toList(String responseBody) {
    var parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }
}