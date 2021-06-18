import 'package:flutter/material.dart';

class FocusDismisser extends StatelessWidget {
  BuildContext context;
  Widget childWidget;

  FocusDismisser({BuildContext context, Widget childWidget}){
    this.context = context;
    this.childWidget = childWidget;
  }

  @override
  Widget build(BuildContext contex) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: childWidget,
    );
  }
}

