import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget {
  final Function onLogin;
  LoginDialog({this.onLogin});

  @override
  _LoginDialogState createState() => _LoginDialogState(
    onLogin: (String username, String pass) async {
        return await this.onLogin(username, pass);
    }
  );
}

class _LoginDialogState extends State<LoginDialog> {
  bool isWrongInfo = false;
  final TextEditingController usernameTEC = new TextEditingController(),
                              passTEC = new TextEditingController();
  Function onLogin;
  _LoginDialogState({this.onLogin});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          // Login button
          TextButton(
              child: Text('Login'),
              onPressed: () async {
                bool success = await this.onLogin(this.usernameTEC.text, this.passTEC.text);
                if(!success){
                  setState(() {
                    this.isWrongInfo = true;
                  });
                }
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
        title: Text('Sign in '),
        content: SingleChildScrollView(
            child: Container(

                width: 300.0,
                child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            autofocus: true,
                            controller: usernameTEC,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'User Name'
                            ),
                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: TextField(
                            obscureText: true,
                            controller: passTEC,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password'
                            ),
                          )
                      ),
                      Visibility(
                        visible: isWrongInfo,
                        child: Text(
                          'Username or Password is not correct',
                          style: TextStyle(
                            color: Colors.red
                          ),
                        )
                      )
                    ]
                )
            )
        )
    );
  }
}

