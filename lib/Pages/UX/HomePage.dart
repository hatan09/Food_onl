import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_online/Pages/UX/LoginDialog.dart';
import 'package:food_online/Pages/UX/Menu.dart';
import 'package:food_online/Pages/UX/SearchBar.dart';

import '../../FocusDismisser.dart';
import '../../NavigationBloc.dart';

class HomePage extends StatelessWidget with NavigationStates{
  final Function onLogin;
  bool login;

  HomePage({this.onLogin, this.login = false});

  void onLoginClick(BuildContext context){
    showDialog(
        context: context, barrierDismissible: false,
        builder : (BuildContext context) {
          return LoginDialog(onLogin: (String username, String pass) async {
            return await this.onLogin(username, pass);
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return FocusDismisser(
        context: context,
        childWidget: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            shadowColor: Colors.red,
            backgroundColor: Colors.red[700],
            toolbarHeight: 100,
            centerTitle: true,

            title: Image.asset('logo_pc.png'),

            actions: [
              (login)? Container(child: Icon(Icons.person),) : Container(
                height: 15.0,
                width: 100.0,
                child: TextButton(
                  onPressed: () {onLoginClick(context);},
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: Text('Login',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 75),
                  width: 1200.0,
                  child: Menu(
                    login: () {onLogin();}
                  ),
                ),
                SearchBar(
                  context: context,
                  TEC: null,
                  placeHolder: 'Wanna a \'Crispy Chicken Leg\' ?',
                ),
              ],
            ),
          )
        )
    );
  }
}
