import 'package:flutter/material.dart';
import 'package:food_online/Api/Api.dart';

class FoodInfo extends StatelessWidget {
  final int id;
  final ImageProvider image;
  final String title;
  final double price;

  void onEdit(){}

  void onRemove(){

  }

  FoodInfo({this.id, this.image, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        children: [
          Expanded(
            child: Image(image: image,)
          ),
          Expanded(
            flex: 2,
            child: Text(title)
          ),
          Expanded(
            flex: 2,
              child: Text(price.toString())
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(Icons.edit, size: 14),
                    ),
                    TextSpan(
                      text: " Edit",
                    ),
                  ],
                ),
              ),
            )
          ),
          Expanded(
              child: TextButton(
                onPressed: () {Api.deleteFood(id: this.id);},
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(Icons.delete, size: 14),
                      ),
                      TextSpan(
                        text: " Remove",
                      ),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}

