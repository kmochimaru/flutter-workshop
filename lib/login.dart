import 'package:flutter/material.dart';
import 'package:flutter_workshop/tabs/tab_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.home,
            size: 100,
          ),
          Text(
            'Proceed with your',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Login',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          RaisedButton(
            child: Text('Sign In'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabScreen())
              )
          ),
        ],
      ),
    );
  }
}
