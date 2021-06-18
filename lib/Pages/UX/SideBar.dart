import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_online/Api/Api.dart';
import 'package:food_online/TokenHandler/TokenHandler.dart';
import 'package:rxdart/rxdart.dart';

import '../../NavigationBloc.dart';
import 'SideBarLayout.dart';

// Note: Place this sidebar as (one of) child of a blocProvider

class SideBar extends StatefulWidget{
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{
  String name = "Nhat Tan";
  String email = "abc@gmail.com";

  final _animationDuration = Duration(milliseconds: 370);
  AnimationController _animationController;
  StreamController<bool> _streamController;
  Stream<bool> _stream;
  StreamSink<bool> _streamSink;
  final _sideBarWidth = 400.0;
  final _buttonWidth = 50.0;
  final _buttonHeight = 100.0;
  final _showWidth = 10.0;

  @override
  void initState() {
    super.initState();
    this._animationController = AnimationController(vsync: this, duration: _animationDuration);
    this._streamController = PublishSubject<bool>();
    this._stream = _streamController.stream;
    this._streamSink = _streamController.sink;

    init();
  }

  void init() async{
    var name = await TokenHandler.getString('name');
    if(name != null) setState(() {
      this.name = name;
    });
  }

  @override
  void dispose() {
    this._animationController.dispose();
    this._streamController.close();
    this._streamSink.close();
    super.dispose();
  }

  void onClick(){
    final animationStat = _animationController.status;
    final isAnimationCompleted = animationStat == AnimationStatus.completed;

    if(isAnimationCompleted){
      _streamSink.add(false);
      _animationController.reverse();
    }
    else{
      _streamSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: _stream,
      builder: (context, isOpenedAsync){
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isOpenedAsync.data ? 0 : - _sideBarWidth + _showWidth,
          right: isOpenedAsync.data ? (screenWidth - _sideBarWidth - _buttonWidth) :
                                      (screenWidth - _buttonWidth - _showWidth),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.red[700],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.5),
                        spreadRadius: 5.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 3), // changes position of shadow
                      )]
                ),
                width: _sideBarWidth,
                padding: EdgeInsets.all(15.0),

                child: Column(  // List of navigation
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SideBarLayout(
                      name: this.name,
                      email: this.email,
                      onAccountClick: () {
                        onClick();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.AccountClickEvent);
                      },
                      onHomeClick: (){
                        onClick();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickEvent);
                      },
                      onCartClick: (){
                        onClick();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.CartClickEvent);
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(  // open_close icon
                onTap: onClick,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.5),
                          spreadRadius: 0.0,
                          blurRadius: 6.0,
                          offset: Offset(6, 3), // changes position of shadow
                        )]
                  ),
                  width: _buttonWidth,
                  height: _buttonHeight,
                  alignment: Alignment.center,
                  child: AnimatedIcon(
                    progress: _animationController.view,
                    icon: AnimatedIcons.menu_arrow,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
  
}