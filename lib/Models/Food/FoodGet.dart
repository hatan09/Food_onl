class FoodGet {
  int id;
  String name;
  String description;
  String imageURL;
  double price;
  int size;
  int calories;
  String prepareTime;


  FoodGet(this.id, this.name, this.price, this.size, this.description, this.imageURL, this.calories, this.prepareTime);

  FoodGet.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    size = json['size'];
    description = json['description'];
    imageURL = json['image'];
    calories = json['calories'];
    prepareTime = json['prepareTime'];
  }
}
