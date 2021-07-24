import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginDialog extends StatefulWidget {
  BuildContext mainContext;

  @override
  _LoginDialogState createState() => new _LoginDialogState();

  LoginDialog({this.mainContext});
}

class _LoginDialogState extends State<LoginDialog> {
  final _formKey = GlobalKey<FormState>();

  String username;
  String password;
  String token;

  void setDatas(username, token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('username', username); // TODO: Change save firstname and lastname
    prefs.setString('token', token);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      content:Form(
          key: _formKey,
          child: Container(
              height: 150.0,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    )
                  ]
              )
          )
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Login'),
            onPressed: () => setState(() async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                Map data = {
                  'username': username,
                  'password': password,
                };

                var body = jsonEncode(data);

                var url = "http://10.0.2.2:8080/login";
                http.Response response = await http.post(
                    url,
                    headers: {"Content-Type": "application/json"},
                    body: body
                );
                var token = response.body;

                if (response.statusCode == 200){
                  this.setDatas(username, token);
                  Navigator.pop(context, true);
                }
              }
            }))
      ],
    );
  }
}