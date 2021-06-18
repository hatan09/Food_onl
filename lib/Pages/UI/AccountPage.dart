import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_online/TokenHandler/TokenHandler.dart';
import '../../NavigationBloc.dart';

class AccountPage extends StatelessWidget with NavigationStates {

  String fullName, username, email;

  Function onPasswordChange;
  Function onPhoneChange;
  Function onAddressAdd;
  Function onAddressChange;

  AccountPage() {
     init();
  }

  Future init() async {
    this.fullName = await TokenHandler.getString('fullname');
    this.email = await TokenHandler.getString('email');
    this.username = await TokenHandler.getString('name');
    if(this.fullName == null) fullName = 'Full Name';
    if(this.email == null) email = 'abc@gmail.com';
    if(this.username == null) username = 'username';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        shadowColor: Colors.red,
        backgroundColor: Colors.red[700],
        toolbarHeight: 100,
        centerTitle: true,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 75.0,
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickEvent);
                  },
                  child: Image.asset('logo_pc.png'),
                )
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              color: Colors.white,
              alignment: Alignment.topLeft,
              width: 1200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( // Title
                    "My Profile",
                    style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.grey,
                    height: 30.0,
                  ),
                  Row(  // Full Name
                    children: [
                      Expanded( // Title
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            this.fullName,
                            style: TextStyle(color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded( // Content
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(this.fullName,
                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(  // Username
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Username",
                            style: TextStyle(color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            this.username,
                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(  // Email
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Email",
                            style: TextStyle(color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            this.email,
                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(  // Password
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Password",
                            style: TextStyle(color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                "****************",
                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              TextButton(
                                  onPressed: onPasswordChange,
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                  ),
                                  child: Text(
                                    'change password',
                                    style: TextStyle(
                                        color: Colors.blue[900], fontSize: 15, fontWeight: FontWeight.w100
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

