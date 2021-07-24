import 'package:cash_manager/main.dart';
import 'package:cash_manager/models/Cart.dart';
import 'package:cash_manager/models/Product.dart';
import 'package:cash_manager/redux/actions.dart';
import 'package:flutter/material.dart';

import 'package:cash_manager/themes/theme_changer.dart';
import 'package:cash_manager/components/custom_drawer.dart';
import 'package:cash_manager/components/custop_appbar.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeView extends StatelessWidget{

  HomeView({this.themeProvider});

  final ThemeChanger themeProvider;

  void changeTheme(ThemeChanger _themeProvider){
    _themeProvider.setTheme(_themeProvider.getTheme==lightTheme?darkTheme:lightTheme);
  }

  @override
  Widget build(BuildContext context) {

    void getProduct(int id) async {
      print(id);
      var url = "http://10.0.2.2:8080/products/$id";
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjMiLCJleHAiOjE2MDc5MjQ1ODEsImlhdCI6MTYwNzg4ODU4MX0.r8EbanaEamM8BEe9VGtc24QMP7Am4kyEQ7bbjqzv37w',
      });
      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        final product = Product(id: id, name: jsonResponse['productname'], price: jsonResponse['price'], image: "assets/images/ps4_console_white_1.png");
        final cart = Cart(product: product, numOfItems: 1);

        final store = StoreProvider.of<List<Cart>>(context);

        store.dispatch(AddItemAction(cart));
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }

    return Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(title: 'Home'),
        body: Container(
          child: FlatButton(
            onPressed: () {
              getProduct(1);
            },
            child: Text("Add product [ID: 1]"),
          ),
        )
    );
  }

}