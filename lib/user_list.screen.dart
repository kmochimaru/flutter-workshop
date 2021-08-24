import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/user.model.ts.dart';
import 'package:flutter_workshop/services/users.service.dart';
import 'package:flutter_workshop/utillities/params_options.dart';

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
          future: UsersService().getUsers(ParamsOption()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<UserModel> users = snapshot.data;

              // return Column(
              //   children: List.generate(users.length, (index) => Text(users[index].username)),
              // );

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(users[index]!.username!, style: TextStyle(fontSize: 22.0),),
                    ),
                  );
                },
              );

              // return Column(
              //   children: [
              //     Text('test'),
              //     Text('test'),
              //     Text('test'),
              //     Text('test'),
              //     Text('test'),
              //   ],
              // );
            } else {
              return Container();
            }
          },
        ));
  }
}
