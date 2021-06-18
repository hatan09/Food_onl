//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food_online/TokenHandler/TokenHandler.dart';

class FoodCard extends StatelessWidget {
  final int id;
  final ImageProvider image;
  final String title;
  final double price;
  final String content;

  FoodCard({@required  this.id,
          this.image = const AssetImage('logo_pc.png'),
          this.title = 'Food',
          this.price = 0,
          this.content = 'This is delicious. You Must Try It!'});

  void onAdd() async{
    var list = await TokenHandler.getStringList('orderedFood');

    if(list.indexOf(this.id.toString()) == -1) { list.add(this.id.toString()); print(list.length);}

    TokenHandler.setStringList('orderedFood', list);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 8.0,
            offset: Offset(6, 6), // changes position of shadow
          )
        ],
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container( //Image
              child: Image(
                fit: BoxFit.fill,
                image: image,
              ),
            ),

            Container(  // Title
              height: 40.0,
              margin: EdgeInsets.fromLTRB(12.0, 25.0, 12.0, 0.0),
              child: Text(this.title,
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w800),),
            ),

            Container(  // Price
              height: 20.0,
              margin: EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 20.0),
              child: Text(this.price.toString() + ' VND',
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),),
            ),

            Expanded( //Info
              child: Container(
                height: 70.0,
                margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 8.0),
                padding: EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Text(content),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),

            Container( //Action
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(  //  Add
                      onPressed: () async {onAdd();},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red[700]),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart),
                            SizedBox(width: 5.0),
                            Text('Add')
                          ],
                        ),
                      ),
                    )
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                      child: ElevatedButton(  // Like
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red[700]),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(width: 5.0),
                              Text('Favorite')
                            ],
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

