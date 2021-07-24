import 'package:cash_manager/views/basket_view.dart';
import 'package:cash_manager/views/scanner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import "package:provider/provider.dart";

import 'package:cash_manager/themes/theme_changer.dart';
import 'package:cash_manager/views/home_view.dart';
import 'package:cash_manager/views/settings_view.dart';
import 'package:cash_manager/views/users_view.dart';
import 'package:cash_manager/dialogs/LoginDialog.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget{
  bool isConnected = false;

  getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    isConnected = prefs.getString('token') != null ? true : false;
    print( prefs.getString('token'));
  }

  @override
  Widget build(BuildContext context) {
    var _themeProvider = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image(image: ExactAssetImage('assets/img/logo.png')),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.home),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Home', textAlign: TextAlign.left)
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeView(themeProvider: _themeProvider)),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.settings),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Settings', textAlign: TextAlign.left)
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsView(themeProvider: _themeProvider)),
              );
            },
          ),
          ListTile(
            title: Text('Scanner'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScannerView()),
              );
            },
          ),
          ListTile(
            title: Text('Basket'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasketView()),
              );
            },
          ),
          ListTile(
            title: Text('Scanner'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScannerView()),
              );
            },
          )
        ],
      ),
    );
  }
}