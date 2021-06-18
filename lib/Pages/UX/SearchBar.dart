import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  TextEditingController TEC;
  String placeHolder;

  SearchBar({BuildContext context, TextEditingController TEC, String placeHolder}){
    if(TEC != null) this.TEC = TEC;
    else this.TEC = new TextEditingController();
    this.placeHolder = placeHolder;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      child: Container(
        child: this.SearchTextField(context),
      ),
    );
  }

  Widget SearchTextField(BuildContext context) =>
      TextField(
        controller: this.TEC,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          filled: true,
          prefixIcon: Icon(Icons.search),
          hintText: this.placeHolder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.none,
            ),
          ),
        ),
      );
}
