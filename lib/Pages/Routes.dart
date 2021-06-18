import 'package:flutter/material.dart';
import 'package:food_online/Pages/UI/UI.dart';
import 'package:food_online/TokenHandler/TokenHandler.dart';

import 'Admin/Admin.dart';

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  String role;
  String username;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async{
    String Role;
    String _role = await TokenHandler.getString('role');
    setState(() {
      this.role = _role;
    });

    if(this.role != 'admin') {
      if(this.role == 'customer' ) {
        setState(() {
          Role = 'Customer';
        });
      }
      else if(this.role == 'employee')
      {
        setState(() {
          Role = 'Employee';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(role == 'customer') return UI();
      else if(role == 'admin') return Admin();
      else return Stranger(role: role);
    });
  }
}

class Stranger extends StatelessWidget {
  final String role;

  Stranger({this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('who are you $role ???', style: TextStyle(fontSize: 100),)));
  }
}
