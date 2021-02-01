import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/user.model.ts.dart';
import 'package:flutter_workshop/services/users.service.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  @override
  Widget build(BuildContext context) {
    // UsersService().getUsers().then((value) {
    //   // print(value);
    // });
    // print('Load screen');

    return Scaffold(
      appBar: AppBar(
        title: Text('ผู้ใช้'),
      ),
      body: FutureBuilder(
        future: UsersService().getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<UserModel> users = snapshot.data;
            print(snapshot.data);
            return Column(
              children: List.generate(users.length, (index) => Text(users[index].username)),
            );
          } else {
            return Container();
          }
        },
      )
    );
  }
}
