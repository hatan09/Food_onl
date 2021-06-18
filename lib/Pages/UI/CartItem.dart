import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final ImageProvider image;
  final String title;
  final Function remove;

  CartItem({this.image, this.title, this.remove});

  @override
  _CartItemState createState() => _CartItemState(this.image, this.title, this.remove);
}


class _CartItemState extends State<CartItem> {
  final ImageProvider image;
  final String title;
  final Function remove;
  var amount = 0;

  void add(){
    setState(() {
      this.amount++;
    });
  }

  void subtract(){
    setState(() {
      if(this.amount == 0) ;
      else this.amount--;
    });
  }

  _CartItemState(this.image, this.title, this.remove);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      padding: EdgeInsets.all(16.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: Colors.black,
            width: 1
        ),
      ),
      child: Row(
        children: [
          Expanded( // image
              child: Image(image: image)
          ),
          Expanded( // title
            flex: 3,
            child: Text(title)
          ),
          Expanded( // amount
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: this.subtract,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      ),
                      child: Icon(Icons.exposure_minus_1)
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    this.amount.toString(),
                    style: TextStyle(
                      backgroundColor: Colors.white
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  TextButton(
                      onPressed: this.add,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      ),
                      child: Icon(Icons.exposure_plus_1)
                  ),
                ],
              ),
            ),
          ),
          Expanded( // remove
            child: Container(
              child: TextButton(
                onPressed: this.remove,
                child: Text('Remove',
                  style: TextStyle(
                      color: Colors.blue
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

