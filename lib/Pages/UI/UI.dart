import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_online/Pages/UX/HomePage.dart';
import 'package:food_online/Pages/UX/SideBar.dart';

import '../../NavigationBloc.dart';

class UI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(HomePage(login: true,)),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),  // always place sidebar with or inside blocProvider
          ],
        ),
      ),
    );
  }
}

