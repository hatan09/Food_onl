import 'package:flutter/material.dart';
import 'package:food_online/Api/Api.dart';
import 'package:food_online/Models/Food/FoodPost.dart';

class AddDialog extends StatefulWidget {

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  Future done() async{
    if(nameTEC.text != null && priceTEC.text != null && caloTEC.text != null && imageURLTEC.text != null && desTEC.text != null) {
      var food = new FoodPost(
          name: nameTEC.text,
          price: double.parse(priceTEC.text),
          calories: int.parse(caloTEC.text),
          image: imageURLTEC.text,
          description: desTEC.text);

      await Api.addFood(food);
    }
  }

  final TextEditingController nameTEC = new TextEditingController(),
                              priceTEC = new TextEditingController(),
                              imageURLTEC = new TextEditingController(),
                              caloTEC = new TextEditingController(),
                              desTEC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          // Login button
          TextButton(
            child: Text('Done'),
            onPressed: () async {
              await done();
            },
          ),
          // Close button
          TextButton(
            child: new Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        title: Text('Edit Food Item'),
        content: SingleChildScrollView(
            child: Container(
                width: 600.0,
                child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            autofocus: true,
                            controller: nameTEC,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name'
                            ),
                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: priceTEC,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Price'
                            ),
                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: imageURLTEC,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'ImageURL'
                            ),
                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: caloTEC,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Calories'
                            ),
                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            controller: desTEC,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Description'
                            ),
                          )
                      ),
                    ]
                )
            )
        )
    );
  }
}

