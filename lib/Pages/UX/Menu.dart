import 'package:flutter/material.dart';
import 'package:food_online/Api/Api.dart';
import 'package:food_online/Models/Food/FoodGet.dart';
import 'package:food_online/Pages/UX/FoodCard.dart';

class Menu extends StatefulWidget{

  final Function login;

  @override
  State<StatefulWidget> createState() => MenuState();

  Menu({this.login});
}

class MenuState extends State<Menu>{
  List<FoodGet> foods;

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => init());
  }

  Future init() async{
    final foods = await Api.getFood();

    setState(() {
      this.foods = foods;
      print(foods.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size;

    return LayoutBuilder(
      builder: (context, constraint) {
        if(constraint.maxWidth >= 1200.0) size = 3;
        else if(constraint.maxWidth < 1200.0 && constraint.maxWidth >= 650.0) size = 2;
        else if(constraint.maxWidth < 650.0) size = 1;
        return Container(
          width: constraint.biggest.width,
          child: GridView.count(
            childAspectRatio: 0.6,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,

            crossAxisCount: size,

            crossAxisSpacing: 10, mainAxisSpacing: 10,

            children: foods.map((food) => new FoodCard(
              id: food.id,
              title: food.name,
              price: food.price,
              content: food.description,
              image: NetworkImage(food.imageURL),
            )).toList(),
          ),
        );
      }
    );
  }

}
