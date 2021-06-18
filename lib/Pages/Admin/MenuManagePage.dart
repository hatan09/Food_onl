import 'package:flutter/material.dart';
import 'package:food_online/Api/Api.dart';
import 'package:food_online/Models/Food/FoodGet.dart';
import 'package:food_online/Pages/Admin/AddDialog.dart';
import 'package:food_online/Pages/Admin/FoodInfo.dart';

class MenuManagePage extends StatefulWidget {
  @override
  _MenuManagePageState createState() => _MenuManagePageState();
}


class _MenuManagePageState extends State<MenuManagePage> {
  void onAddClick(BuildContext context){
    showDialog(
      context: context, barrierDismissible: false,
      builder : (BuildContext context) {
        return AddDialog();
      }
    );
  }

  List<FoodGet> foods;
  final TextEditingController searchTEC = new TextEditingController();

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => init());
  }

  Future init() async{
    final foods = await Api.getFood();

    setState(() {
      this.foods = foods;
    });
  }

  @override
  Widget build(BuildContext context) {

    void backToMainMenu() {
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(18.0),
            width: 1400.0,
            child: ListView.separated(
              itemCount: this.foods.length,
              itemBuilder: (context, index) {
                return FoodInfo(
                  id: foods[index].id,
                  image: NetworkImage(foods[index].imageURL),
                  title: foods[index].name,
                  price: foods[index].price,
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          VerticalDivider(
            endIndent: 10.0,
            indent: 10.0,
            color: Colors.grey,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MaterialButton(
                          onPressed: () {onAddClick(context);},
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(Icons.add, size: 40),
                                ),
                                TextSpan(
                                    text: " Add New Dish",
                                    style: TextStyle(
                                        fontSize: 20
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.green,
                          textColor: Colors.white,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(Icons.refresh, size: 40),
                                ),
                                TextSpan(
                                    text: " Refresh",
                                    style: TextStyle(
                                        fontSize: 20
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 30.0,
                  margin: EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {backToMainMenu();},
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(Icons.arrow_back_ios, size: 20),
                          ),
                          TextSpan(
                            text: "Back",
                            style: TextStyle(
                                fontSize: 18
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25.0, left: 10.0, right: 10.0),
                    child: TextField(
                      controller: this.searchTEC,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}

