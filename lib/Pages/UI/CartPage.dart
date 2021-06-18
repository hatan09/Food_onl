import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_online/Api/Api.dart';
import 'package:food_online/Models/Food/FoodGet.dart';
import 'package:food_online/NavigationBloc.dart';
import 'package:food_online/Pages/Admin/AddDialog.dart';
import 'package:food_online/Pages/UI/CartItem.dart';
import 'package:food_online/TokenHandler/TokenHandler.dart';

class CartPage extends StatefulWidget with NavigationStates {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void onAddClick(BuildContext context){
    showDialog(
        context: context, barrierDismissible: false,
        builder : (BuildContext context) {
          return AddDialog();
        }
    );
  }

  List<FoodGet> list = new List<FoodGet>.empty();

  Future init() async{
    var ids = await TokenHandler.getStringList('orderedFood');

    ids.forEach((id) async {
      FoodGet food = await Api.getFoodById(id: int.parse(id));
      setState(() {
        print(list.length);
        this.list.add(food);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    init();
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
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          width: 1200.0,
          child: SingleChildScrollView(
            child: Column(
              children: this.list.map((food) =>
                CartItem(
                  image: NetworkImage(food.imageURL),
                  title: food.name,
                  remove: () {},
                ),
              ).toList()
            ),
          ),
        ),
      ),
    );
  }
}
