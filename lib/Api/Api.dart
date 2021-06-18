import 'dart:convert';
import 'package:food_online/Models/Food/FoodGet.dart';
import 'package:food_online/Models/Food/FoodPost.dart';
import 'package:http/http.dart' as http;

// var url = 'https://school-management-api.azurewebsites.net/api/';
final url = 'https://localhost:44382/api/';

class Api {
  static Uri createUrl(String controller) {
    var _url = Uri.parse(url + controller);
    return _url;
  }

  static Future post(Object body, Uri url) async {
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    return response;
  }

  static Future get(Uri url) async {
    final response = await http.get(url);
    return response;
  }

  static Future update(Object body,Uri url) async {
    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body
    );
    return response;
  }

  static Future delete(Uri url) async {
    final response = await http.delete(url);
    return response;
  }

  //---------------------- Api ----------------------

  static Future login(String username, String pass) async {
    var _url = Uri.parse(url + 'Auth/Login');
    final response = await http.post(
      (_url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName': username,
        'password': pass,
      }),);
    return response;
  } // login


  static Future register(String username, String pass, String phone) async {
    var _url = createUrl('Customer/Create');
    var body = jsonEncode(<String, String>{
      'userName': username,
      'password': pass,
      'phoneNumber': phone
    });

    final response = await post(body, _url);
    return response;
  } // register


  static Future<List<FoodGet>> getFood({int storeId = 1}) async {
    var _url = createUrl('Food/GetAllByStore/$storeId');
    final response = await get(_url);
    var data = jsonDecode(response.body);
    List<FoodGet> foods = [];
    for(var c in data)
    {
      FoodGet _foodGet = FoodGet.fromJson(c);
      foods.add(_foodGet);
    }
    return foods;
  } // getFood


  static Future<FoodGet> getFoodById({int id}) async {
    var _url = createUrl('Food/GetById/$id');
    final response = await get(_url);
    var data = jsonDecode(response.body);
    FoodGet _foodGet = FoodGet.fromJson(data);
    return _foodGet;
  } // getFoodById


  static Future addFood(FoodPost food) async {
    var _url = createUrl('Food/Create');

    final response = await post(jsonEncode(food.toJson()), _url);
    return response;
  } // create


  static Future deleteFood({int id}) async{
    var _url = createUrl('Food/DeleteById/$id');

    final response = await delete(_url);
    return response;
  }


  static Future<List<FoodGet>> getPromotion({int storeId = 1}) async {
    var _url = createUrl('Food/GetPromoteFood/$storeId');
    final response = await get(_url);
    var data = jsonDecode(response.body);
    List<FoodGet> foods = [];
    for(var c in data)
    {
      FoodGet _foodGet = FoodGet.fromJson(c);
      foods.add(_foodGet);
    }
    return foods;
  } // getPromotion



}
