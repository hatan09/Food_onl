import 'package:flutter/material.dart';
import 'package:food_online/Api/Api.dart';

class EditDialog extends StatefulWidget {

  @override
  _EditDialogState createState() => _EditDialogState(

  );
}

class _EditDialogState extends State<EditDialog> {
  final TextEditingController nameTEC = new TextEditingController(),
                              priceTEC = new TextEditingController(),
                              imageURLTEC = new TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          // Login button
          TextButton(
            child: Text('Done'),
            onPressed: () async {

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
                    ]
                )
            )
        )
    );
  }
}

