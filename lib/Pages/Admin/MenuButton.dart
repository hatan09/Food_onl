import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPress;
  final String routeName;

  MenuButton({this.icon, this.title, this.onPress, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Column( // Receipt
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {Navigator.pushNamed(context, routeName);},
          color: Colors.red,
          textColor: Colors.white,
          child: Icon(
            this.icon,
            size: 50,
          ),
          padding: EdgeInsets.all(25),
          shape: CircleBorder(),
        ),
        Text(title,
          style: TextStyle(
              fontSize: 18.0
          ),
        )
      ],
    );
  }
}

