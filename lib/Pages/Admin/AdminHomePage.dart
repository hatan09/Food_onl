import 'package:flutter/material.dart';

import 'MenuButton.dart';

class AdminHomePage extends StatelessWidget {
  final screenWidth = 700.0;
  final screenHeight = 500.0;

  @override
  Widget build(BuildContext context) {
    final ratio = this.screenWidth / this.screenHeight;

    return Container(
        alignment: Alignment.center,
        child: Container(
          color: Colors.white,
          width: screenWidth,
          height: screenHeight,
          child: GridView.count(
            childAspectRatio: ratio,
            crossAxisCount: 2,
            children: [
              MenuButton( // Menu
                routeName: '/menu',
                icon: Icons.menu_book,
                title: 'Manage Menu',
              ),
              MenuButton( // Receipt
                routeName: '/menu',
                icon: Icons.card_giftcard,
                title: 'Manage Promotion',
              ),
              MenuButton( //
                icon: Icons.receipt_long,
                title: 'Manage Receipt',
              ),
              MenuButton( //
                icon: Icons.logout,
                title: 'Sign Out',
              ),
            ],
          ),
        )
    );
  }
}

