class FoodPost{
  final int storeId = 1;
  final String name;
  final double price;
  final String image;
  final String description;
  final int calories;
  final String prepareTime = '2021-12-12';


  FoodPost({this.name, this.price, this.image, this.description, this.calories});


  Map<String, dynamic> toJson() => {
    'storeId' : storeId,
    'name' : name,
    'price' : price,
    'image' : image,
    'description' : description,
    'calories': calories,
    'prepareTime' : prepareTime,
  };
}