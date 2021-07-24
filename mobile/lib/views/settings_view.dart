import 'package:cash_manager/dialogs/LoginDialog.dart';
import 'package:cash_manager/interfaces/IUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cash_manager/themes/theme_changer.dart';
import 'package:cash_manager/components/custom_drawer.dart';
import 'package:cash_manager/components/custop_appbar.dart';

class SettingsView extends StatelessWidget{

  SettingsView({Key key, this.themeProvider}) : super(key: key);

  final ThemeChanger themeProvider;

  void changeTheme(ThemeChanger _themeProvider){
    _themeProvider.setTheme(_themeProvider.getTheme==lightTheme?darkTheme:lightTheme);
  }

  void setSettings(String theme) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
  }

  disconnect(context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
    Phoenix.rebirth(context);
  }

  IUser connectedUser = new IUser(id: null, firstname: null, lastname: null, username: null, password: null, token: null, cash: null);
  bool isConnected = false;

  getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    connectedUser.username = prefs.getString('username');
    connectedUser.token = prefs.getString('token');

    if (connectedUser.token != null){
      isConnected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    this.getUserData();
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(title: 'Settings'),
        body: Column(children: <Widget>[
          Row(
            children: <Widget> [
              Expanded(
                  child: CheckboxListTile(
                    title: themeProvider.getTheme==lightTheme ? Text("Light theme") : Text("Dark theme"),
                    secondary: Icon(Icons.lightbulb),
                    controlAffinity: ListTileControlAffinity.platform,
                    value: themeProvider.getTheme==lightTheme ? true: false,
                    onChanged: (bool value){
                      if (value){
                        themeProvider.setTheme(lightTheme);
                        this.setSettings("lightTheme");
                      } else {
                        themeProvider.setTheme(darkTheme);
                        this.setSettings("darkTheme");
                      }
                    },
                    activeColor: Colors.blue,
                    checkColor: Colors.black,
                  )
              ),
            ],
          ),
          Row(
            children: <Widget> [
              Expanded(
                  child: isConnected == false ? RaisedButton(
                    child: Text('Login'),
                    onPressed: () async => {
                      await showDialog(
                      context: context,
                      builder: (_) {
                        return LoginDialog(mainContext: context);
                      }).then((value) => {
                        Phoenix.rebirth(context)
                      })
                    },
                  ) : RaisedButton(
                    child: Text('Logout'),
                    onPressed: () async => {
                      disconnect(context)
                    },
                  ),
              ),
            ],
          )
        ])

    );
  }

}