import 'package:cash_manager/components/CardItemCard.dart';
import 'package:cash_manager/models/Cart.dart';
import 'package:cash_manager/size_config.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import 'package:cash_manager/themes/theme_changer.dart';
import 'package:cash_manager/components/custom_drawer.dart';
import 'package:cash_manager/components/custop_appbar.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cash_manager/models/Product.dart';

class BasketView extends StatelessWidget {
  BasketView({this.themeProvider});

  final ThemeChanger themeProvider;

  void changeTheme(ThemeChanger _themeProvider) {
    _themeProvider.setTheme(
        _themeProvider.getTheme == lightTheme ? darkTheme : lightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(title: 'Basket'),
        body: StoreConnector<List<Cart>, List<Cart>>(
          converter: (store) => store.state,
          builder: (context, list) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(list[index].product.id.toString()),
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CardItemCard(cart: list[index]),
                  ),
                )
            ),
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0x00000000)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Color(0x00000000)),
            label: '',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "Your transaction was successful!",
          );
        },
      ),
    );
  }
}
