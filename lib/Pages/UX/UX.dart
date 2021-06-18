import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:food_online/Api/Api.dart';
import 'package:food_online/Pages/UX/HomePage.dart';
import 'package:food_online/TokenHandler/TokenHandler.dart';

class UX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loginHandle({String username, String pass}) async{
      var response = await Api.login(username, pass);
      final auth = jsonDecode(response.body);
      print(auth.toString());
      if(response.statusCode == 200)
      {
        TokenHandler.setString('token', auth['token']);
        var role = auth['role'];

        await TokenHandler.setString('role', role);
        await TokenHandler.setString('name', auth['name']);
        await TokenHandler.setStringList('orderedFood', new List<String>.empty());

        // Go
        Navigator.pushNamed(context,'/route');
        return Future<bool>.value(true);
      }
      return Future<bool>.value(false);
    }

    return WillPopScope(
      onWillPop: (){
        return Future.value(true);
      },
      child: HomePage(onLogin: (String username, String pass) {
        return loginHandle(username: username, pass: pass);
      }),
    );
  }
}
