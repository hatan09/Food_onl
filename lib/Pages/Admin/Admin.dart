import 'package:flutter/material.dart';
import 'package:food_online/NavigationBloc.dart';
import 'package:food_online/Pages/Admin/AdminHomePage.dart';
import 'package:food_online/Pages/Admin/MenuManagePage.dart';

import '../../NestedNavigator.dart';

class Admin extends StatelessWidget with NavigationStates{
  final _navigatorKey = GlobalKey<NavigatorState>();



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: NestedNavigator(
          navigationKey: _navigatorKey,
          initialRoute: '/',
          routes: {
            '/' : (context) => AdminHomePage(),
            '/menu': (context) => MenuManagePage(),
          },
        ),
      ),
    );
  }
}
