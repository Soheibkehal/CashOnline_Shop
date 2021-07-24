import 'package:flutter/material.dart';

import 'package:cash_manager/components/custom_drawer.dart';
import 'package:cash_manager/components/custop_appbar.dart';

class UsersView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(title: 'Users'),
        body: Text('Hello World')
    );
  }

}