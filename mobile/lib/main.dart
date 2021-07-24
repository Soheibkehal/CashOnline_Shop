
import 'package:cash_manager/models/Cart.dart';
import 'package:cash_manager/models/Product.dart';
import 'package:cash_manager/redux/reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import "package:provider/provider.dart";
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cash_manager/themes/theme_changer.dart';
import 'package:cash_manager/components/custom_drawer.dart';
import 'package:cash_manager/components/custop_appbar.dart';

import 'package:cash_manager/dialogs/LoginDialog.dart';
import 'package:cash_manager/size_config.dart';
import 'package:cash_manager/interfaces/IUser.dart';

import 'package:cash_manager/views/home_view.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


void main() {
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger(lightTheme)),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final store = Store<List<Cart>>(cartItemsReducer, initialState: List());
    return StoreProvider<List<Cart>>(
        store: store,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cash Manager',
            theme: theme.getTheme,
            home: MyHomePage(title: 'Cash Manager - Accueil')
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {

  void changeTheme(ThemeChanger _themeProvider){
    _themeProvider.setTheme(_themeProvider.getTheme==lightTheme?darkTheme:lightTheme);
  }

  void setTheme(ThemeChanger _themeProvider, ThemeData theme){
    _themeProvider.setTheme(theme);
  }

  IUser connectedUser = new IUser(id: null, firstname: null, lastname: null, username: null, password: null, token: null, cash: null);
  bool isConnected = false;

  getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // connectedUser.firstname
    setState(() {
      connectedUser.username = prefs.getString('username');
      connectedUser.token = prefs.getString('token');

      String themeStr = prefs.getString('theme');
      ThemeData theme;

      if(themeStr == "darkTheme"){
        theme = darkTheme;
      } else {
        theme = lightTheme;
      }

      var _themeProvider = Provider.of<ThemeChanger>(context, listen: false);

      this.setTheme(_themeProvider, theme);
    });
  }

  @override
  void initState() {
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: widget.title),
      body: Column(
        children: <Widget>[
          Text('Hello World')
        ],
      ),
    );
  }
}

