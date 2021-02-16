import 'package:flutter/material.dart';
import 'package:flutter_workshop/services/auth.service.dart';
import 'package:flutter_workshop/tabs/tab_screen.dart';
import 'validators.dart' as validators;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
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
            Column(
              children: [
                TextFormField(
                  controller: this._usernameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Username',
                  ),
                  validator: (String value) => validators.validateIsEmpty(value),
                ),
                TextFormField(
                  controller: this._passwordController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Password',
                  ),
                  validator: (String value) => validators.validateIsEmpty(value),
                )
              ],
            ),
            RaisedButton(
              child: Text('Sign In'),
                onPressed: () {
                  this._formKey.currentState.save();
                  print(this._formKey.currentState.validate());
                  if (this._formKey.currentState.validate()) {
                    AuthService().onLogin(this._usernameController.text, this._passwordController.text).then((response) {
                      print(response);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TabScreen())
                      );
                    });
                  } else {
                    print('ยังไม่สมบูรณ์');
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
