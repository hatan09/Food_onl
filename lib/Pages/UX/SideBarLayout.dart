import 'package:flutter/material.dart';
import 'package:food_online/Pages/UX/SideBarItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideBarLayout extends StatelessWidget {
  final String name;
  final String email;
  final Function onHomeClick, onAccountClick, onCartClick, onOrderClick, onSignOutClick;

  SideBarLayout({this.name, this.email,
              this.onHomeClick,
              this.onAccountClick,
              this.onCartClick,
              this.onOrderClick,
              this.onSignOutClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              onTap: onAccountClick,
              title: Text(
                this.name,
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w800),
              ),
              subtitle: Text(
                this.email,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              leading: CircleAvatar(
                child: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                radius: 40,
              ),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.grey.withOpacity(0.5),
              height: 50.0,
            ),
            SideBarItem(  // Home
              onTap: onHomeClick,
              title: 'Home',
              icon: Icons.home,
            ),
            SideBarItem(  // Cart
              onTap: onCartClick,
              title: 'Cart',
              icon: Icons.shopping_cart,
            ),
            SideBarItem(  // Order
              onTap: onOrderClick,
              title: 'Orders',
              icon: Icons.assignment_outlined,
            ),
            SideBarItem(  // Sign out
              onTap: onSignOutClick,
              title: 'Sign out',
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
