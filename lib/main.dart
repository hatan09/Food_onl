// @dart=2.9
import 'package:flutter/material.dart';
import 'package:food_online/Pages/Routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Pages/UX/UX.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Online',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.red[700]
      ),
      //home: Scaffold(body: Admin(),),
      //home: UI(),
      home: UX(),
      routes: {
        '/route': (context) => Routes(),
      },
    );
  }
}

