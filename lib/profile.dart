import 'package:flutter/material.dart';
import 'package:flutter_workshop/services/auth.service.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
    // AuthService().decodeUserId().then((value) => print('User login =====> $value'));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Profile'),
    );
  }
}