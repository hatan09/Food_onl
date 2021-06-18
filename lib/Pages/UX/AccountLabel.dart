import 'package:flutter/material.dart';

class AccountLabel extends StatelessWidget {
  final ImageProvider avatar;
  final String name;
  final String email;

  AccountLabel(this.avatar, this.name, this.email);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              child: Image(
                image: this.avatar,
              ),
            ),
            ListTile(
              title: Text(
                this.name,
                style: TextStyle(),
              ),
              subtitle: Text(
                this.email,
                style: TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

